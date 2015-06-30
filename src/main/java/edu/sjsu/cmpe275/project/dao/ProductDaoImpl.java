package edu.sjsu.cmpe275.project.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.sjsu.cmpe275.project.entity.CartEntity;
import edu.sjsu.cmpe275.project.entity.ProductEntity;

@Repository
public class ProductDaoImpl implements ProductDAO  {

	@Autowired
    private SessionFactory sessionFactory;
	
	public void addProduct(ProductEntity product) {
		try{
			product.setStatus("pending");
			this.sessionFactory.getCurrentSession().save(product);
		}catch (HibernateException e) {
	  	       e.printStackTrace(); 
	 	    }
		
	}

	@SuppressWarnings("unchecked")
	public List<ProductEntity> getAllProducts() {
		try{
			Session session = sessionFactory.openSession();
        Query query = session.createQuery("from ProductEntity as p where p.status = :state ");
        query.setParameter("state", "approved");
        List list = query.list();
        return list;
        }catch (HibernateException e) {
  	       e.printStackTrace(); 
 	    }
		return null;
	}

	public void deleteProduct(Integer productId) {
		ProductEntity product = (ProductEntity) sessionFactory.getCurrentSession().load(
				ProductEntity.class, productId);
        if (null != product) {
        	
        	try{
        		this.sessionFactory.getCurrentSession().delete(product);
        	}catch (HibernateException e) {
     	       e.printStackTrace(); 
    	    }
        	
        }
	}

	public List<ProductEntity> getCategorizedProducts(String category) {
		
        Session session = sessionFactory.openSession();
        List<ProductEntity> list = null;
        String SQL_QUERY = "from ProductEntity as p where p.category =?";
        Query query = session.createQuery(SQL_QUERY);
        query.setParameter(0,category);
        
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
public List<ProductEntity> getSearchedProducts(String productName) {
		
        Session session = sessionFactory.openSession();
        List<ProductEntity> list = null;
        String SQL_QUERY = "from ProductEntity as p where p.productName LIKE :pname";
        Query query = session.createQuery(SQL_QUERY);
        query.setParameter("pname", "%"+productName+"%");
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

	public Object getCategorizedProducts(int id) {
		
        Session session = sessionFactory.openSession();
        List<ProductEntity> list = null;
        String SQL_QUERY = "from ProductEntity as p where p.productId =?";
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

	public List<ProductEntity> getSellProducts() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from ProductEntity as p where p.status = 'pending' ");
		//query.setParameter("state", "NULL");
		List list = query.list();
		return list;
		/*return this.sessionFactory.getCurrentSession().createQuery("from ProductEntity as p where p.approval").list();*/
	}
	
public void adminDisapproval(int id) {
		
		Session session = sessionFactory.openSession();
		Query q = session.createQuery("delete ProductEntity where productId = ?");
		q.setParameter(0, id);
		q.executeUpdate();
		session.close();
	}
	
public void adminApproval(int productid) {
	System.out.println("In find by update product ");
		Session session = sessionFactory.openSession();
		Query q = session.createQuery("update ProductEntity set status='approved'" + " where productId = ?");
		q.setParameter(0, productid);
		q.executeUpdate();
		session.close();
	}
	
}
