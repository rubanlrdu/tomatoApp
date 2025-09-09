package com.tomato.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.tomato.DAO.RestaurantDAO;
import com.tomato.DAOImplementation.RestaurantImpl;
import com.tomato.models.RestaurantModel;

/**
 * Servlet implementation class ManageRestaurantServlet
 */
@WebServlet("/ManageRestaurantServlet")
public class ManageRestaurantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session= request.getSession();
		int userId=(Integer)(session.getAttribute("userId")) ;
		RestaurantDAO restaurantImpl=new RestaurantImpl();
		RestaurantModel restaurant=restaurantImpl.getRestaurantByAdmin(userId);
			if(restaurant.getRestaurantUniqueIdentifier()==null)
			{
				RequestDispatcher rd=request.getRequestDispatcher("NewRestaurant.jsp");
				rd.include(request, response);
			}
			else {
				request.setAttribute("restaurantId", restaurant.getRestaurantId());
				System.out.print("restauarantId"+restaurant.getRestaurantId());
				session.setAttribute("restaurantId", restaurant.getRestaurantId());
				RequestDispatcher rd=request.getRequestDispatcher("ManageRestaurant.jsp");
				rd.forward(request, response);
			}
			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
