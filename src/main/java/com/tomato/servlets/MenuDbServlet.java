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
	
	void createMenu(HttpServletRequest request, HttpServletResponse response)
	{
		int restaurantId=Integer.parseInt(request.getParameter("restaurantId"));
		String itemName=request.getParameter("itemName");
		String description=request.getParameter("description");
		int price=Integer.parseInt(request.getParameter("price"));
		int rating=Integer.parseInt(request.getParameter("rating"));
		Boolean isAvailable=Boolean.valueOf(request.getParameter("isAvailable"));
		String imagePath=request.getParameter("imagePath");
		menuTable=new MenuModel(restaurantId,itemName,description,price,rating,isAvailable,imagePath);
		menuImplementation.setMenu(menuTable);
		System.out.print("Menu Created Maybe");
		
	}
	void updateMenu(HttpServletRequest request, HttpServletResponse response)
	{
		int restaurantId=Integer.parseInt(request.getParameter("restaurantId"));
		int menuId=Integer.parseInt(request.getParameter("menuId"));
		String itemName=request.getParameter("itemName");
		String description=request.getParameter("description");
		int price=Integer.parseInt(request.getParameter("price"));
		int rating=Integer.parseInt(request.getParameter("rating"));
		Boolean isAvailable=Boolean.valueOf(request.getParameter("isAvailable"));
		String imagePath=request.getParameter("imagePath");
		menuTable=new MenuModel(menuId,restaurantId,itemName,description,price,rating,isAvailable,imagePath);
		menuImplementation.updateMenu(menuTable);
		
	}
	void deleteMenu(HttpServletRequest request, HttpServletResponse response)
	{
		menuTable.setMenuId(Integer.parseInt(request.getParameter("menuId")));
		menuImplementation.deleteMenu(menuTable);
	}
	

}
