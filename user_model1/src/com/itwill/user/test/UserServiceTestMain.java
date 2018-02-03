package com.itwill.user.test;

import com.itwill.user.User;
import com.itwill.user.UserService;
import com.itwill.user.exception.ExistedUserException;
import com.itwill.user.exception.PasswordMismatchException;
import com.itwill.user.exception.UserNotFoundException;

public class UserServiceTestMain {
	public static void main(String[] args) throws Exception {
		UserService userService = new UserService();
		System.out.println("----------------- 추가 -----------------");
		User user = new User("oooo", "oooo", "오오오오", "oo@o.co.kr");
		try {
			userService.create(user);
			System.out.println("1. 회원가입 성공");
		} catch (ExistedUserException e) {
			System.out.println("2. 아이디 중복 : " + e.getMessage());
		} catch (Exception e) {
			System.out.println("3. 고객님 죄송합니다!");
			e.printStackTrace();
		}

		System.out.println("----------------- 계정 확인 -----------------");
		try {
			User findUser = userService.findUser("bbbb");
			System.out.println("1. " + findUser);
			findUser = userService.findUser("aaaa");
			System.out.println(findUser);
		} catch (UserNotFoundException e) {
			System.out.println("2. " + e.getMessage());
		} catch (Exception e) {
			System.out.println("3. " + e.getMessage());
		}

		System.out.println("----------------- 로그인 -----------------");
		try {
			User loginUser = userService.login("aaaa", "1111");
			System.out.println("1. 로그인 성공 : " + loginUser);
			loginUser = userService.login("xxxx", "xxxx");
			System.out.println("1. 로그인 성공 : " + loginUser);
		} catch (UserNotFoundException e) {
			System.out.println("2-1. 로그인 실패 : " + e.getMessage());
		} catch (PasswordMismatchException e) {
			System.out.println("2-2. 로그인 실패 : " + e.getMessage());
		} catch (Exception e) {
			System.out.println("3. 로그인 실패 : " + e.getMessage());
		}
	}
}
