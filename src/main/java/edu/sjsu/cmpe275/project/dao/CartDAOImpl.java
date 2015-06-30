package edu.sjsu.cmpe275.project.dao;

import java.util.List;
import java.util.Random;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import edu.sjsu.cmpe275.project.entity.CartEntity;
import edu.sjsu.cmpe275.project.entity.ProductEntity;

public class CartDAOImpl implements CartDAO{
	
	@Autowired
    private SessionFactory sessionFactory;
	

	public void addToCart(CartEntity cartEntity, int productId, int buyerId) {
		
		List<ProductEntity> list = null;
		Session session = sessionFactory.openSession();
		Random randomGenerator = new Random();
        String SQL_QUERY = "from ProductEntity as p where p.productId =?";
        Query query = session.createQuery(SQL_QUERY);
        query.setParameter(0,productId);
        
        try{
        list = query.list();
        System.out.println("inside try of addToCart");
        cartEntity.setBuyerId(buyerId);
        cartEntity.setCartItemId(randomGenerator.nextInt(99999));

        if ((list != null) && (list.size() > 0)) {
        	ProductEntity product = list.get(0);
        	System.out.println("inside if of addToCart");
        	cartEntity.setBrand(product.getBrand());
        	cartEntity.setCategory(product.getCategory());
        	cartEntity.setImageName(product.getImageName());
        	cartEntity.setProductId(product.getProductId());
        	cartEntity.setProductName(product.getProductName());
        	cartEntity.setProductType(product.getProductType());
        	cartEntity.setPrice(product.getPrice());
        	cartEntity.setQuantity(product.getQuantity());
        	cartEntity.setState(product.getState());
        	
        	
        	this.sessionFactory.openSession().save(cartEntity);
        	}
        	}catch (HibernateException e) {
        	       e.printStackTrace(); 
        	    }finally {
        	       session.close(); 
        	    }
        	
        
	}


	public List<CartEntity> getCartProducts(int id) {
		
        Session session = sessionFactory.openSession();
        List<CartEntity> list = null;
        String SQL_QUERY = "from CartEntity as p where p.buyerId =?";
        Query query = session.createQuery(SQL_QUERY);
        query.setParameter(0, id);
        try{
        
        	list = query.list();
        }catch (HibernateException e) {
            e.printStackTrace(); 
         }
        if ((list != null) && (list.size() > 0)) {
        	session.close();
        	return list;  
        }
		return list;
                 
	}
	
public List<CartEntity> getHistory(int id) {
		
        Session session = sessionFactory.openSession();
        List<CartEntity> list =null;
        String SQL_QUERY = "from OrderHistory as p where p.buyerId =?";
        Query query = session.createQuery(SQL_QUERY);
        query.setParameter(0, id);
        try{
        	list = query.list();
        }catch (HibernateException e) {
            e.printStackTrace(); 
         }
        if ((list != null) && (list.size() > 0)) {
        	session.close();
        	return list;  
        }
		return list;
                 
	}


	public void deleteCartProduct(int id) {
		
		Session session = sessionFactory.openSession();
		Query q = session.createQuery("delete CartEntity where cartItemId = ?");
		q.setParameter(0, id);
		
		try{
			q.executeUpdate();
		}catch (HibernateException e) {
 	       e.printStackTrace(); 
 	    }finally {
 	       session.close(); 
 	    }
 	}
}
