package com.tomato.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.tomato.DAOImplementation.UserImpl;
import com.tomato.models.UserModel;
import com.tomato.DAO.UserDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet{
	static int count=3;
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException
	{
		String userName=req.getParameter("username");
		String password=req.getParameter("password");
		String role=req.getParameter("role");
		UserDAO userImplementation=new UserImpl();
		UserModel userTable=new UserModel();
		userTable.setUserName(userName);
		userTable.setPassword(password);
		userTable=userImplementation.getUser(userName);
			
		resp.setContentType("text/html");
		
		if(userName.equals(userTable.getUserName()) && password.equals(userTable.getPassword()))
		{
			HttpSession session= req.getSession();
			session.setAttribute("userName", userTable.getUserName());
			session.setAttribute("userId", userTable.getUserId());
			req.setAttribute("userId", userTable.getUserId());
			if(role.equalsIgnoreCase("customer"))
			{
			resp.sendRedirect("Home");
			}
			
			else if(role.equalsIgnoreCase("admin"))
			{
				resp.sendRedirect("AdminPage.jsp");
			}
			else if(role.equalsIgnoreCase("restaurant"))
			{
				resp.sendRedirect("ManageRestaurantServlet");
			}
		}
		else if(count>0)
		{
			PrintWriter out= resp.getWriter();
			out.print("Remaining"+ count-- +" attempts left.");
			RequestDispatcher rd=req.getRequestDispatcher("LoginPage.jsp");
			rd.include(req, resp);
		}
		else
		{
			PrintWriter out=resp.getWriter();
			out.print("u r fucked !");
	}
	}
}
