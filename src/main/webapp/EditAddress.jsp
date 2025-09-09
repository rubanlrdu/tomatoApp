<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tomato.models.AddressModel, com.tomato.DAO.AddressDAO, com.tomato.DAOImplementation.AddressImpl"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles/HeaderAndFooterStyles.css">
<link rel="stylesheet" href="styles/EditAddressStyles.css">
<meta charset="UTF-8">
<title>Edit Address</title>
</head>
<body>
<header>
<div class="navBar">
    <div class="navBarLogoContainer">
    <form action="Home">
    <button type="submit" class="navBarLogo">tomato</button></form> 
    </div>
    <div class="navBarButtons">
        <%
    String userName=(String)session.getAttribute("userName");
    %>
    <%
    if(userName==null){
    %>
        <div class="loginButtonContainer"><a class="loginButton" href="LoginPage.jsp">login</a></div>
        <div class="signupButtonContainer"><a class="signupButton" href="RegisterPage.jsp">signup</a></div>
        <%} %>
        <div class="cartButtonContainer"><a href="CartPage.jsp" class="cartButton"><i class="fa-solid fa-cart-shopping"></i> Cart</a></div>
    <% 
    if (userName!=null)
    {
    	%>
    	<div class="dropdown-container">
        <button class="userNameToggle" id="navBarButtons">Hello,<br><%=userName %></button>
        <div class="profileMenu">
             <a href="OrderHistory.jsp"class="ordersButton" id="dropDownButtons">Orders</a>
        </div>
        </div>
            <div class="cartButtonContainer"><a href="LogoutServlet" class="cartButton">Logout</a></div>
    <%
    }%>
    </div>
</div>
</header>

<%
	AddressDAO addressImpl=new AddressImpl();
  	int addressId=Integer.parseInt(request.getParameter("addressId"));
 	AddressModel address=addressImpl.getAddress(addressId);
%>
<div class="edit-page-container">
    
    <!-- Left side: Displaying the current address -->
    <div class="current-address-card">
        <h1 class="section-title">Current Address</h1>
        <div class="address-details">
            <p><span class="label">Name:</span> <%= address.getAddressLine1() %></p>
            <p><span class="label">Address:</span> <%= address.getAddressLine2() %></p>
            <p><span class="label">Landmark:</span> <%= address.getLandmark() %></p>
            <p><span class="label">City:</span> <%= address.getCity() %></p>
            <p><span class="label">State:</span> <%= address.getState() %></p>
            <p><span class="label">Pin Code:</span> <%= address.getPostalCode() %></p>
            <p><span class="label">Address Type:</span> <%= address.getAddressType() %></p>
        </div>
    </div>

    <!-- Right side: The form to edit the address -->
    <div class="edit-form-card">
        <h1 class="section-title">Update Details</h1>
        <form action="AddressServlet" method="post">
            <input type="hidden" name="addressId" value="<%= address.getAddressID() %>">
            <input type="hidden" name="userId" value="<%= address.getUserId() %>">
            <input type="hidden" name="redirectTo" value="editAddress">
            <input type="hidden" name="action" value="update">
            
            <div class="form-group">
                <label for="addressLine1">Name / Contact Person</label>
                <input type="text" id="addressLine1" name="addressLine1" value="<%= address.getAddressLine1() %>">
            </div>
            
            <div class="form-group">
                <label for="addressLine2">Address (House No, Street, Area)</label>
                <input type="text" id="addressLine2" name="addressLine2" value="<%= address.getAddressLine2() %>">
            </div>
            
            <div class="form-group">
                <label for="landmark">Landmark</label>
                <input type="text" id="landmark" name="landmark" value="<%= address.getLandmark() %>">
            </div>
            
            <div class="form-grid">
                <div class="form-group">
                    <label for="city">City</label>
                    <input type="text" id="city" name="city" value="<%= address.getCity() %>">
                </div>
                <div class="form-group">
                    <label for="state">State</label>
                    <input type="text" id="state" name="state" value="<%= address.getState() %>">
                </div>
            </div>
            
            <div class="form-group">
                <label for="postalCode">Pin Code</label>
                <input type="text" id="postalCode" name="postalCode" value="<%= address.getPostalCode() %>">
            </div>
            
            <div class="form-group">
                <label for="addressType">Address Type</label>
                <select id="addressType" name="addressType">
                    <option value="Home" <%= (address.getAddressType().equals("Home")) ? "selected" : "" %>> Home </option>
                    <option value="Work" <%= (address.getAddressType().equals("Work")) ? "selected" : "" %>> Work </option>
                    <option value="Other" <%= (address.getAddressType().equals("Other")) ? "selected" : "" %>> Other </option>
                </select>
            </div>
            
            <button type="submit" class="btn btn-primary">Update Address</button>
        </form>
    </div>
</div>
<footer>
	<div class="companyContainer">
	    <h1>Company</h1>
	    <p>About us</p>
	    <p>Team</p>
	    <p>Careers</p>
	    <p>Blog</p>
	</div>
	<div class="socialContainer">
	    <h1>Social</h1>
	    <p>Facebook</p>
	    <p>Twitter</p>
	    <p>Mastadon</p>
	    <p>Reddit</p>
	</div>
	<div class="legalContainer">
	    <h1>Legal</h1>
	    <p>Privacy and Policy</p>
	    <p>Terms and Conditions</p>
	    <p>Data Safety</p>
	    <p>Cookie Policy</p>
	</div>
</footer>
</body>
</html>