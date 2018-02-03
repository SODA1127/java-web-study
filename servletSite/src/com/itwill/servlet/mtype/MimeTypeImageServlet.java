package com.itwill.servlet.mtype;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MimeTypeImageServlet
 */
@WebServlet("/mime_type_image.do")
public class MimeTypeImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   @Override
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   response.setContentType("image/jpeg");
	   OutputStream out = response.getOutputStream();
	   String contextRealPath = request.getRealPath("/images/theenter.jpg");
	   System.out.println(contextRealPath);
	   FileInputStream fis = new FileInputStream(contextRealPath);
	   while (true) {
		   int readByte = fis.read();
		   if(readByte == -1) break;
		   out.write(readByte);
	   }
	   fis.close();
}

}
