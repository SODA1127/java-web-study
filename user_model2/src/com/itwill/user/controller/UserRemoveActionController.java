package com.itwill.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.springmvc.Controller;
import com.itwill.user.User;
import com.itwill.user.UserService;
import com.itwill.user.exception.ExistedUserException;

public class UserRemoveActionController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";
		if (request.getMethod().equalsIgnoreCase("GET")) {
			forwardPath = "redirect:user_main.do";
			return forwardPath;
		}

		String userId = request.getParameter("userId");
		UserService userService = new UserService();
		User user = null;
		try {
			user = userService.findUser(userId);
			String sUserId = (String) request.getSession().getAttribute("sUserId");
			if (userId.equals(sUserId)) {
				request.getSession().invalidate();
				userService.remove(userId);
				forwardPath = "redirect:user_main.do";
			} else if (!userId.equals(sUserId)) {
				request.setAttribute("MSG", "본인만이 계정 탈퇴 가능합니다.");
				forwardPath = "forward:user_view.do?userId=" + userId;
			}
		} catch (ExistedUserException e) {
			request.setAttribute("MSG", e.getMessage());
			request.setAttribute("fUser", user);
			forwardPath = "forward:user_view.do?userId=" + userId;
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("MSG", "잘 모르는 실패!!!");
			forwardPath = "forward:user_error.jsp";
		}
		return forwardPath;
	}

}
