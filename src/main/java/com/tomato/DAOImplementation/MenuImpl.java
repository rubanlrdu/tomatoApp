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
	
	String INSERT="insert into `menu` (`restaurantId`,`itemName`,`description`,`price`,`ratings`,`isVailable`,`imagePath`) values (?,?,?,?,?,?,?)";
	
	String UPDATE="update `menu` set `itemName`=?,`description`=?,`price`=?,`ratings`=?,`isAvailable`=?,`imagePath`=? where `menuId`=?";
	
	String SELECT="select * from `menu` where `menuId`=?";
	
	String SELECTALL="select * from `menu`";
	
	String DELETE="delete from `menu` where `menuid`=?";
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
			pstmt.setInt(5, menu.getRatings());
			pstmt.setBoolean(6, menu.isAvailable());
			pstmt.setString(7, menu.getImagePath());
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public MenuModel getMenu(MenuModel menu) {
		Connection con=DataBaseConnection.getConnection();
		MenuModel table=new MenuModel();
		try {
			PreparedStatement pstmt = con.prepareStatement(SELECT);
			pstmt.setInt(1, menu.getMenuId());
			ResultSet res=pstmt.executeQuery();
			
			if(res.next()) {
				int menuId=res.getInt("menuId");
				int restauarantId=res.getInt("restauarantId");
				String itemName=res.getString("itemName");
				String description=res.getString("description");
				int price=res.getInt("price");
				int ratings=res.getInt("ratings");
				Boolean isAvailable=res.getBoolean("isAvailable");
				String imagePath=res.getString("imagePath");
				table=new MenuModel(menuId,restauarantId,itemName,description,price,ratings,isAvailable,imagePath);
			}
			return table;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return table;
	}

	@Override
	public void updateMenu(MenuModel table) {
		Connection con=DataBaseConnection.getConnection();
		try {
			PreparedStatement pstmt =con.prepareStatement(UPDATE);
			
			pstmt.setString(1,table.getItemName());
			pstmt.setString(2,table.getDescription());
			pstmt.setInt(3,table.getPrice());
			pstmt.setInt(4,table.getRatings());
			pstmt.setBoolean(5,table.isAvailable());
			pstmt.setString(6,table.getImagePath());
			pstmt.setInt(7,table.getMenuId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
	
			e.printStackTrace();
		}
		
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
				int restauarantId=res.getInt("restauarantId");
				String itemName=res.getString("itemName");
				String description=res.getString("description");
				int price=res.getInt("price");
				int ratings=res.getInt("ratings");
				Boolean isAvailable=res.getBoolean("isAvailable");
				String imagePath=res.getString("imagePath");
				table=new MenuModel(menuId,restauarantId,itemName,description,price,ratings,isAvailable,imagePath);
				list.add(table);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
