package com.tomato.DAO;

import java.util.List;

import com.tomato.models.OrderItemModel;

public interface OrderItemDAO {

	int setOrderItem(OrderItemModel orderItem);
	OrderItemModel getOrderItem(OrderItemModel orderItem);
	void updateOrderItem(OrderItemModel orderItem);
	void deleteOrderItem(OrderItemModel orderItem);
	List<OrderItemModel>getAllOrderItem();
	List<OrderItemModel>getAllOrderItemByOrderId(int orderId);
	
}
