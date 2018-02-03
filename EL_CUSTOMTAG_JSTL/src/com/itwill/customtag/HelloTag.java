package com.itwill.customtag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class HelloTag extends TagSupport {

	public HelloTag() {
		System.out.println("0. HelloTag() 생성자");
	}

	@Override
	public int doStartTag() throws JspException {
		System.out.println("1. doStartTag()");
		try {
			pageContext.getOut().print("<h3>Hello!!! Guest님</h3>");
		} catch (IOException e) {
			e.printStackTrace();
			throw new JspException(e.getMessage());
		}
		return SKIP_BODY;
	}

	@Override
	public int doEndTag() throws JspException {
		System.out.println("2. doEndTag()");
		try {
			pageContext.getOut().print("<hr/>");
		} catch (IOException e) {
			e.printStackTrace();
			throw new JspException(e.getMessage());
		}
		return super.doEndTag();
	}

}
