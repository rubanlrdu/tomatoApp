package com.tomato.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.tomato.DAO.UserDAO;
import com.tomato.DAOImplementation.UserImpl;
import com.tomato.models.UserModel;

/**
 * Servlet implementation class UserDbServlet
 */
@WebServlet("/UserDbServlet")
public class UserDbServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserDAO userImplementation=new UserImpl();
		UserModel userTable=new UserModel();
		String action=request.getParameter("action");
		if(action.equals("getAllUsers"))
		{
			List<UserModel> list=userImplementation.getAllUsers();
			request.setAttribute("allUsers",list);
		}
		else {
			userTable=userImplementation.getUser(request.getParameter("userName"));
			request.setAttribute("getUser",userTable);
		}
		

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String action=request.getParameter("action");
		
		switch(action)
		{
		case"create" :
			createUser(request, response);
			break;
		case "update" :
			updateUser(request, response);
			break;
		case "delete" :
			deleteUser(request,response);
			break;
			
		}
	}
	
	void createUser(HttpServletRequest request, HttpServletResponse response)
	{
		String name=request.getParameter("name");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		String role=request.getParameter("role");
		
		UserModel user=new UserModel();
		user.setName(name);
		user.setUserName(username);
		user.setPassword(password);
		user.setEmail(email);
		user.setPhone(phone);
		user.setAddress(address);
		user.setRole(role);
		UserDAO userImplementation=new UserImpl();
		userImplementation.setUser(user);	
	}
	void updateUser(HttpServletRequest request, HttpServletResponse response)
	{
		String name=request.getParameter("name");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		String role=request.getParameter("role");
		UserModel user=new UserModel(name,username,password,email,phone,address,role);
		UserDAO userImplementation=new UserImpl();
		userImplementation.updateUser(user);
	}
	void deleteUser(HttpServletRequest request, HttpServletResponse response)
	{
		String username=request.getParameter("username");
		UserDAO userImplementation=new UserImpl();
		userImplementation.deleteUser(username);
		
	}
	

}
