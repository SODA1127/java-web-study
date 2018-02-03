package com.itwill.filter;



import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


public class EncodingFilter implements Filter {
	private String encoding = null;
	protected FilterConfig filterConfig = null;
	public void destroy() {
		//System.out.println("Filter.destroy()");
		this.encoding = null;
		this.filterConfig = null;

	}

	/**
	 * ServletRequest��ü�� web.xml���� ���޵� ���ڵ��� �����ϴ� �޽��.
	 */
	public void doFilter(
		ServletRequest request,
		ServletResponse response,
		FilterChain chain)
		throws IOException, ServletException {
		//System.out.println("doFilter start");
		if (request.getCharacterEncoding() == null) {
			if (encoding != null) {
				request.setCharacterEncoding(encoding);
			}
		}
		chain.doFilter(request, response);
		//System.out.println("doFilter end");
	}

	/**
	 * web.xml���� ���޵� ���ڵ� ���� �ʱ�ȭ�ϴ� �޽��.
	 */
	public void init(FilterConfig filterConfig) throws ServletException {
		//System.out.println("Filter.init()");
		this.filterConfig = filterConfig;
		this.encoding = filterConfig.getInitParameter("encoding");
	}

	public FilterConfig getFilterConfig() {
		return filterConfig;
	}

	public void setFilterConfig(FilterConfig cfg) {
		filterConfig = cfg;
	}
}
