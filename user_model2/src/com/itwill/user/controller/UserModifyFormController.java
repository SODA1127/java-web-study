package com.itwill.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.springmvc.Controller;
import com.itwill.user.User;
import com.itwill.user.UserService;
import com.itwill.user.exception.UserNotFoundException;

public class UserModifyFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";

		if(request.getMethod().equalsIgnoreCase("GET")){
			forwardPath="redirect:user_main.do";
			return forwardPath;
		}
		
		String findUserId = request.getParameter("userId");
		String sUserId = "";
		UserService userService = new UserService();
		User findUser = null;

		if (findUserId == null || findUserId.equals("")) {
			forwardPath = "redirect:user_list.do";
		} else {

			try {
				findUser = userService.findUser(findUserId);
				sUserId = (String) request.getSession().getAttribute("sUserId");
				if (!findUserId.equals(sUserId)) {
					request.setAttribute("USERMSG", "본인만이 수정이 가능한 게시물입니다.");
					forwardPath = "forward:user_error.jsp";
				}
				request.setAttribute("findUser", findUser);
				forwardPath = "foward:user_modify_form.jsp";
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("MSG", "잘 모르는 실패!!!");
				forwardPath = "forward:user_error.jsp";
			}
		}
		return forwardPath;
	}

}
