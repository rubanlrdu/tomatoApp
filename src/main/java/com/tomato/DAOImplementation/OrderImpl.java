package com.tomato.DAOImplementation;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.tomato.DAO.OrderDAO;
import com.tomato.models.OrderModel;

public class OrderImpl implements OrderDAO{
	
	String INSERT="insert into `order` (`userId`,`restuarantId`,`orderDate`,`totalAmount`,`status`,`paymentMode`,`address`) values (?,?,?,?,?,?,?)";
	
	String UPDATE="update `order` set `orderDate`=?,`totalAmount`=?,`status`=?, `paymentMode`=? where `orderId`=?";
	
	String SELECT="select * from `order` where `orderid`=?";
	
	String SELECTBYUSER="select * from `order` where `userid`=?";
	
	String SELECTALL="select * from `order`";
	
	String DELETE="delete from `order` where `orderId`=?";
	public OrderImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int setOrder(OrderModel order) {
		Connection con = DataBaseConnection.getConnection();
		int orderId=0;
		try {
			PreparedStatement pstmt =con.prepareStatement(INSERT,Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, order.getUserId());
			pstmt.setInt(2, order.getRestaurantId());
			pstmt.setObject(3, order.getOrderDate());
			pstmt.setFloat(4, order.getTotalAmount());
			pstmt.setString(5, order.getStatus());
			pstmt.setString(6, order.getPaymentMode());
			pstmt.setString(7, order.getAddress());
			
			pstmt.executeUpdate();
			
			ResultSet ids=pstmt.getGeneratedKeys();
			while(ids.next())
			{
				orderId=ids.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderId;
		
	}

	@Override
	public OrderModel getOrder(OrderModel order) {
		Connection con=DataBaseConnection.getConnection();
		OrderModel table=new OrderModel();
		try {
			PreparedStatement pstmt = con.prepareStatement(SELECT);
			pstmt.setInt(1, order.getOrderId());
			ResultSet res=pstmt.executeQuery();
			
			if(res.next()) {
				int orderId=res.getInt("orderId");
				int userId=res.getInt("userId");
				int restaurantId=res.getInt("restuarantId");
				LocalDateTime orderDate=(LocalDateTime) res.getObject("orderDate");
				int totalAmount=res.getInt("totalAmount");
				String status=res.getString("status");
				String paymentMode=res.getString("paymentMode");
				String address=res.getString("address");
				table=new OrderModel(orderId,userId,restaurantId,orderDate,totalAmount,status,paymentMode,address);
			}
			return table;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return table;
	}
	@Override
	public List<OrderModel> getOrderByUser(OrderModel order) {
		Connection con=DataBaseConnection.getConnection();
		OrderModel table=new OrderModel();
		List<OrderModel> list= new ArrayList<OrderModel>();
		try {
			PreparedStatement pstmt = con.prepareStatement(SELECTBYUSER);
			pstmt.setInt(1, order.getUserId());
			ResultSet res=pstmt.executeQuery();
			
			while(res.next()) {
				int orderId=res.getInt("orderId");
				int userId=res.getInt("userId");
				int restaurantId=res.getInt("restuarantId");
				LocalDateTime orderDate=(LocalDateTime) res.getObject("orderDate");
				int totalAmount=res.getInt("totalAmount");
				String status=res.getString("status");
				String paymentMode=res.getString("paymentMode");
				String address=res.getString("address");
				table=new OrderModel(orderId,userId,restaurantId,orderDate,totalAmount,status,paymentMode,address);
				list.add(table);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public void updateOrder(OrderModel table) {
		Connection con=DataBaseConnection.getConnection();
		try {
			PreparedStatement pstmt =con.prepareStatement(UPDATE);
			
			pstmt.setObject(1,table.getOrderDate());
			pstmt.setFloat(2,table.getTotalAmount());
			pstmt.setString(3,table.getStatus());
			pstmt.setString(4,table.getPaymentMode());
			pstmt.setInt(5,table.getOrderId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
	
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteOrder(OrderModel order) {
		Connection con=DataBaseConnection.getConnection();
		try {
			PreparedStatement pstmt=con.prepareStatement(DELETE);
			pstmt.setInt(1, order.getOrderId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<OrderModel> getAllOrder() {
		List<OrderModel> list= new ArrayList<OrderModel>();
		Connection con=DataBaseConnection.getConnection();
		OrderModel table=new OrderModel();
		try {
			PreparedStatement pstmt = con.prepareStatement(SELECTALL);
			ResultSet res=pstmt.executeQuery();
			
			while(res.next()) {
				int orderId=res.getInt("orderId");
				int userId=res.getInt("userId");
				int restaurantId=res.getInt("restaurantId");
				LocalDateTime orderDate=(LocalDateTime) res.getObject("orderDate");
				Float totalAmount=res.getFloat("totalAmount");
				String status=res.getString("status");
				String paymentMode=res.getString("paymentMode");
				String address=res.getString("address");
				table=new OrderModel(orderId,userId,restaurantId,orderDate,totalAmount,status,paymentMode,address);
				list.add(table);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
