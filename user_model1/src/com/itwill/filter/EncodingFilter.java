package com.itwill.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter {
	private String encoding;

	public EncodingFilter() {
		//System.out.println("0. EncodingFilter() 생성자");
	}

	/**
	 * web.xml에서 전달된 인코딩 값을 초기화하는 메써드.
	 * <init-param>
			<param-name>encoding</param-name>
			<param-value>UTF-8</param-value>
		</init-param>
	 */
	public void init(FilterConfig filterConfig) throws ServletException {
		this.encoding = filterConfig.getInitParameter("encoding");
		//System.out.println("1. Encoding init() : " + encoding);

	}

	/**
	 * ServletRequest객체에 web.xml에서 전달된 인코딩을 설정하는 메써드.
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding(encoding);
		long startTime = System.currentTimeMillis();
		chain.doFilter(request, response);
		long endTime = System.currentTimeMillis();
		System.out.println(">> it tooks " + (endTime - startTime) + " mills!");
		//System.out.println("2. Encoding doFilter()");
	}

	public void destroy() {
		//System.out.println("3. Encoding doDestroy()");
	}

}
