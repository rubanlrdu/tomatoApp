package com.tomato.DAO;

import java.util.List;

import com.tomato.models.OrderModel;

public interface OrderDAO {

	void setOrder(OrderModel order);
	OrderModel getOrder(OrderModel order);
	void updateOrder(OrderModel order);
	void deleteOrder(OrderModel order);
	List<OrderModel> getAllOrder();
}
