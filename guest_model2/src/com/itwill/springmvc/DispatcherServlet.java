package com.itwill.springmvc;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DispatcherServlet extends HttpServlet {
	HandlerMapping handlerMapping;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		/*
		 * web.xml에 설정된 파라메타읽기(설정파일이름,위치)
		 * <init-param>
		 * <param-name>configFile</param-name>
		 * <param-value>/WEB-INF/controller_mapping.properties</param-value>
		 * </init-param>
		 */
		String configFile = config.getInitParameter("configFile");
		ServletContext application = config.getServletContext();
		// ServletContext application = this.getServletContext();
		configFile = application.getRealPath(configFile);
		System.out.println("confileFile:" + configFile);
		this.handlerMapping = new HandlerMapping(configFile);

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1.클라이언트의 요청분석
		 * 
		 */
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		System.out.println("요청 command:" + command);
		/*
		 * 2-1.클라이언트의 요청에따른업무실행객체(Controller객체)생성
		 */
		Controller controller = handlerMapping.getController(command);

		/*
		 * 2-2.클라이언트의 요청에따른업무실행객체실행
		 */

		String path = controller.handleRequest(request, response);
		/*
		 * forward:path.jsp redirect:path.do
		 */
		boolean isRedirect = false;
		String[] pathArray = path.split(":");
		if (pathArray[0].equals("redirect")) {
			isRedirect = true;
		}
		String forwardPath = pathArray[1];
		/*
		 * 3. 클라이언트 forward,redirect
		 */
		if (isRedirect) {
			response.sendRedirect(forwardPath);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/" + forwardPath);
			rd.forward(request, response);
		}
	}
}
