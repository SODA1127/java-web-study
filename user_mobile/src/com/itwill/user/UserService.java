package com.itwill.user;

import java.util.List;
/*
 * Service(Manager) Ŭ����
 *  - �����Ͻ�����(����ó��,Ʈ������,����,�α�)�� �����ϴ¿������Ѵ�.
 *  - ��������Ʈ(����,JSP)���� ��������(�޽��ȣ��)�ϰԵǴ�Ŭ����.
 *  - Dao�� ����ؼ� ����Ÿ���̽� �����۾��̰���.
 */
public class UserService {
	
	/********singleton**************/
	private static UserService _instance;
	private UserService() {
		System.out.println("UserService������:"+this);
	}
	public static UserService getInstance(){
		if(_instance==null){
			_instance=new UserService();
		}
		return _instance;
	}
	/*********************************/
	
	/*
	 * ȸ������
	 */
	public int create(User user)  throws Exception,ExistedUserException{
		//1. ���̵� ���翩��üũ
		if(getUserDao().existedUser(user.getUserId())){
			//�̹������ϴ¾��̵�
			throw new ExistedUserException(user.getUserId()+" �� �̹������ϴ� ���̵��Դϴ�.");
		}
		//2. ȸ������
		int result = getUserDao().create(user);
		return result;
	}
	/*
	 * �α���
	 */
	public User login(String userId,String password)throws Exception,UserNotFoundException,PasswordMismatchException{
		//1.���̵� ���翩��(�ԷµǴ� ���̵�� User��ü ã��)
		User findUser=getUserDao().findUser(userId);
		if(findUser==null){
			throw new UserNotFoundException(userId+" �� ���������ʴ� ���̵��Դϴ�.");
		}
		//2.�о����� ��ġ����
		if(!findUser.isMatchPassword(password)){
			throw new PasswordMismatchException("�о����尡 ��ġ�����ʽ��ϴ�.");
		}
		return findUser;
		
	}
	/*
	 * ȸ�� ��ü����Ʈ
	 */
	public List<User> findUserList()throws Exception{
		return getUserDao().findUserList();
	}
	/*
	 * ȸ�� �Ѹ���
	 */
	public User findUser(String userId)throws Exception,UserNotFoundException{
		User findUser=getUserDao().findUser(userId);
		if(findUser==null){
			throw new UserNotFoundException(userId+" �� ���������ʴ� ���̵� �Դϴ�.");
		}
		return findUser;
	}
	/*
	 * ȸ������
	 */
	public int remove(String userId)throws Exception{
		return getUserDao().remove(userId);
	}
	/*
	 * ȸ������
	 */
	public int update(User updateUser)throws Exception{
		return getUserDao().update(updateUser);
	}
	/*
	 * UserDao��ü��ȯ
	 */
	private UserDao getUserDao(){
		return UserDao.getUserDao();
	}
}
