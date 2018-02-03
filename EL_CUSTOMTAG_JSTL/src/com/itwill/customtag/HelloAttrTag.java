package com.itwill.customtag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class HelloAttrTag extends TagSupport {
	
	private String name;
	
	public void setName(String name) {
		System.out.println("0. HelloAttrTag.setName(" + name +")");
		this.name = name;
	}
	
	@Override
	public int doStartTag() throws JspException {
		System.out.println("1. HelloAttrTag.doStartTag()");
		try {
			pageContext.getOut().print("<h3>Hello!!! " + name + "님</h3>");
		} catch (IOException e) {
			e.printStackTrace();
			throw new JspException(e.getMessage());
		}
		return SKIP_BODY;
	}

	@Override
	public int doEndTag() throws JspException {
		System.out.println("2. HelloAttrTag.doEndTag()");
		try {
			pageContext.getOut().print("<hr/>");
		} catch (IOException e) {
			e.printStackTrace();
			throw new JspException(e.getMessage());
		}
		return super.doEndTag();
	}

	
}
