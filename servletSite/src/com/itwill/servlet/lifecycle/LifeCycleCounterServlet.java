package com.itwill.servlet.lifecycle;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LifeCycleCounterServlet
 */
// urlPatterns = 굳이쓰지 않아도 됨
@WebServlet(urlPatterns = "/lifecycle.do")
public class LifeCycleCounterServlet extends HttpServlet {
	PrintWriter pw;
	BufferedReader br;
	private int count = 0;
	int[] countArray;
	String n;

	public LifeCycleCounterServlet() {
		System.out.println("0. LifeCycleCounterServlet() 기본생성자");
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	/*
	 * ♠ void init(ServletConfig config) : 서블릿이 메모리에 로딩되고(객체생성), 서블릿이 초기화되기 위해 한번만
	 * 호출된다. 서블릿에 필요한 초기화 작업이 이루어진다.
	 */
	@Override
	public void init() throws ServletException {
		// super.init() 메소드는 지우지 않음
		super.init();
		System.out.println("1.init()");
		try {
			br = new BufferedReader(
					new FileReader("/Users/leekijung/Documents/eclipse-workspace/servletSite/count.txt"));
			if(!br.equals("")) {
				n = br.readLine();
				count = Integer.parseInt(n);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		++count;
		n = String.valueOf(count);
		countArray = new int[n.length()];
		System.out.println("2.service() : " + request.getRemoteAddr() + " 요청" + Thread.currentThread().getName() + " 쓰레드");
		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body bgcolor=#40e0d0 style=font-size:9pt;line-height:140%;>");
		out.println("<center>");
		out.println("현재까지의 페이지뷰 수 는");
		out.println("<font color=#0000FF>");
		for (int i = 0; i < countArray.length; i++) {
			out.println("<img src = 'counterImage/" + n.charAt(i) + ".png'>");
		}
		out.println("</font>");
		out.println(" 번입니다 ");
		out.println("</center> ");
		out.println("</body> ");
		out.println("</html>");
	}

	/*
	 * ♠ void destroy() : 서블릿이 언로드될 때 서블릿엔진(자카르타톰캣)에 의해 호출된다. 서블릿이 사용하던 모든 자원을 해제
	 * 하도록 하자.
	 */
	@Override
	public void destroy() {
		PrintWriter pw;
		try {
			pw = new PrintWriter("/Users/leekijung/Documents/eclipse-workspace/servletSite/count.txt");
			pw.write(n);
			pw.flush();
			pw.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// super.destroy(); 호출할 필요 없음
		System.out.println("3. destroy()");
	}

}
