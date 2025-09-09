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

import com.tomato.DAO.MenuDAO;
import com.tomato.DAOImplementation.MenuImpl;
import com.tomato.models.MenuModel;


@WebServlet("/MenuDbServlet")
public class MenuDbServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MenuDAO menuImplementation=new MenuImpl();
	MenuModel menuTable=new MenuModel();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action=request.getParameter("menuAction");
		if(action.equals("allMenu"))
		{
			List<MenuModel> list=menuImplementation.getAllMenu();
			request.setAttribute("getAllRestaurant",list);
		}
		else if(action.equals("getAllRestaurantMenu")){
			List<MenuModel> list=menuImplementation.getAllRestaurantMenu(Integer.parseInt(request.getParameter("restaurantIdForMenu")));
			HttpSession session = request.getSession();
			session.setAttribute("getAllRestaurantMenu", list);
			request.setAttribute("getAllRestaurantMenu",list);
//			RequestDispatcher rd=request.getRequestDispatcher("MenuTasks.jsp");
//			rd.include(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

String action=request.getParameter("menuAction");
		
		switch(action)
		{
		case"create" :
			createMenu(request, response);
			break;
		case "update" :
			updateMenu(request, response);
			break;
		case "delete" :
			deleteMenu(request,response);
			break;
			
		}
	}
	
	void createMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int restaurantId=Integer.parseInt(request.getParameter("restaurantId"));
		String itemName=request.getParameter("itemName");
		String description=request.getParameter("description");
		int price=Integer.parseInt(request.getParameter("price"));
		int rating=Integer.parseInt(request.getParameter("rating"));
		Boolean isAvailable=Boolean.valueOf(request.getParameter("isAvailable"));
		String imagePath=request.getParameter("imagePath");
		String category=request.getParameter("category");
		menuTable=new MenuModel(restaurantId,itemName,description,price,rating,isAvailable,imagePath,category);
		menuImplementation.setMenu(menuTable);
		System.out.print("Menu Created Maybe");
		if(request.getParameter("redirectTo").equalsIgnoreCase("manageMenu"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("ManageMenu.jsp");
			rd.forward(request, response);
		}
		
	}
	void updateMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		MenuDAO menuImpl=new MenuImpl();
		int restaurantId=Integer.parseInt(request.getParameter("restaurantId"));
		int menuId=Integer.parseInt(request.getParameter("menuId"));
		
		MenuModel existingMenu=menuImpl.getMenu(menuId);
		String itemName="";
		String description="";
		int price=0;
		int rating=0;
		String imagePath="";
		String category="";
		
		if(!request.getParameter("itemName").isBlank()) {
			itemName=request.getParameter("itemName");
		}
		else {
			itemName=existingMenu.getItemName();
		}
		
		if(!request.getParameter("description").isBlank()) {	
			description=request.getParameter("description");
		}
		else {
			description=existingMenu.getDescription();
		}
		
		if(!request.getParameter("price").isBlank()) {
			price=Integer.parseInt(request.getParameter("price"));
			
		}
		else {
			price=existingMenu.getPrice();
		}
		if(!request.getParameter("rating").isBlank()) {
			rating=Integer.parseInt(request.getParameter("rating"));
		}
		else {
			rating=existingMenu.getRating();
		}
		
		Boolean isAvailable=Boolean.valueOf(request.getParameter("isAvailable"));
		
		if(!request.getParameter("imagePath").isBlank()) {
			
			imagePath=request.getParameter("imagePath");
		}
		else {
			imagePath=existingMenu.getImagePath();
		}
		
		if(!request.getParameter("category").isBlank()) {
			category=request.getParameter("category");
		}
		
		else {
			category=existingMenu.getCategory();
		}
		menuTable=new MenuModel(menuId,restaurantId,itemName,description,price,rating,isAvailable,imagePath,category);
		menuImplementation.updateMenu(menuTable);
		if(request.getParameter("redirectTo").equalsIgnoreCase("editMenu"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("EditMenu.jsp");
			rd.forward(request, response);
		}
		
	}
	void deleteMenu(HttpServletRequest request, HttpServletResponse response)
	{
		menuTable.setMenuId(Integer.parseInt(request.getParameter("menuId")));
		menuImplementation.deleteMenu(menuTable);
	}
	

}
