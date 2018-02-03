package com.itwill.user.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.itwill.springmvc.Controller;
import com.itwill.user.User;
import com.itwill.user.UserService;
import com.itwill.user.exception.PasswordMismatchException;
import com.itwill.user.exception.UserNotFoundException;

public class UserLogoutActionController implements Controller{
	

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		String forwardPath="redirect:user_main.do";		
		return forwardPath;
	}

}
