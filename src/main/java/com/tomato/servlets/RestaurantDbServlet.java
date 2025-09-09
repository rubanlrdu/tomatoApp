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
	
	void createRestaurant(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
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
		String menuType=request.getParameter("menuType");
		boolean isActive=true;	
		RestaurantModel table=new RestaurantModel(restaurantName,restaurantAddress,restaurantPhone,
				restaurantRating,restaurantCusineType,isActive,restaurantEta,adminUserId,restaurantImagePath,restaurantIdentifier,menuType);
		restaurantImplementation.setRestaurant(table);
		System.out.print("Restaurant Added Maybe");
		String redirectTo=request.getParameter("redirectTo");
		if(redirectTo.equalsIgnoreCase("ManageRestaurant"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("ManageRestaurant.jsp");
			rd.include(request, response);
		}
		
	}
	void updateRestaurant(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{	RestaurantDAO restaurantImplementation=new RestaurantImpl();
		RestaurantModel existingRestaurant=restaurantImplementation.getRestaurant(Integer.parseInt(request.getParameter("restaurantIdentifier")));
		int restaurantIdentifier=Integer.parseInt(request.getParameter("restaurantIdentifier"));
		String restaurantName="";
		String restaurantAddress="";
		String restaurantPhone="";
		String restaurantCusineType="";
		String restaurantEta="";
		String restaurantImagePath="";
		int restaurantRating=0;
		boolean isActive=true;	
		String menuType="";
		if(!request.getParameter("restaurantName").isBlank())
		{
			restaurantName=request.getParameter("restaurantName");
		}
		else {
			restaurantName=existingRestaurant.getName();
		}
		if(!request.getParameter("restaurantAddress").isBlank()) {
			restaurantAddress=request.getParameter("restaurantAddress");
		}
		else {
			restaurantAddress=existingRestaurant.getAddress();
		}
		if(!request.getParameter("restaurantPhone").isBlank())
		{
			restaurantPhone=request.getParameter("restaurantPhone");
		}
		else {
			restaurantPhone=existingRestaurant.getPhone();
		}
		
		if(!request.getParameter("restaurantRating").isBlank())
		{
			restaurantRating=Integer.parseInt(request.getParameter("restaurantRating"));
		}
		else {
			restaurantRating=existingRestaurant.getRating();
		}
		if(!request.getParameter("restaurantCusineType").isBlank())
		{
		restaurantCusineType=request.getParameter("restaurantCusineType");
		}
		else {
			restaurantCusineType=existingRestaurant.getCusineType();
		}
		if(!request.getParameter("restaurantEta").isBlank()) {
			restaurantEta=request.getParameter("restaurantEta");
		}
		else {
			restaurantEta=existingRestaurant.getEta();
		}
		
		int adminUserId=Integer.parseInt(request.getParameter("adminUserId"));
		
		if(!request.getParameter("restaurantImagePath").isBlank()) {
			restaurantImagePath=request.getParameter("restaurantImagePath");
		}
		else
		{
			restaurantImagePath=existingRestaurant.getImagePath();
		}
		String restaurantUniqueIdentifier=request.getParameter("restaurantUniqueIdentifier");
		if(request.getParameter("isAvailable").equalsIgnoreCase("1"))	
		{
			isActive=true;
		}
		else {
			isActive=false;
		}
		if(!request.getParameter("menuType").isBlank()) {
			menuType=request.getParameter("menuType");
		}
		else
		{
			menuType=existingRestaurant.getMenuType();
		}
		RestaurantModel table=new RestaurantModel(restaurantIdentifier,restaurantName,restaurantAddress,restaurantPhone,
				restaurantRating,restaurantCusineType,isActive,restaurantEta,adminUserId,restaurantImagePath,restaurantUniqueIdentifier,menuType);
		restaurantImplementation.updateRestaurant(table);
		
		String redirectTo=request.getParameter("redirectTo");
		if(redirectTo.equalsIgnoreCase("ManageRestaurant"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("ManageRestaurant.jsp");
			rd.include(request, response);
		}
		
		
	}
	void deleteRestaurant(HttpServletRequest request, HttpServletResponse response)
	{
		restaurantImplementation.deleteRestaurant(Integer.parseInt(request.getParameter("restaurantId")));
	}

}
