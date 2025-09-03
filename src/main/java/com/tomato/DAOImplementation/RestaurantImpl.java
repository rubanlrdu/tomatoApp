package com.tomato.DAOImplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tomato.DAO.RestaurantDAO;
import com.tomato.models.RestaurantModel;

public class RestaurantImpl implements RestaurantDAO{
	
	String INSERT="INSERT into `restaurant` (`name`,`address`,`phone`,"
			+ "`rating`,`cusineType`,`isActive`,`eta`,`imagepath`,`restaurantUniqueidentifier`,`menuType`) values (?,?,?,?,?,?,?,?,?,?)";
	
	String UPDATE="update `restaurant` set `name`=?,`Address`=?,`phone`=?,`rating`=?,`cusinetype`=?,"
			+ "`isactive`=?,`eta`=?,`imagepath`=?,`menuType`=? where `restaurantUniqueidentifier`=?";
	
	String DELETE="delete from `restaurant` where `restaurantid`=?";
	
	String SELECT="select * from `restaurant` where `restaurantid`=?";
	
	String SELECTALL="select * from `restaurant`";
	@Override
	public void setRestaurant(RestaurantModel Restaurant) {
		Connection con = DataBaseConnection.getConnection();
		try {
			PreparedStatement pstmt =con.prepareStatement(INSERT);
			pstmt.setString(1, Restaurant.getName());
			pstmt.setString(2, Restaurant.getAddress());
			pstmt.setString(3, Restaurant.getPhone());
			pstmt.setInt(4, Restaurant.getRating());
			pstmt.setString(5, Restaurant.getCusineType());
			pstmt.setBoolean(6, Restaurant.isActive());
			pstmt.setString(7, Restaurant.getEta());
			pstmt.setString(8, Restaurant.getImagePath());
			pstmt.setString(9, Restaurant.getRestaurantUniqueIdentifier());
			pstmt.setString(10, Restaurant.getMenuType());
			System.out.print(pstmt.executeUpdate()+" "+ Restaurant.getName()+" restaurant is inserted");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteRestaurant(int restaurantId) {
		Connection con=DataBaseConnection.getConnection();
		try {
			PreparedStatement pstmt=con.prepareStatement(DELETE);
			pstmt.setInt(1, restaurantId );
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateRestaurant(RestaurantModel Restaurant) {
		Connection con=DataBaseConnection.getConnection();
		try {
			PreparedStatement pstmt =con.prepareStatement(UPDATE);
			
			pstmt.setString(1,Restaurant.getName());
			pstmt.setString(2,Restaurant.getAddress());
			pstmt.setString(3,Restaurant.getPhone());
			pstmt.setInt(4, Restaurant.getRating());
			pstmt.setString(5, Restaurant.getCusineType());
			pstmt.setBoolean(6, Restaurant.isActive());
			pstmt.setString(7, Restaurant.getEta());
			pstmt.setString(8, Restaurant.getImagePath());
			pstmt.setString(9, Restaurant.getRestaurantUniqueIdentifier());
			pstmt.setString(10, Restaurant.getMenuType());
			pstmt.executeUpdate();
		} catch (SQLException e) {
	
			e.printStackTrace();
		}
		
	}

	@Override
	public RestaurantModel getRestaurant(int restaurantId) {
		Connection con=DataBaseConnection.getConnection();
		RestaurantModel restaurant=new RestaurantModel();
		try {
			PreparedStatement pstmt = con.prepareStatement(SELECT);
			pstmt.setInt(1, restaurantId);
			ResultSet res=pstmt.executeQuery();
			
			if(res.next()) {
				int Id=res.getInt("restaurantId");
				String name=res.getString("name");
				String address=res.getString("address");
				String phone=res.getString("phone");
				int rating=res.getInt("rating");
				String cusineType=res.getString("cusineType");
				boolean isActive=res.getBoolean("isActive");
				String eta=res.getString("eta");
				int adminUserId=res.getInt("adminUserId");
				String imagepPath=res.getString("imagePath");
				String restaurantUniqueidentifier=res.getString("restaurantUniqueidentifier");
				String menuType=res.getString("menuType");
				restaurant= new RestaurantModel(Id,name,address,phone,rating,cusineType,isActive,eta,adminUserId,imagepPath,restaurantUniqueidentifier,menuType);
			}
			return restaurant;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return restaurant;
	}

	@Override
	public List<RestaurantModel> getAllRestaurant() {
		List<RestaurantModel> list= new ArrayList<RestaurantModel>();
		Connection con=DataBaseConnection.getConnection();
		RestaurantModel restaurant;
		try {
			PreparedStatement pstmt = con.prepareStatement(SELECTALL);
			ResultSet res=pstmt.executeQuery();
	
			while(res.next()) {
				int Id=res.getInt("restaurantId");
				String name=res.getString("name");
				String address=res.getString("address");
				String phone=res.getString("phone");
				int rating=res.getInt("rating");
				String cusineType=res.getString("cusineType");
				Boolean isActive=res.getBoolean("isActive");
				String eta=res.getString("eta");
				int adminUserId=res.getInt("adminUserId");
				String imagepPath=res.getString("imagePath");
				String restaurantUniqueidentifier=res.getString("restaurantUniqueidentifier");
				String menuType=res.getString("menuType");
				restaurant= new RestaurantModel(Id,name,address,phone,rating,cusineType,isActive,eta,adminUserId,imagepPath,restaurantUniqueidentifier,menuType);
				list.add(restaurant);
				
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return list;

	}

}
