package edu.sjsu.cmpe275.project.dao;

import java.util.List;

import edu.sjsu.cmpe275.project.entity.UserEntity;

public interface LoginDAO {

	public List<UserEntity> checkLogin(String email, String password);
public boolean checkAdminLogin(String email, String password);
public List<UserEntity> Adminlist(String email, String password);
}
