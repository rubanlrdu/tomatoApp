package com.tomato.DAO;

import java.util.List;

import com.tomato.models.UserModel;

public interface UserDAO {
	public int setUser(UserModel user);
	public void updateUser(UserModel user);
	public void deleteUser(String userName);
	public UserModel getUser(String userName);
	public List<UserModel>getAllUsers();
}
