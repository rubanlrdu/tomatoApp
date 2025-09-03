package com.tomato.models;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

public class OrderModel {

	int orderId;
	int userId;
	int restaurantId;
	LocalDateTime orderDate;
	float totalAmount;
	String status;
	String address;
	String paymentMode;
	
	public OrderModel() {
		
	}
	
	
	
	public OrderModel(int orderId, int userId, int restaurantId, LocalDateTime orderDate, float totalAmount,
			String status, String address, String paymentMode) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.restaurantId = restaurantId;
		this.orderDate = orderDate;
		this.totalAmount = totalAmount;
		this.status = status;
		this.address = address;
		this.paymentMode = paymentMode;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
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
	public LocalDateTime getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(LocalDateTime l) {
		this.orderDate = l;
	}
	public float getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(float totalAmount) {
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
