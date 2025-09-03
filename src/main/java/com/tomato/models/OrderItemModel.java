package com.tomato.models;

public class OrderItemModel {

	int orderItemId;
	int orderId;
	int menuId;
	int quantity;
	float totalPrice;
	
	public OrderItemModel()
	{
		
	}
	
	public OrderItemModel(int orderItemId, int orderId, int menuId, int quantity, float totalPrice) {
		super();
		this.orderItemId = orderItemId;
		this.orderId = orderId;
		this.menuId = menuId;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
	}
	
	public int getOrderItemId() {
		return orderItemId;
	}
	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "OrderItemModel [orderItemId=" + orderItemId + ", orderId=" + orderId + ", menuId=" + menuId
				+ ", quantity=" + quantity + ", totalPrice=" + totalPrice + "]";
	}
	
	
}
