package edu.sjsu.cmpe275.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.sjsu.cmpe275.project.dao.CartDAO;
import edu.sjsu.cmpe275.project.entity.CartEntity;

@Service
public class CartManagerImpl implements CartManager{

	@Autowired
    private CartDAO cartDAO;
	
	public void addToCart(CartEntity cartEntity, int productId, int buyerId) {
			
			cartDAO.addToCart( cartEntity, productId, buyerId);
		}

	public List<CartEntity> getCartProducts(int id) {
		
		return cartDAO.getCartProducts(id);
	}

	public void deleteCartProduct(int id) {
		
		cartDAO.deleteCartProduct(id);
	}

	public Object getHistory(int userId) {
		
		return cartDAO.getHistory(userId);
	}
}
