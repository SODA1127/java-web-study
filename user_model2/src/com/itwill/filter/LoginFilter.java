package com.itwill.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter{
	
	public LoginFilter() {
		//System.out.println("0. LoginFilter() 생성자");
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//System.out.println("1. Login init() : " + encoding);
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		//System.out.println("2. login doFilter()");
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		
		String[] paths = {"/user_login","/user_write", "/user_main"};
		
		String requestURI = request.getRequestURI();
		//System.out.println("requestURI : " + requestURI);
		String contextPath = request.getContextPath();
		//System.out.println("requestContext : " + contextPath);
		String path = requestURI.substring(contextPath.length());
		//System.out.println("path : " + path);
		
		boolean excludePath = false;
		for (int i = 0; i < paths.length; i++) {
			if(path.startsWith(paths[i])) {
				excludePath = true;
				break;
			}
		}
		
		HttpSession session = request.getSession();
		String sUserId = (String)session.getAttribute("sUserId");
		//boolean isLogin = (sUserId != null);
		boolean isLogin = false;
		if(sUserId != null) {
			isLogin = true;
		}
		if(isLogin || excludePath) {
			long startTime = System.currentTimeMillis();
			chain.doFilter(req, res);
			long endTime = System.currentTimeMillis();
			System.out.println(">>" + path + "tooks " + (endTime - startTime) + " mills!");
		}else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원전용 컨텐츠입니다. 로그인하세요 [LOGIN FILTER]')");
			out.println("location.href='user_login_form.jsp';");
			out.println("</script>");
		}
		
	}

	@Override
	public void destroy() {
		//System.out.println("3. Login doDestroy()");
	}
}
