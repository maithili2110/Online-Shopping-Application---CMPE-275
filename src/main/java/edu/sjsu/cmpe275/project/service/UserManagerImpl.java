package edu.sjsu.cmpe275.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.sjsu.cmpe275.project.dao.UserDAO;
import edu.sjsu.cmpe275.project.entity.UserEntity;

@Service
public class UserManagerImpl implements UserManager {
	
	
	@Autowired
    private UserDAO userDAO;

	@Transactional
	public void addUser(UserEntity user) {
		userDAO.addUser(user);
	}
	
	@Transactional
	public void updateUser(UserEntity user) {
		userDAO.updateUser(user);
	}

	@Transactional
	public List<UserEntity> getAllUsers() {
		return userDAO.getAllUsers();
	}

	@Transactional
	public void deleteUser(Integer userId) {
		userDAO.deleteUser(userId);
	}

	@Transactional
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Transactional
	public boolean checkDuplicate(String email) {
		
		return userDAO.checkDuplicate(email);
	}
	
	@Transactional
	public Object getUserById(int id) {
		// TODO Auto-generated method stub
		return userDAO.getUserById(id);
	}
		
	@Transactional
	public void OrderHistory(Integer userId) {
		userDAO.OrderHistory(userId);		
	}

	@Transactional
	public void SendMessage(Integer userId) {
		userDAO.SendMessage(userId);
	}
	
	@Transactional
	public void updatePassword(String email, String password) {
		// TODO Auto-generated method stub
		userDAO.updatePassword(email, password);
		
	}
}
