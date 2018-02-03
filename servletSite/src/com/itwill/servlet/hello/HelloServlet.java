package com.itwill.servlet.hello;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//#1. javax.servlet.http.HttpServlet 클래스를 상속 받아야한다.
public class HelloServlet extends HttpServlet {
	// #2. HttpServlet service 메쏘드를 오버라이딩 해야한다.
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// #2-1. 클라이언트에 전송할 데이타의 타입(종류)설정 - 응답헤더
		response.setContentType("text/html;charset=EUC-KR");
		// #2-2. 클라이언트에 데이타를 전송하기위한 출력스트림 생성
		PrintWriter out = response.getWriter();
		// #2-3. 클라이언트로 데이타(HTML) 전송 --> 응답바디
		for (int i = 1; i <= 10; i++) {
			out.println("<h3>Hello [안녕] Servlet!![" + i + "]" + new Date().toLocaleString() + "</h3><hr>");
		}
	}
}
