package edu.sjsu.cmpe275.project.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.sjsu.cmpe275.project.entity.ProductEntity;
import edu.sjsu.cmpe275.project.entity.UserEntity;

@Repository
public class LoginDAOImpl implements LoginDAO{
    
                        
      @Autowired
      protected SessionFactory sessionFactory;

      public List<UserEntity> checkLogin(String email, String password){
    	 
    	  				List<UserEntity> list = null;
                       Session session = sessionFactory.openSession();
                       String SQL_QUERY =" from UserEntity as o where o.email=? and o.password=?";
                       Query query = session.createQuery(SQL_QUERY);
                       query.setParameter(0,email);
                       query.setParameter(1,password);
                       try{
                    	   	list = query.list();
                       	}catch (HibernateException e) {
					       e.printStackTrace(); 
					    }finally {
					       session.close(); 
					    }
                      return list;              
      }
      
      
	  public boolean checkAdminLogin(String email, String password){
          System.out.println("In Check login");
          Session session = sessionFactory.openSession();
          boolean userFound = false;
          //Query using Hibernate Query Language
          String SQL_QUERY =" from UserEntity as o where o.email=? and o.password=? and o.accountDetails='yes'";
          Query query = session.createQuery(SQL_QUERY);
          query.setParameter(0,email);
          query.setParameter(1,password);
          List list = query.list();

          if ((list != null) && (list.size() > 0)) {
                  userFound= true;
          }

          session.close();
          return userFound;              
}
	  public List<UserEntity> Adminlist(String email, String password){
	         /* System.out.println("In Check admin login");
	          Session session = sessionFactory.openSession();
	          boolean userFound = false;
	          //Query using Hibernate Query Language
	          String SQL_QUERY =" from UserEntity as o where o.email=? and o.password=? and o.accountDetails='yes'";
	          Query query = session.createQuery(SQL_QUERY);
	          query.setParameter(0,email);
	          query.setParameter(1,password);
	          List list = query.list();

	          if ((list != null) && (list.size() > 0)) {
	                  userFound= true;
	          }*/

	/*          session.close();
	          return userFound;*/
	          System.out.println("In Check login");
	          Session session = sessionFactory.openSession();
	          boolean userFound = false;
	          //Query using Hibernate Query Language
	          String SQL_QUERY =" from UserEntity as o where o.email=? and o.password=? and o.accountDetails='yes'";
	          Query query = session.createQuery(SQL_QUERY);
	          query.setParameter(0,email);
	          query.setParameter(1,password);
	          List<UserEntity> list = query.list();

	          if ((list != null) && (list.size() > 0)) {
	       	   UserEntity user = (UserEntity) list.get(0);
	       	    }

	          session.close();
	          return list;
	}
}
 

