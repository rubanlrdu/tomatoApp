package com.tomato.models;

import java.sql.Date;

public class OrderModel {

	int orderId;
	int userId;
	int restaurantId;
	Date orderDate;
	int totalAmount;
	String status;
	String paymentMode;
	
	public OrderModel() {
		
	}
	
	
	public OrderModel(int orderId, int userId, int restaurantId, Date orderDate, int totalAmount, String status,
			String paymentMode) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.restaurantId = restaurantId;
		this.orderDate = orderDate;
		this.totalAmount = totalAmount;
		this.status = status;
		this.paymentMode = paymentMode;
	}
	
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPaymentMode() {
		return paymentMode;
	}
	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}


	@Override
	public String toString() {
		return "OrderModel [orderId=" + orderId + ", userId=" + userId + ", restaurantId=" + restaurantId
				+ ", orderDate=" + orderDate + ", totalAmount=" + totalAmount + ", status=" + status + ", paymentMode="
				+ paymentMode + "]";
	}
	
}
