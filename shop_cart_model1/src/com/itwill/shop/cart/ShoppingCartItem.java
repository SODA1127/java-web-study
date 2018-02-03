package com.itwill.shop.cart;

import com.itwill.shop.product.DogProduct;

public class ShoppingCartItem {
    DogProduct item;
    int quantity;
    int tot;
    
    
    public int getTot() {
		return tot;
	}

	public void setTot(int tot) {
		this.tot = tot;
	}

	public void setItem(DogProduct item) {
		this.item = item;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public ShoppingCartItem(DogProduct anItem,int qty) {
        item = anItem;
        quantity = qty;
        tot = item.getPrice()*quantity;
    }

   
    public void incrementQuantity(int qty) {
        quantity=quantity+qty;
        tot = item.getPrice()*quantity;
    }
    
    public void decrementQuantity(int qty) {
        quantity=quantity-qty;
        tot = item.getPrice()*quantity;
    }

    public DogProduct getDogProductItem() {
        return item;
    }

    public int getQuantity() {
        return quantity;
    }
}









