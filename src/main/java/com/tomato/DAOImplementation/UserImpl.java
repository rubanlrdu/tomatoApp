package com.tomato.DAOImplementation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tomato.DAO.UserDAO;
import com.tomato.models.UserModel;
public class UserImpl implements UserDAO{
	
	private String INSERT="INSERT into `users` (`name`,`username`,`password`,`email`,`phone`"
			+ ",`address`,`role`,`createdDate`,`lastLoginDate`) values(?,?,?,?,?,?,?,?,?)";
	private String getUser="select * from `users` where `username`=?";
	private String deleteUser="delete from `users` where `username`=?";
	private String updateUser="update `users` set `name`=?, `password`=?,"
			+ " `email`=?, `phone`=?, `address`=?, `role`=? where `username`=?";
	private String selectAll="select * from `users`";
	public UserImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int setUser(UserModel user) {
		Connection con = DataBaseConnection.getConnection();
		try {
			PreparedStatement pstmt =con.prepareStatement(INSERT);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getUserName());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getPhone());
			pstmt.setString(6, user.getAddress());
			pstmt.setString(7, user.getRole());
			pstmt.setTimestamp(8, new Timestamp(System.currentTimeMillis()));
			pstmt.setTimestamp(9, new Timestamp(System.currentTimeMillis()));
	
			int res=pstmt.executeUpdate();
			return res;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public void updateUser(UserModel user) {
		Connection con=DataBaseConnection.getConnection();
		try {
			PreparedStatement pstmt =con.prepareStatement(updateUser);
			
			pstmt.setString(1,user.getName());
			pstmt.setString(2,user.getPassword());
			pstmt.setString(3,user.getEmail());
			pstmt.setString(4, user.getPhone());
			pstmt.setString(5, user.getAddress());
			pstmt.setString(6, user.getRole());
			pstmt.setString(7, user.getUserName());
			pstmt.executeUpdate();
		} catch (SQLException e) {
	
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteUser(String userName) {
		Connection con=DataBaseConnection.getConnection();
		try {
			PreparedStatement pstmt=con.prepareStatement(deleteUser);
			pstmt.setString(1, userName);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public UserModel getUser(String userName) {
		Connection con=DataBaseConnection.getConnection();
		UserModel user=new UserModel();
		try {
			PreparedStatement pstmt = con.prepareStatement(getUser);
			pstmt.setString(1, userName);
			ResultSet res=pstmt.executeQuery();
			
			if(res.next()) {
				String name=res.getString("name");
				String password=res.getString("password");
				String username=res.getString("username");
				String email=res.getString("email");
				String phone=res.getString("phone");
				String address=res.getString("address");
				String role=res.getString("role");
				Timestamp createdDate=res.getTimestamp("createdDate");
				Timestamp lastLoginDate=res.getTimestamp("lastLoginDate");
				user= new UserModel(name, username,password, email,phone, address,role, createdDate, lastLoginDate);
			}
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public List<UserModel> selectAllUsers() {
		List<UserModel> list= new ArrayList<UserModel>();
		Connection con=DataBaseConnection.getConnection();
		UserModel user;
		try {
			PreparedStatement pstmt = con.prepareStatement(selectAll);
			ResultSet res=pstmt.executeQuery();
	
			while(res.next()) {
				String fullname=res.getString("name");
				String password=res.getString("password");
				String username=res.getString("username");
				String email=res.getString("email");
				String phone=res.getString("phone");
				String address=res.getString("address");
				String role=res.getString("role");
				Timestamp createdDate=res.getTimestamp("createdDate");
				Timestamp lastLoginDate=res.getTimestamp("lastLoginDate");
				user= new UserModel(fullname, username ,password, email, phone, address,role, createdDate, lastLoginDate);
				list.add(user);
				
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return list;
	}

}
