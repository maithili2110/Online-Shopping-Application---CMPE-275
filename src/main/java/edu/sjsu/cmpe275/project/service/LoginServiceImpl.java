package edu.sjsu.cmpe275.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.sjsu.cmpe275.project.dao.LoginDAO;
import edu.sjsu.cmpe275.project.entity.UserEntity;

@Service
public class LoginServiceImpl implements  LoginService{
       
        @Autowired
        private LoginDAO loginDAO;


       public void setLoginDAO(LoginDAO loginDAO) {
               this.loginDAO = loginDAO;
       }


      @Transactional
      public List<UserEntity> checkLogin(String email, String password){
             System.out.println("In Service class...Check Login");
             return loginDAO.checkLogin(email, password);
      }
               public boolean checkAdminLogin(String email, String password){
                   System.out.println("In Service class...Check Login");
                   return loginDAO.checkAdminLogin(email, password);
            }
               
               @Transactional
               public List<UserEntity> Adminlist(String email, String password) {
            	   System.out.println("In Service class...Check Login");
                   return loginDAO.Adminlist(email, password); 
               }

}
