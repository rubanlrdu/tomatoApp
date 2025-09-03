package com.tomato.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.tomato.DAO.AddressDAO;
import com.tomato.DAO.OrderItemDAO;
import com.tomato.DAOImplementation.AddressImpl;
import com.tomato.DAOImplementation.Cart;
import com.tomato.DAOImplementation.OrderImpl;
import com.tomato.DAOImplementation.OrderItemImpl;
import com.tomato.models.AddressModel;
import com.tomato.models.CartItemModel;
import com.tomato.models.OrderItemModel;
import com.tomato.models.OrderModel;


@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		OrderImpl orderImpl=new OrderImpl();
		OrderModel order=new OrderModel();
		HttpSession session=request.getSession();
		Cart cart=(Cart) session.getAttribute("Cart");
		String user=(String) session.getAttribute("userName");
		if(user==null)
		{
			RequestDispatcher rd=request.getRequestDispatcher("LoginPage.jsp");
			rd.forward(request,response);
		}
		
		String address=null;
		String saveAddress=request.getParameter("saveAddress");
		
		int userId=(Integer)session.getAttribute("userId");
		String addressLine1=request.getParameter("addressLine1");
		String addressLine2=request.getParameter("addressLine2");
		String landmark=request.getParameter("landmark");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String postalCode=request.getParameter("postalCode");
		String addressType=request.getParameter("addressType");
		Boolean isDefaultAddress=true;

		if(request.getParameter("existingAddress").equalsIgnoreCase("none"))
		{
			address=addressLine1+", "+addressLine2+", "+landmark+", "+city+", "+state+", "+postalCode +", Address Type : "+addressType;
			
		}
		else
		{
			address=request.getParameter("existingAddress");
		}
		
		
		order.setUserId(userId);
		order.setPaymentMode(request.getParameter("paymentOption"));
		order.setRestaurantId((Integer)session.getAttribute("restaurantId"));
		order.setStatus("Confirmed");
		order.setOrderDate(LocalDateTime.now());
		order.setTotalAmount((float)session.getAttribute("totalPrice"));
		order.setAddress(address);
		Integer orderId=orderImpl.setOrder(order);
		
		if(saveAddress.equalsIgnoreCase("yes"))
		{
			AddressModel addressTable=new AddressModel(userId,addressLine1,addressLine2,landmark,city,state,postalCode,addressType,isDefaultAddress);
			AddressDAO addressImpl=new AddressImpl();
			addressImpl.setAddress(addressTable);
		}
		
		
		int orderItemId = 0;
		
		if (orderId!=null)
		{
			for (CartItemModel item : cart.getAllItems().values()) {
				OrderItemModel orderItem=new OrderItemModel();
				OrderItemDAO orderItemImpl=new OrderItemImpl();
				orderItem.setOrderId((int)orderId);
				orderItem.setMenuId(item.getId());
				orderItem.setQuantity(item.getQuantity());
				orderItem.setTotalPrice((float)item.getPrice());
				orderItemId=orderItemImpl.setOrderItem(orderItem);	
			}
			
		RequestDispatcher rd=request.getRequestDispatcher("OrderCompletePage.jsp");
		request.setAttribute("orderId", orderId);
		rd.forward(request,response);
		}
		
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
