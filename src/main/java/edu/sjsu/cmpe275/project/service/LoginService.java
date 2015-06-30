package edu.sjsu.cmpe275.project.service;

import java.util.List;

import edu.sjsu.cmpe275.project.entity.UserEntity;

public interface LoginService {
	public List<UserEntity> checkLogin(String email, String password);
	public boolean checkAdminLogin(String email, String password);
	public List<UserEntity> Adminlist(String email, String password);

}
