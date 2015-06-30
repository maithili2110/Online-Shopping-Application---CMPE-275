package edu.sjsu.cmpe275.project.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.apache.http.NameValuePair;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;

import edu.sjsu.cmpe275.project.entity.CartEntity;
import edu.sjsu.cmpe275.project.entity.ProductEntity;
import edu.sjsu.cmpe275.project.entity.UserEntity;
import edu.sjsu.cmpe275.project.service.Email;

import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.MessageFactory;
import com.twilio.sdk.resource.instance.Message;

import org.apache.http.message.BasicNameValuePair;

@Repository
public class UserDaoImpl implements UserDAO  {
	
	//public static final String ACCOUNT_SID = "ACcb63f40bbffb27bf7881adbce8f4640e";
	//public static final String AUTH_TOKEN = "3bda4c016a7d2f05c3b39d983d587ce5";
	
	public static final String ACCOUNT_SID = "ACa0d2cde3dd1a106a0a6955d23d2cfa80";
	public static final String AUTH_TOKEN = "f2013079a230145e7ec4cba66beb57f3";
	
    Message message = null;

	@Autowired
    private SessionFactory sessionFactory;
	
	public void addUser(UserEntity user) {
		try{
			this.sessionFactory.getCurrentSession().save(user);
			ApplicationContext mailContext = 
		            new ClassPathXmlApplicationContext("Spring-Mail.xml");
			
			Email mm = (Email) mailContext.getBean("Email");
			mm.sendMail("cmpe275project.onlineshoppe@gmail.com",
					user.getEmail(),
					   "Welcome!", 
					   "You are successfully registered to Online Shoppe");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}
	public void updateUser(UserEntity user) {
		System.out.println("In find by update ");
		
		this.sessionFactory.getCurrentSession().update(user);
	}
	
	
	public void updatePassword(String email, String password)
	{
		
		Session session = sessionFactory.openSession();
        boolean userFound = false;
        //Query using Hibernate Query Language
        
        Query query = session.createQuery("update UserEntity as o set o.password= ? where o.email=?");
        query.setParameter(0, password);
        query.setParameter(1,email);
    	
        try{
        	
    	    
    	    int result = query.executeUpdate();
    	     
    	    if (result > 0) {
    	        System.out.println("Updated password for  "+email);
    	    }
        }catch (HibernateException e) {
           e.printStackTrace(); 
        }finally {
           session.close(); 
        }
        	
	}
	

	@SuppressWarnings("unchecked")
	public List<UserEntity> getAllUsers() {
		return this.sessionFactory.getCurrentSession().createQuery("from UserEntity").list();
	}

	public void deleteUser(Integer userId) {
		try{
			
		UserEntity user = (UserEntity) sessionFactory.getCurrentSession().load(
				UserEntity.class, userId);
        if (null != user) {
        	this.sessionFactory.getCurrentSession().delete(user);
        }
        
	}catch (HibernateException e) {
	    e.printStackTrace(); 
	 }
	}

	public boolean checkDuplicate(String email) {
		
		Session session = sessionFactory.openSession();
        String SQL_QUERY =" from UserEntity as o where o.email=?";
        try{
        Query query = session.createQuery(SQL_QUERY);
        query.setParameter(0,email);
        List list = query.list();

        if ((list != null) && (list.size() > 0)) {
     	    
     	    return true;
        }
	}catch (HibernateException e) {
	    e.printStackTrace(); 
	 }finally {
	    session.close(); 
	 }

		return false;
	}
public Object getUserById(int id) {
		
        Session session = sessionFactory.openSession();
        List list = null;
        String SQL_QUERY = "from UserEntity as u where u.id =?";
        try{
	        Query query = session.createQuery(SQL_QUERY);
	        query.setParameter(0,id);
	         list = query.list();
	
	        if ((list != null) && (list.size() > 0)) {
	        	session.close();
	        	return  list;  
	        }
		}catch (HibernateException e) {
		    e.printStackTrace(); 
		 }finally {
		    //session.close(); 
		 }    
		return list;
                 
	}

public void OrderHistory(Integer buyerId) {
	System.out.println("In order history");
	Session session = sessionFactory.openSession();

	Query insertQuery = session.createQuery("insert into OrderHistory(buyerId, productId, productName, productType, category, quantity, brand, imageName, state, price, cartItemId)" +
			"select buyerId, productId, productName, productType, category, quantity, brand, imageName, state, price, cartItemId from CartEntity where buyerId = ?");
	insertQuery.setParameter(0, buyerId);
	
	Query query = session.createQuery("delete CartEntity as c where c.buyerId = ? ");
    query.setParameter(0, buyerId);
	
    try{
    	
	    insertQuery.executeUpdate();
	    int result = query.executeUpdate();
	     
	    if (result > 0) {
	        System.out.println("Expensive products was removed "+result);
	    }
    }catch (HibernateException e) {
       e.printStackTrace(); 
    }finally {
       session.close(); 
    }
 }

public void SendMessage(Integer buyerId){
	
	TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);
	Session session = sessionFactory.openSession();
	
	Random randomGenerator = new Random();
	int transactionId = randomGenerator.nextInt(999999999+999999999);
	
	 String SQL_QUERY = "from UserEntity as p where p.id =?";
     Query query = session.createQuery(SQL_QUERY);
     query.setParameter(0,buyerId);
     List<UserEntity> list = query.list();

     if ((list != null) && (list.size() > 0)) {
     	UserEntity user = list.get(0);

     	List<NameValuePair> params = new ArrayList<NameValuePair>();
        params.add(new BasicNameValuePair("Body", "Your transaction Id \n\n "+transactionId));
        params.add(new BasicNameValuePair("To", user.getPhoneno()));
        params.add(new BasicNameValuePair("From", "+19804042054"));
     
        MessageFactory messageFactory = client.getAccount().getMessageFactory();
        
        try {
    		message = messageFactory.create(params);
    	} catch (TwilioRestException e) {
    		e.printStackTrace();
    	}
        
     }
    
	

}

}
