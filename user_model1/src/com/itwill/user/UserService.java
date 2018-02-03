package com.itwill.user;

import java.util.List;

import com.itwill.user.exception.ExistedUserException;
import com.itwill.user.exception.PasswordMismatchException;
import com.itwill.user.exception.UserNotFoundException;

/*
 * - 회원관리 비즈니스로직(예외처리,트랜젝션,보안,로깅)을 수행하는 클래스
 * - 웹콤포넌트(서블릿,JSP)에서 직접접근(메쏘드호출)하는 클래스
 * - Dao를 이용해서 데이타베이스를 조작작업하는 클래스
 */
public class UserService {
	private UserDao userDao;

	public UserService() {
		userDao = new UserDao();
	}

	/*
	 * 회원가입
	 */
	public int create(User user) throws Exception {
		/*
		 * 1. 회원아이디 중복검사
		 */
		if (userDao.existedUser(user.getUserId())) {
			// 이미존재하는 아이디인경우 예외를 던진다.
			throw new ExistedUserException(user.getUserId() + " 는 이미존재하는 아이디입니다.");
		}
		/*
		 * 2. 회원가입
		 */
		return userDao.create(user);
	}

	/*
	 * 회원1명보기
	 */
	public User findUser(String userId) throws Exception {

		User user = userDao.findUser(userId);
		if (user == null) {
			throw new UserNotFoundException(userId + " 는 존재하지않는 아이디입니다.");
		}
		return user;
	}
	
	/*
	 * 회원리스트
	 */
	public List<User> findUserList() throws Exception{
		return userDao.findUserList();
	}
	
	/*
	 * 회원로그인
	 */
	public User login(String userId, String password) throws Exception {
		/*
		 * 1.아이디존재여부
		 */
		User user = this.findUser(userId);
		/*
		 * 2.패쓰워드일치여부
		 */
		if (!user.isMatchPassword(password)) {
			throw new PasswordMismatchException("패스워드가 일치하지않습니다");
		}
		
		return user;
	}
	
	public int remove(String userId) throws Exception{
		return userDao.remove(userId);
	}
	
	public int modify(User user) throws Exception{
		return userDao.update(user);
	}
	
	
	
	
	
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}
