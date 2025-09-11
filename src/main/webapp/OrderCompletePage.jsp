<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="styles/HeaderAndFooterStyles.css">
        <link rel="stylesheet" href="styles/OrderCompletePageStyles.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<meta charset="UTF-8">
<title>Order Placed</title>
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
             <a href="OrderHistory.jsp"class="ordersButton" id="dropDownButtons"><i class="fa-solid fa-box-archive"></i> Orders</a>
             <a href="AddressServlet?redirectTo=manageAddress" class="manageAddressButton ordersButton" id="dropDownButtons"><i class="fa-solid fa-map-location-dot"></i> Manage Address</a>
             <a href="LogoutServlet" class="logoutButton ordersButton" id="dropDownButtons"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>      
        </div>
        </div>
    <%
    }%>
    </div>
</div>
</header>
<div class="confirmation-container-super">
<div class="confirmation-container">
    
    <div class="confirmation-icon">
        <!-- A simple checkmark icon made with CSS -->
        <div class="checkmark"></div>
    </div>

    <h1 class="confirmation-title">Thanks for Placing Your Order!</h1>
    <p class="confirmation-subtitle">Your order is being prepared. You can track its progress or continue shopping.</p>
    
    <%
    int orderId = (Integer)(request.getAttribute("orderId"));
    %>
    
    <!-- Wrapper for the action buttons -->
    <div class="action-buttons-container">
    
        <!-- "Continue Shopping" button (styled link) -->
        <form action="Home">
        <button class="btn btn-secondary" type="submit" value="" >Continue Shopping</button>
        </form>
    
        <!-- "Track Order" button (form submit) -->
        <form action="TrackOrderServlet" class="track-order-form">
            <input type="hidden" name="orderId" value="<%=orderId%>">
            <button type="submit" class="btn btn-primary">Track Order</button>
        </form>
        
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