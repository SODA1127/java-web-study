package com.itwill.user.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.springmvc.Controller;
import com.itwill.user.User;
import com.itwill.user.UserService;

public class UserListController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath="";
		try {
			UserService userService = new UserService();
			List<User> userList = userService.findUserList();
			request.setAttribute("userList", userList);
			forwardPath = "forward:user_list.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("MSG", "잘 모르는 실패!!!");
			forwardPath = "forward:user_error.jsp";
		}
	return forwardPath;
	}

}
