package edu.sjsu.cmpe275.project.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import edu.sjsu.cmpe275.project.entity.ReviewEntity;
import edu.sjsu.cmpe275.project.entity.ProductEntity;


public class ReviewDAOImpl implements ReviewDAO {
	
	@Autowired
    private SessionFactory sessionFactory;
	

	public List<ProductEntity> addToReview(ReviewEntity reviewEntity, int productId, int buyerId) {
		
		Session session = sessionFactory.openSession();
		List<ProductEntity> list = null;
        String SQL_QUERY = "from ProductEntity as p where p.productId =?";
        Query query = session.createQuery(SQL_QUERY);
        query.setParameter(0,productId);
        
        try{
		       list = query.list();
		        System.out.println("helloooo"+ list);
		        reviewEntity.setBuyerId(buyerId);
		
		       if ((list != null) && (list.size() > 0)) {
		        	ProductEntity product = list.get(0);       	
		        	reviewEntity.setProductId(product.getProductId());
		        	
		        }
        }catch (HibernateException e) {
 	       e.printStackTrace(); 
 	    }finally {
 	       session.close(); 
 	    }
 	
       return list;
	}
	
	
	public void getReviewRate(ReviewEntity reviewEntity, int productId, int buyerId){
	
		this.sessionFactory.getCurrentSession().save(reviewEntity);		
	}
	
	
	public Object getCategorizedReviews(int id) {
		
        Session session = sessionFactory.openSession();
        List<ReviewEntity> list = null;
        String SQL_QUERY = "from ReviewEntity as p where p.productId =?";
        Query query = session.createQuery(SQL_QUERY);
        query.setParameter(0,id);
        
        try{
	         list = query.list();
	
	        if ((list != null) && (list.size() > 0)) {
	        	return list;  
	        }
        }catch (HibernateException e) {
  	       e.printStackTrace(); 
  	    }finally {
  	       session.close(); 
  	    }
        
		return list;
                 
	}
	
	
}
