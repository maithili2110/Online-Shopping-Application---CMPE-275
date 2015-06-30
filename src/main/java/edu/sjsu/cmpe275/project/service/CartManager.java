package edu.sjsu.cmpe275.project.service;

import java.util.List;

import edu.sjsu.cmpe275.project.entity.CartEntity;

public interface CartManager {

	public void addToCart(CartEntity cartEntity, int productId, int buyerId);
	public List<CartEntity> getCartProducts(int id);
	public void deleteCartProduct(int id);
	public Object getHistory(int userId);
}
