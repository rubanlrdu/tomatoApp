package com.tomato.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.tomato.DAOImplementation.RestaurantImpl;
import com.tomato.models.RestaurantModel;

@WebServlet("/Home")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 RestaurantImpl restaurantImpl=new RestaurantImpl();
		 List<RestaurantModel> list=restaurantImpl.getAllRestaurant();
		 HttpSession session=request.getSession();
		 String userName=(String) session.getAttribute("userName");
		 
		 RequestDispatcher rd=request.getRequestDispatcher("Home.jsp");
		 request.setAttribute("restaurants",list);
		 request.setAttribute("userName",userName);
		 rd.forward(request, response);
	}

}
