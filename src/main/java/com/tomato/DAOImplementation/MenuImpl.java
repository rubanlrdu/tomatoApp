package com.tomato.DAOImplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tomato.DAO.MenuDAO;
import com.tomato.models.MenuModel;

public class MenuImpl implements MenuDAO {
	
	String INSERT="insert into `menu` (`restaurantId`,`itemName`,`description`,`price`,`rating`,`isAvailable`,`imagePath`,`category`) values (?,?,?,?,?,?,?,?)";
	
	String UPDATE="update `menu` set `itemName`=?,`description`=?,`price`=?,`rating`=?,`isAvailable`=?,`imagePath`=?,`category`=? where `menuId`=?";
	
	String SELECT="select * from `menu` where `menuId`=?";
	
	String SELECTALL="select * from `menu`";
	
	String SELECTALLRESTAURANTMENU="select * from `menu` where `restaurantId`=?";
	
	String DELETE="delete from `menu` where `menuid`=?";
	String SELECTMENUBYCATEGORY="select * from `menu` where `restaurantId`=? and `category`=?";
	
	public MenuImpl() {
	}

	@Override
	public void setMenu(MenuModel menu) {
		Connection con = DataBaseConnection.getConnection();
		try {
			PreparedStatement pstmt =con.prepareStatement(INSERT);
			pstmt.setInt(1, menu.getRestaurantId());
			pstmt.setString(2, menu.getItemName());
			pstmt.setString(3, menu.getDescription());
			pstmt.setInt(4, menu.getPrice());
			pstmt.setInt(5, menu.getRating());
			pstmt.setBoolean(6, menu.isAvailable());
			pstmt.setString(7, menu.getImagePath());
			pstmt.setString(8, menu.getCategory());
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public MenuModel getMenu(int menuId) {
		Connection con=DataBaseConnection.getConnection();
		MenuModel table=new MenuModel();
		try {
			PreparedStatement pstmt = con.prepareStatement(SELECT);
			pstmt.setInt(1, menuId);
			ResultSet res=pstmt.executeQuery();
			
			if(res.next()) {
				int restaurantId=res.getInt("restaurantId");
				String itemName=res.getString("itemName");
				String description=res.getString("description");
				int price=res.getInt("price");
				int rating=res.getInt("rating");
				Boolean isAvailable=res.getBoolean("isAvailable");
				String imagePath=res.getString("imagePath");
				String category=res.getString("category");
				table=new MenuModel(menuId,restaurantId,itemName,description,price,rating,isAvailable,imagePath,category);
			}
			return table;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return table;
	}

	@Override
	public int updateMenu(MenuModel table) {
		Connection con=DataBaseConnection.getConnection();
		try {
			PreparedStatement pstmt =con.prepareStatement(UPDATE);
			
			pstmt.setString(1,table.getItemName());
			pstmt.setString(2,table.getDescription());
			pstmt.setInt(3,table.getPrice());
			pstmt.setInt(4,table.getRating());
			pstmt.setBoolean(5,table.isAvailable());
			pstmt.setString(6,table.getImagePath());
			pstmt.setString(7,table.getCategory());
			pstmt.setInt(8,table.getMenuId());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
	
			e.printStackTrace();
		}
		return 0;
		
	}

	@Override
	public void deleteMenu(MenuModel menu) {
		Connection con=DataBaseConnection.getConnection();
		try {
			PreparedStatement pstmt=con.prepareStatement(DELETE);
			pstmt.setInt(1, menu.getMenuId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<MenuModel> getAllMenu() {
		List<MenuModel> list= new ArrayList<MenuModel>();
		Connection con=DataBaseConnection.getConnection();
		MenuModel table=new MenuModel();
		try {
			PreparedStatement pstmt = con.prepareStatement(SELECTALL);
			pstmt.setInt(1, table.getMenuId());
			ResultSet res=pstmt.executeQuery();
			
			while(res.next()) {
				int menuId=res.getInt("menuId");
				int restaurantId=res.getInt("restaurantId");
				String itemName=res.getString("itemName");
				String description=res.getString("description");
				int price=res.getInt("price");
				int rating=res.getInt("rating");
				Boolean isAvailable=res.getBoolean("isAvailable");
				String imagePath=res.getString("imagePath");
				String category=res.getString("category");
				table=new MenuModel(menuId,restaurantId,itemName,description,price,rating,isAvailable,imagePath,category);
				list.add(table);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<MenuModel> getAllRestaurantMenu(int restaurantId) {
		List<MenuModel> list= new ArrayList<MenuModel>();
		Connection con=DataBaseConnection.getConnection();
		MenuModel table=new MenuModel();
		try {
			PreparedStatement pstmt = con.prepareStatement(SELECTALLRESTAURANTMENU);

			pstmt.setInt(1, restaurantId);
			ResultSet res=pstmt.executeQuery();
			
			while(res.next()) {
				int menuId=res.getInt("menuId");
				restaurantId=res.getInt("restaurantId");
				String itemName=res.getString("itemName");
				String description=res.getString("description");
				int price=res.getInt("price");
				int rating=res.getInt("rating");
				Boolean isAvailable=res.getBoolean("isAvailable");
				String imagePath=res.getString("imagePath");
				String category=res.getString("category");
				table=new MenuModel(menuId,restaurantId,itemName,description,price,rating,isAvailable,imagePath,category);
				list.add(table);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<MenuModel> getMenyByCategory(int restaurantId, String category) {
		List<MenuModel> list= new ArrayList<MenuModel>();
		Connection con=DataBaseConnection.getConnection();
		MenuModel table=new MenuModel();
		try {
			PreparedStatement pstmt = con.prepareStatement(SELECTMENUBYCATEGORY);

			pstmt.setInt(1, restaurantId);
			pstmt.setString(2, category);
			ResultSet res=pstmt.executeQuery();
			
			while(res.next()) {
				int menuId=res.getInt("menuId");
				restaurantId=res.getInt("restaurantId");
				String itemName=res.getString("itemName");
				String description=res.getString("description");
				int price=res.getInt("price");
				int rating=res.getInt("rating");
				Boolean isAvailable=res.getBoolean("isAvailable");
				String imagePath=res.getString("imagePath");
				category=res.getString("category");
				table=new MenuModel(menuId,restaurantId,itemName,description,price,rating,isAvailable,imagePath,category);
				list.add(table);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
