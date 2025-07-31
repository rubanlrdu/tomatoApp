package com.tomato.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.tomato.DAOImplementation.UserImpl;
import com.tomato.models.UserModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet{
	static int count=3;
	private static final long serialVersionUID = 1L;
	@Override
	protected void service(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException
	{
		String userName=req.getParameter("username");
		String password=req.getParameter("password");
		String role=req.getParameter("role");
		UserImpl userImplementation=new UserImpl();
		UserModel userTable=new UserModel();
		userTable.setUserName(userName);
		userTable.setPassword(password);
		userTable=userImplementation.getUser(userName);
			
		resp.setContentType("text/html");
		
		if(userName.equals(userTable.getUserName()) && password.equals(userTable.getPassword()))
		{
			PrintWriter out= resp.getWriter();
			out.print("Hello "+userTable.getName() + " !");
		}
		else if(count>0)
		{
			PrintWriter out= resp.getWriter();
			out.print("Remaining"+ count-- +" attempts left.");
			RequestDispatcher rd=req.getRequestDispatcher("LoginPage.html");
			rd.include(req, resp);
		}
		else
		{
			PrintWriter out=resp.getWriter();
			out.print("u r fucked !");
	}
	}
}
