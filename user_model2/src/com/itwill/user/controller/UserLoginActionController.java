package com.itwill.user.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.itwill.springmvc.Controller;
import com.itwill.user.User;
import com.itwill.user.UserService;
import com.itwill.user.exception.PasswordMismatchException;
import com.itwill.user.exception.UserNotFoundException;

public class UserLoginActionController implements Controller{
	

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath="";
		if(request.getMethod().equalsIgnoreCase("GET")){
			forwardPath="redirect:user_main.do";
			return forwardPath;
		}
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		UserService userService = new UserService();
		try {
			User loginUser = userService.login(userId, password);
			request.getSession().setAttribute("sUserId", loginUser.getUserId());
			request.getSession().setAttribute("sUser", loginUser);
			forwardPath = "redirect:user_main.do";
		}catch (UserNotFoundException e) {
			request.setAttribute("IDMSG", e.getMessage());
			request.setAttribute("fUserId", userId);
			forwardPath = "forward:user_login_form.jsp";
		} catch (PasswordMismatchException e) {
			request.setAttribute("PWMSG", e.getMessage());
			request.setAttribute("fUserId", userId);
			request.setAttribute("fUserPw", password);
			forwardPath = "forward:user_login_form.jsp";
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("MSG", "잘 모르는 실패!!!");
			forwardPath="forward:user_error.jsp";
		}
		return forwardPath;
	}

}
