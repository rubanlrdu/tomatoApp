package com.tomato.servlets;

import java.io.IOException;

import com.tomato.DAO.MenuDAO;
import com.tomato.DAOImplementation.Cart;
import com.tomato.DAOImplementation.MenuImpl;
import com.tomato.models.CartItemModel;
import com.tomato.models.MenuModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{

		
		int menuId=Integer.parseInt(request.getParameter("menuId"));
		int restaurantId=Integer.parseInt(request.getParameter("restaurantId"));
		HttpSession session=request.getSession();
		Integer currentrestaurantId=(Integer) session.getAttribute("restaurantId");
		Cart cart=(Cart) session.getAttribute("Cart");
		
		
		if(cart==null || restaurantId!=currentrestaurantId) {
			
			cart=new Cart();
			session.setAttribute("Cart", cart);
			session.setAttribute("menuId",menuId);
			session.setAttribute("restaurantId", restaurantId);
			
		}
		
		String action=request.getParameter("action");
		
		if(action.equals("add")) {
			addItem(request,cart);		
		}
		else if(action.equals("update")) {
			
			updateItem(request,cart);	
		}
		else if(action.equals("delete")){
			cart.removeAllItems();
			
		}
		response.sendRedirect("CartPage.jsp");
	}
	
	void addItem(HttpServletRequest request, Cart cart) {
		int menuId=Integer.parseInt(request.getParameter("menuId"));
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		MenuImpl menuImpl=new MenuImpl();
		MenuModel menu=menuImpl.getMenu(menuId);
		CartItemModel item=new CartItemModel(menu.getMenuId(),menu.getRestaurantId(),menu.getItemName(),menu.getPrice(),quantity);
		cart.addItem(item);
		
	}
	void updateItem(HttpServletRequest request, Cart cart) {
		int menuId=Integer.parseInt(request.getParameter("menuId"));
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		cart.updateItem(menuId,quantity);
		
	}

}


























