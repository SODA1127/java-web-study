package com.itwill.user;

import java.util.List;
/*
 * Service(Manager) 클래스
 *  - 비지니스로직(예외처리,트랜젝션,보안,로깅)을 수행하는역할을한다.
 *  - 웹콤포넌트(서블릿,JSP)에서 직접접근(메쏘드호출)하게되는클래스.
 *  - Dao를 사용해서 데이타베이스 조작작업이가능.
 */
public class UserService {
	
	/********singleton**************/
	private static UserService _instance;
	private UserService() {
		System.out.println("UserService생성자:"+this);
	}
	public static UserService getInstance(){
		if(_instance==null){
			_instance=new UserService();
		}
		return _instance;
	}
	/*********************************/
	
	/*
	 * 회원가입
	 */
	public int create(User user)  throws Exception,ExistedUserException{
		//1. 아이디 존재여부체크
		if(getUserDao().existedUser(user.getUserId())){
			//이미존재하는아이디
			throw new ExistedUserException(user.getUserId()+" 는 이미존재하는 아이디입니다.");
		}
		//2. 회원가입
		int result = getUserDao().create(user);
		return result;
	}
	/*
	 * 로그인
	 */
	public User login(String userId,String password)throws Exception,UserNotFoundException,PasswordMismatchException{
		//1.아이디 존재여부(입력되는 아이디로 User객체 찾기)
		User findUser=getUserDao().findUser(userId);
		if(findUser==null){
			throw new UserNotFoundException(userId+" 는 존재하지않는 아이디입니다.");
		}
		//2.패쓰워드 일치여부
		if(!findUser.isMatchPassword(password)){
			throw new PasswordMismatchException("패쓰워드가 일치하지않습니다.");
		}
		return findUser;
		
	}
	/*
	 * 회원 전체리스트
	 */
	public List<User> findUserList()throws Exception{
		return getUserDao().findUserList();
	}
	/*
	 * 회원 한명보기
	 */
	public User findUser(String userId)throws Exception,UserNotFoundException{
		User findUser=getUserDao().findUser(userId);
		if(findUser==null){
			throw new UserNotFoundException(userId+" 는 존재하지않는 아이디 입니다.");
		}
		return findUser;
	}
	/*
	 * 회원삭제
	 */
	public int remove(String userId)throws Exception{
		return getUserDao().remove(userId);
	}
	/*
	 * 회원수정
	 */
	public int update(User updateUser)throws Exception{
		return getUserDao().update(updateUser);
	}
	/*
	 * UserDao객체반환
	 */
	private UserDao getUserDao(){
		return UserDao.getUserDao();
	}
}
