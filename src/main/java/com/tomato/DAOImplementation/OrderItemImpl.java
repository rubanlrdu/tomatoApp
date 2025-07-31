package com.tomato.DAOImplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tomato.DAO.OrderItemDAO;
import com.tomato.models.OrderItemModel;

public class OrderItemImpl  implements OrderItemDAO {

	String INSERT="insert into `orderitem` (`orderID`,`menuId`,`quantity`,`totalPrice`) values(?,?,?,?)";
	
	String UPDATE="update `orderitem` set `quantity`=?,`totalPrice`=? where `orderItemId`=?";
	
	String SELECT="select * from `orderitem` whre `orderitemid`=?";
	String SELECTALL="select * from `orderitem`";
	String DELETE="delete from `orderitem` where `orderitemid`=?";
	
	public OrderItemImpl(){
		// TODO Auto-generated constructor stub
	}

	@Override
	public void setOrderItem(OrderItemModel orderItem) {
		Connection con = DataBaseConnection.getConnection();
		try {
			PreparedStatement pstmt =con.prepareStatement(INSERT);
			pstmt.setInt(1, orderItem.getOrderId());
			pstmt.setInt(2, orderItem.getMenuId());
			pstmt.setInt(3, orderItem.getQuantity());
			pstmt.setInt(4, orderItem.getTotalPrice());
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public OrderItemModel getOrderItem(OrderItemModel orderItem) {
		Connection con=DataBaseConnection.getConnection();
		OrderItemModel table=new OrderItemModel();
		try {
			PreparedStatement pstmt = con.prepareStatement(SELECT);
			pstmt.setInt(1, orderItem.getOrderId());
			ResultSet res=pstmt.executeQuery();
			
			if(res.next()) {
				int orderItemId=res.getInt("orderItemId");
				int orderId=res.getInt("orderId");
				int menuId=res.getInt("menuId");
				int quantity=res.getInt("quantity");
				int totalPrice=res.getInt("totalPrice");
				table=new OrderItemModel(orderItemId,orderId,menuId,quantity,totalPrice);
			}
			return table;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return table;
	}

	@Override
	public void updateOrderItem(OrderItemModel table) {
		Connection con=DataBaseConnection.getConnection();
		try {
			PreparedStatement pstmt =con.prepareStatement(UPDATE);
			
			pstmt.setInt(1,table.getQuantity());
			pstmt.setInt(2,table.getTotalPrice());
			pstmt.setInt(3,table.getOrderItemId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
	
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteOrderItem(OrderItemModel orderItem) {
		Connection con=DataBaseConnection.getConnection();
		try {
			PreparedStatement pstmt=con.prepareStatement(DELETE);
			pstmt.setInt(1, orderItem.getOrderItemId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<OrderItemModel> getAllOrderItem() {
		List<OrderItemModel> list= new ArrayList<OrderItemModel>();
		Connection con=DataBaseConnection.getConnection();
		OrderItemModel table=new OrderItemModel();
		try {
			PreparedStatement pstmt = con.prepareStatement(SELECTALL);
			ResultSet res=pstmt.executeQuery();
			
			if(res.next()) {
				int orderItemId=res.getInt("orderItemId");
				int orderId=res.getInt("orderId");
				int menuId=res.getInt("menuId");
				int quantity=res.getInt("quantity");
				int totalPrice=res.getInt("totalPrice");
				table=new OrderItemModel(orderItemId,orderId,menuId,quantity,totalPrice);
				list.add(table);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
