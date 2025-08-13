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

import com.tomato.DAO.RestaurantDAO;
import com.tomato.DAOImplementation.RestaurantImpl;
import com.tomato.models.RestaurantModel;

@WebServlet("/RestaurantDbServlet")
public class RestaurantDbServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	RestaurantDAO restaurantImplementation=new RestaurantImpl();
	RestaurantModel restaurantTable=new RestaurantModel();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action=request.getParameter("restaurantAction");
		if(action.equals("allRestaurant"))
		{
			List<RestaurantModel> list=restaurantImplementation.getAllRestaurant();
			HttpSession session = request.getSession();
			session.setAttribute("getAllRestaurant", list);
//			request.setAttribute("getAllRestaurant",list);
			RequestDispatcher rd=request.getRequestDispatcher("RestaurantTasks.jsp");
			rd.include(request, response);
		}
		else if(action.equals("getRestaurant")){
			restaurantTable=restaurantImplementation.getRestaurant(Integer.parseInt(request.getParameter("restaurantId")));
			request.setAttribute("getRestaurant",restaurantTable);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String action=request.getParameter("restaurantAction");
		
		switch(action)
		{
		case"create" :
			createRestaurant(request, response);
			break;
		case "update" :
			updateRestaurant(request, response);
			break;
		case "delete" :
			deleteRestaurant(request,response);
			break;
			
		}
	}
	
	void createRestaurant(HttpServletRequest request, HttpServletResponse response)
	{
		String restaurantIdentifier=request.getParameter("restaurantIdentifier");
		String restaurantName=request.getParameter("restaurantName");
		String restaurantAddress=request.getParameter("restaurantAddress");
		String restaurantPhone=request.getParameter("restaurantPhone");
		int restaurantRating=Integer.parseInt(request.getParameter("restaurantRating"));
		String restaurantCusineType=request.getParameter("restaurantCusineType");
		String restaurantEta=request.getParameter("restaurantEta");
		int adminUserId=Integer.parseInt(request.getParameter("adminUserId"));
		String restaurantImagePath=request.getParameter("restaurantImagePath");
		boolean isActive=true;	
		RestaurantModel table=new RestaurantModel(restaurantName,restaurantAddress,restaurantPhone,
				restaurantRating,restaurantCusineType,isActive,restaurantEta,adminUserId,restaurantImagePath,restaurantIdentifier);
		restaurantImplementation.setRestaurant(table);
		System.out.print("Restaurant Added Maybe");
		
	}
	void updateRestaurant(HttpServletRequest request, HttpServletResponse response)
	{
		String restaurantIdentifier=request.getParameter("restaurantIdentifier");
		String restaurantName=request.getParameter("restaurantName");
		String restaurantAddress=request.getParameter("restaurantAddress");
		String restaurantPhone=request.getParameter("restaurantPhone");
		int restaurantRating=Integer.parseInt(request.getParameter("restaurantRating"));
		String restaurantCusineType=request.getParameter("restaurantCusineType");
		String restaurantEta=request.getParameter("restaurantEta");
		int adminUserId=Integer.parseInt(request.getParameter("adminUserId"));
		String restaurantImagePath=request.getParameter("restaurantImagePath");
		boolean isActive=true;	
		RestaurantModel table=new RestaurantModel(restaurantName,restaurantAddress,restaurantPhone,
				restaurantRating,restaurantCusineType,isActive,restaurantEta,adminUserId,restaurantImagePath,restaurantIdentifier);
		restaurantImplementation.updateRestaurant(table);
		
	}
	void deleteRestaurant(HttpServletRequest request, HttpServletResponse response)
	{
		restaurantImplementation.deleteRestaurant(Integer.parseInt(request.getParameter("restaurantId")));
	}

}
