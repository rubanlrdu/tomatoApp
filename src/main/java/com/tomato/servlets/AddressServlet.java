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

import com.tomato.DAO.AddressDAO;
import com.tomato.DAOImplementation.AddressImpl;
import com.tomato.models.AddressModel;

/**
 * Servlet implementation class AddressServlet
 */
@WebServlet("/AddressServlet")
public class AddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AddressDAO addressImpl=new AddressImpl();
		HttpSession session=request.getSession();
		int userId=(Integer)session.getAttribute("userId");
		String redirectTo=request.getParameter("redirectTo");
		List<AddressModel> addresses=addressImpl.getAllAddressByUser(userId);
		request.setAttribute("addresses", addresses);
		if(redirectTo.equalsIgnoreCase("manageAddress"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("ManageAddress.jsp");
			rd.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("create"))
		{
			createAddress(request,response);
		}
		else if(action.equalsIgnoreCase("update"))
		{
			updateAddress(request,response);
		}
		else if(action.equalsIgnoreCase("delete"))
		{
			deleteAddress(request,response);
		}
	}
	

	public void createAddress(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		HttpSession session=request.getSession();
		int userId=(Integer)session.getAttribute("userId");
		String addressLine1=request.getParameter("addressLine1");
		String addressLine2=request.getParameter("addressLine2");
		String landmark=request.getParameter("landmark");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String postalCode=request.getParameter("postalCode");
		String addressType=request.getParameter("addressType");
		Boolean isDefaultAddress=true;
		
		AddressModel addressTable=new AddressModel(userId,addressLine1,addressLine2,landmark,city,state,postalCode,addressType,isDefaultAddress);
		AddressDAO addressImpl=new AddressImpl();
		addressImpl.setAddress(addressTable);
		
		String redirectTo=request.getParameter("redirectTo");
	 	if(redirectTo.equalsIgnoreCase("manageAddress"))
	 	{
			response.sendRedirect(request.getContextPath()+"/AddressServlet?redirectTo=manageAddress");
	 	}

	}
	public void updateAddress(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		int addressId=Integer.parseInt(request.getParameter("addressId"));
		AddressDAO addressImpl=new AddressImpl();
	 	AddressModel existingAddress=addressImpl.getAddress(addressId);
	 	
	 	String redirectTo=request.getParameter("redirectTo");
		
	 	int userId=Integer.parseInt(request.getParameter("userId"));
		String addressLine1="";
		String addressLine2="";
		String landmark="";
		String city="";
		String state="";
		String postalCode="";
		String addressType="";
		Boolean isDefault=true;
		
		if(!request.getParameter("addressLine1").isBlank())
		{
			addressLine1=request.getParameter("addressLine1");
		}
		else {
			addressLine1=existingAddress.getAddressLine1();
		}
		
		if(!request.getParameter("addressLine2").isBlank())
		{
			addressLine2=request.getParameter("addressLine2");
		}
		else
		{
			addressLine2=existingAddress.getAddressLine2();
		}
		
		if(!request.getParameter("landmark").isBlank())
		{
			landmark=request.getParameter("landmark");
		}
		else
		{
			landmark=existingAddress.getLandmark();
		}
		
		if(!request.getParameter("city").isBlank())
		{
			city=request.getParameter("city");
		}
		else
		{
			city=existingAddress.getCity();
		}
		
		if(!request.getParameter("state").isBlank())
		{
			state=request.getParameter("state");
		}
		else
		{
			state=existingAddress.getState();
		}
		
		if(!request.getParameter("postalCode").isBlank())
		{
			postalCode=request.getParameter("postalCode");
		}
		else
		{
			postalCode=existingAddress.getPostalCode();
		}
		
		if(!request.getParameter("addressType").isBlank())
		{
			addressType=request.getParameter("addressType");
		}
		else
		{
			addressType=existingAddress.getAddressType();
		}
		
	 	AddressModel address=new AddressModel(addressId,userId,addressLine1,addressLine2,landmark,city,state,postalCode,addressType,isDefault);
	 	addressImpl.updateAddress(address);
	 	if(redirectTo.equalsIgnoreCase("editAddress"))
	 	{
			RequestDispatcher rd=request.getRequestDispatcher("EditAddress.jsp");
			rd.forward(request, response);
	 	}
	}
	private void deleteAddress(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		int addressId=Integer.parseInt(request.getParameter("addressId"));
		AddressDAO addressImpl=new AddressImpl();
		addressImpl.deleteAddress(addressId);
		String redirectTo=request.getParameter("redirectTo");
	 	if(redirectTo.equalsIgnoreCase("manageAddress"))
	 	{
			response.sendRedirect(request.getContextPath()+"/AddressServlet?redirectTo=manageAddress");
	 	}
		
	}

}
