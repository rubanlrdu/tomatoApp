package com.tomato.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.tomato.DAOImplementation.MenuImpl;
import com.tomato.models.MenuModel;


@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		int restaurantId=Integer.parseInt(request.getParameter("restaurantId"));
				
		MenuImpl menuImpl=new MenuImpl();
		
		List<MenuModel> menu=menuImpl.getAllRestaurantMenu(restaurantId);
		RequestDispatcher rd=request.getRequestDispatcher("MenuPage.jsp");
		request.setAttribute("menus", menu);
		rd.forward(request,response);
		
	}

}
