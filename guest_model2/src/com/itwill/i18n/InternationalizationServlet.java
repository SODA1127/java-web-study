package com.itwill.i18n;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InternationalizationServlet
 */
@WebServlet("/i18n.do")
public class InternationalizationServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter out=response.getWriter();
		
		Locale defaultLocale = Locale.getDefault();
		Locale requestLocale = request.getLocale();
		Locale usLocale=new Locale("en", "US");
		Locale jpLocale=new Locale("ja", "JP");
		
		Locale locale = requestLocale;
		
		String language=locale.getLanguage();
		String country=locale.getCountry();
		ResourceBundle rb = 
				ResourceBundle.getBundle("com/itwill/i18n/guest",locale);
		
		out.println("<h1>Servlet I18N["+language+"_"+country+"]</h1><hr/>");
		out.println("<ol>");
		out.println("<li>"+rb.getString("title.main")+"</li>");
		out.println("<li>"+rb.getString("title.view")+"</li>");
		out.println("<li>"+rb.getString("title.write")+"</li>");
		out.println("<li>"+rb.getString("title.main")+"</li>");
		out.println("<li>"+rb.getString("write.label.name")+"</li>");
		out.println("<li>"+rb.getString("write.label.homepage")+"</li>");
		out.println("<li>"+rb.getString("write.label.email")+"</li>");
		out.println("<li>"+rb.getString("write.label.title")+"</li>");
		out.println("</ol>");

		
	}

}










