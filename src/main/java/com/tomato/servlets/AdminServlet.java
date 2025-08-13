package com.tomato.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String option=request.getParameter("option");
		response.setContentType("text/html");
		if(option.equals("restaurant"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("RestaurantTasks.jsp");	
			rd.include(request, response);
		}
		else if(option.equals("menu"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("MenuTasks.jsp");	
			rd.include(request, response);
		}
		
	
	}

}
