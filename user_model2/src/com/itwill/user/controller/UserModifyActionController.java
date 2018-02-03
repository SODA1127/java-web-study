package com.itwill.user.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.springmvc.Controller;
import com.itwill.user.User;
import com.itwill.user.UserService;
import com.itwill.user.exception.ExistedUserException;

public class UserModifyActionController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath="";
		
		if(request.getMethod().equalsIgnoreCase("GET")){
			forwardPath="redirect:user_main.do";
			return forwardPath;
		}
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		System.out.println(userId + ", " + password + ", " + name + ", " + email);
		UserService userService = new UserService();
		User user = new User(userId, password, name, email);
		try {
			request.setCharacterEncoding("EUC-KR");
			int updaterow = userService.modify(user);
			if(updaterow == 1) {
				request.getSession().setAttribute("sUser", user);
			}else {
				request.setAttribute("MSG", "수정실패!!!");
				forwardPath="redirect:user_view.do?userId=" + userId;
			}
			forwardPath="redirect:user_view.do?userId=" + userId;
		}catch (ExistedUserException e) {
			request.setAttribute("MSG", e.getMessage());
			request.setAttribute("fUser", user);
			forwardPath = "forward:user_view.do?userId=" + userId;
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("MSG", "잘 모르는 실패!!!");
			forwardPath="forward:user_error.jsp";
		}
		return forwardPath;
	}

}
