package com.tomato.servlets;
import com.tomato.DAOImplementation.UserImpl;
import com.tomato.models.UserModel;
import com.tomato.DAO.UserDAO;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse Resp) {

		String name=req.getParameter("name");
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String address=req.getParameter("address");
		String role=req.getParameter("role");
		
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

}
