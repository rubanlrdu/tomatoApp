<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tomato.models.AddressModel, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles/HeaderAndFooterStyles.css">
<link rel="stylesheet" href="styles/ManageAddressStyles.css">
<meta charset="UTF-8">
<title>Manage Saved Address</title>
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
List<AddressModel> addresses=(List<AddressModel>)request.getAttribute("addresses");
%>
<div class="mainContainer">
    
    <!-- Section for the "Add New Address" form -->
    <div class="form-section newAddressContainer">
        <form action="AddressServlet" method="post">
            <h1 class="section-title">Add a New Address</h1>
            <input type="hidden" name="redirectTo" value="manageAddress">
            <input type="hidden" name="action" value="create">
            
            <div class="form-group">
                <label for="addressLine1">Name / Contact Person</label>
                <textarea id="addressLine1" name="addressLine1"></textarea>
            </div>

            <div class="form-group">
                <label for="addressLine2">Address (House No, Street, Area)</label>
                <textarea id="addressLine2" name="addressLine2"></textarea>
            </div>

            <div class="form-group">
                <label for="landmark">Landmark</label>
                <textarea id="landmark" name="landmark"></textarea>
            </div>
            
            <div class="form-grid">
                <div class="form-group">
                    <label for="city">City</label>
                    <textarea id="city" name="city"></textarea>
                </div>
                <div class="form-group">
                    <label for="state">State</label>
                    <textarea id="state" name="state"></textarea>
                </div>
            </div>

            <div class="form-group">
                <label for="postalCode">Postal Code</label>
                <textarea id="postalCode" name="postalCode"></textarea>
            </div>
            
            <div class="form-group">
                <label for="addressType">Address Type</label>
                <select id="addressType" name="addressType">
                    <option value="Home">Home</option>
                    <option value="Work">Work</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Save Address</button>
        </form>
    </div>

    <!-- Section for displaying existing addresses -->
    <div class="form-section">
        <h1 class="section-title">Your Saved Addresses</h1>
        <div class="addressGrid">
        <%
        // Assuming 'addresses' is a List<AddressModel> set as a request attribute
        // List<AddressModel> addresses = (List<AddressModel>) request.getAttribute("addresses");
        for(AddressModel address : addresses) {
        %>
            <!-- A single card for each address -->
            <div class="address-card">
                <span class="address-card-type"><%= address.getAddressType() %></span>
                
                <!-- Wrapper for the address details -->
                <div class="address-details">
                    <p><strong>Contact:</strong> <%= address.getAddressLine1() %></p>
                    <p><%= address.getAddressLine2() %></p>
                    <p><%= address.getLandmark() %></p>
                    <p><%= address.getCity() %>, <%= address.getState() %> - <%= address.getPostalCode() %></p>
                </div>

                <!-- Wrapper for the action buttons -->
                <div class="address-actions">
                    <form action="EditAddress.jsp" method="get">
                        <input type="hidden" name="addressId" value="<%= address.getAddressID() %>">
                        <button type="submit" class="btn btn-secondary">Edit</button>
                    </form>
                    <form action="AddressServlet" method="post">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="addressId" value="<%= address.getAddressID() %>">
                        <input type="hidden" name="redirectTo" value="manageAddress">
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                </div>
            </div>
        <%
        } // End of for loop
        %>
        </div>
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