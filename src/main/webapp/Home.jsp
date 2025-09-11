<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List, com.tomato.models.RestaurantModel"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="styles/HomeStyles.css">
    <link rel="stylesheet" href="styles/HeaderAndFooterStyles.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<meta charset="UTF-8">
<title>tomatoApp</title>
</head>
<body>
<header>
<div class="navBar">
    <div class="navBarLogoContainer">
    <form action="Home">
    <button type="submit" class="navBarLogo">tomato</button></form> 
    </div>
    <%
    String userName=(String)request.getAttribute("userName");
    %>
    <div class="navBarButtons">
    
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
<div class="mainContainer">
    <h1 class="sectionTitle">Restaurants Near You</h1>
    <div class="restaurantGrid">
    
    <%
    List<RestaurantModel> restaurants=(List<RestaurantModel>)request.getAttribute("restaurants");
    for(RestaurantModel r : restaurants)
    {
    %>
        <a href="MenuServlet?restaurantId=<%=r.getRestaurantId()%>" style="text-decoration: none; color:inherit;">
            <img src="<%= r.getImagePath() %>" alt="A2B" class="restaurant-image">
            	<div class="restaurantInfo">
	                <h2 class="restaurantName"><%= r.getName() %></h2>
	                <p class="restaurant-cusine"><%= r.getCusineType() %></p>
	                <div class="restaurantMetaData">
	                    <span class="rating"> <i class="fas fa-star"></i> <%= r.getRating() %> </span>
	                    <span><%= r.getEta() %> mins</span>
	                    <span><%=r.getRestaurantId() %> for two</span>
	                </div>
            	</div>           
        </a>
        
    <%
    }
    %>
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