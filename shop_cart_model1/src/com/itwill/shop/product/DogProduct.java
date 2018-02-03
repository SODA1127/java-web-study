package com.itwill.shop.product; 
public class DogProduct {
	private int id;
	private String name;
	private int price;
	private String image;
	private String des;
	private int click;
	
	public DogProduct() {
		// TODO Auto-generated constructor stub
	}


	public DogProduct(int id, String name, int price, String image, String des,
			int click) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.image = image;
		this.des = des;
		this.click = click;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}



	public int getClick() {
		return click;
	}



	public void setClick(int click) {
		this.click = click;
	}
	
	
	

}
