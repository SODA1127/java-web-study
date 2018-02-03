package com.itwill.shop.cart;

import java.util.*;

import com.itwill.shop.product.DogProduct;

public class ShoppingCartService {
	public HashMap<String, ShoppingCartItem> items = null;
	int numberOfItems = 0;

	public ShoppingCartService() {
		items = new HashMap<String, ShoppingCartItem>();
	}
	
	public synchronized void add(String dogId, DogProduct dog, int qty) {
		if (items.containsKey(dogId)) {
			ShoppingCartItem scitem = (ShoppingCartItem) items.get(dogId);
			scitem.incrementQuantity(qty);
		} else {
			ShoppingCartItem newItem = new ShoppingCartItem(dog,qty);
			items.put(dogId, newItem);
		}

		numberOfItems++;
	}
	public synchronized void update(String dogId,int qty) {
		if (items.containsKey(dogId)) {
			ShoppingCartItem scitem = (ShoppingCartItem) items.get(dogId);
			scitem.decrementQuantity(qty);
			if (scitem.getQuantity() <= 0){
				items.remove(dogId);
				numberOfItems--;
			}
		}
	}
	public synchronized void remove(String dogId) {
		if (items.containsKey(dogId)) {
			items.remove(dogId);
			numberOfItems--;
		}
	}
	public synchronized Collection<ShoppingCartItem> getItems() {
		return items.values();
	}
	
	public synchronized int getNumberOfItems() {
		return numberOfItems;
	}

	public synchronized double getTotal() {
		double amount = 0.0;

		for (Iterator i = getItems().iterator(); i.hasNext();) {
			ShoppingCartItem cartItem = (ShoppingCartItem) i.next();
			DogProduct dogProduct = (DogProduct) cartItem.getDogProductItem();
			amount += cartItem.getQuantity() * dogProduct.getPrice();
		}
		return roundOff(amount);
	}

	private double roundOff(double x) {
		long val = Math.round(x * 100);
		return val / 100.0;
	}

	public synchronized void clear() {
		items.clear();
		numberOfItems = 0;
	}
}
