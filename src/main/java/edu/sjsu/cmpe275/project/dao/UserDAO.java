package edu.sjsu.cmpe275.project.dao;

import java.util.List;

import edu.sjsu.cmpe275.project.entity.UserEntity;

public interface UserDAO 
{
    public void addUser(UserEntity user);
    public List<UserEntity> getAllUsers();
    public void deleteUser(Integer userId);
	public boolean checkDuplicate(String email);
    public Object getUserById(int id);
    public void updateUser(UserEntity user);
    public void OrderHistory(Integer userId);
	public void SendMessage(Integer userId);
	public void updatePassword(String email, String Password);
}