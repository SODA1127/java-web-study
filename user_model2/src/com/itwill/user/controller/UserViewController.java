package com.itwill.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.springmvc.Controller;
import com.itwill.user.User;
import com.itwill.user.UserService;
import com.itwill.user.exception.UserNotFoundException;

public class UserViewController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";

		String findUserId = request.getParameter("userId");
		UserService userService = new UserService();
		User findUser = null;

		if (findUserId == null || findUserId.equals("")) {
			forwardPath = "redirect:user_list.do";
		} else {

			try {
				findUser = userService.findUser(findUserId);
				forwardPath = "forward:user_view.jsp?userId=" + findUserId;
				request.setAttribute("userId", findUserId);
				request.setAttribute("findUser", findUser);
			} catch (UserNotFoundException e) {
				request.setAttribute("IDMSG", e.getMessage());
				forwardPath = "forward:user_list.do";
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("MSG", "잘 모르는 실패!!!");
				forwardPath = "forward:user_error.jsp";
			}
		}
		return forwardPath;
	}

}
