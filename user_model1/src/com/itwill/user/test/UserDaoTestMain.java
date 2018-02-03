package com.itwill.user.test;
import java.util.List;

import com.itwill.user.User;
import com.itwill.user.UserDao;

public class UserDaoTestMain {

	public static void main(String[] args) throws Exception{
		System.out.println("----------------- UserDao Main -----------------");
		UserDao userDao = new UserDao();
		
		System.out.println("----------------- 추가 -----------------");
		int row = userDao.create(new User("aaaa", "1111", "에에에에", "a@a.co.kr"));
		System.out.println("추가 : " + row);
		System.out.println("----------------- 모두 찾기 -----------------");
		List<User> userList = userDao.findUserList();
		for (int i = 0; i < userList.size(); i++) {
			System.out.println(userList.get(i));
		}
		System.out.println("----------------- 하나만 찾기 -----------------");
		User findUser = userDao.findUser("aaaa");
		System.out.println("정보 : " + findUser);
		
		System.out.println("------------------ 수정하기 -----------------");
		row = userDao.update(new User("aaaa", "aaaa", "에에에에", "a@a.co.kr"));
		System.out.println("수정 : " + row);
		
		System.out.println("------------------ 삭제하기 -----------------");
		row = userDao.remove("aaaa");
		System.out.println("삭제 : " + row);
		
		System.out.println("------------------ 계정확인 -----------------");
		boolean isCheckUser = userDao.existedUser("bbbb");
		if(isCheckUser) {
			System.out.println("존재함");
		}else {
			System.out.println("존재하지 않음");
		}
	}

}
