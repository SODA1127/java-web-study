package com.itwill.shop.product;
import java.util.List;

public class DogProductService {
	public DogProductService() {
	
	}
	
	/*
	DogProduct ����Ʈ��ȯ
	 */
	public List<DogProduct> getDogs() {		
		DogProductDao dogDao = new DogProductDao(); 
		List<DogProduct> dogs = dogDao.getDogs(); 
			
		return dogs;
	}
	/*
	DogProduct 1����ȯ
	 */
	public DogProduct getDog(String id) { 
		DogProductDao dogDao = new DogProductDao();
		DogProduct dog = dogDao.getDog(id); 
		return dog;
	}
	public boolean updateReadcount(String id) {
		boolean result = false;
		DogProductDao dogDao = new DogProductDao(); //Dogdao Ŭ������ �����ؾ� �Ѵ�. dao�� ��Ű�� �����ϰ� ����
		result = dogDao.updateReadcount(id); //Dogdao.java ������ ���Ŀ� ���� ����
		return result;
	}
}

