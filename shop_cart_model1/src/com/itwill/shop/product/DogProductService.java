package com.itwill.shop.product;
import java.util.List;

public class DogProductService {
	public DogProductService() {
	
	}
	
	/*
	DogProduct 리스트반환
	 */
	public List<DogProduct> getDogs() {		
		DogProductDao dogDao = new DogProductDao(); 
		List<DogProduct> dogs = dogDao.getDogs(); 
			
		return dogs;
	}
	/*
	DogProduct 1개반환
	 */
	public DogProduct getDog(String id) { 
		DogProductDao dogDao = new DogProductDao();
		DogProduct dog = dogDao.getDog(id); 
		return dog;
	}
	public boolean updateReadcount(String id) {
		boolean result = false;
		DogProductDao dogDao = new DogProductDao(); //Dogdao 클래스를 생성해야 한다. dao로 패키지 지정하고 설정
		result = dogDao.updateReadcount(id); //Dogdao.java 생성한 이후에 문장 생성
		return result;
	}
}

