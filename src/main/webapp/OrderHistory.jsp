<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.tomato.models.OrderModel, com.tomato.DAO.OrderDAO, com.tomato.DAOImplementation.OrderImpl,
java.util.List, com.tomato.DAO.RestaurantDAO, com.tomato.DAOImplementation.RestaurantImpl, com.tomato.models.RestaurantModel" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="styles/HeaderAndFooterStyles.css">
    <link rel="stylesheet" href="styles/OrderHistoryStyles.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<meta charset="UTF-8">
<title>Order History</title>

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
<div class="order-history-container">
    <h1 class="page-title">My Orders</h1>

    <%
    int userId = (Integer)session.getAttribute("userId");
    OrderModel order = new OrderModel();
    order.setUserId(userId);
    OrderDAO orderImpl = new OrderImpl();
    List<OrderModel> list = orderImpl.getOrderByUser(order);
    RestaurantDAO restaurantImpl = new RestaurantImpl(); // Instantiated once outside the loop
    %>

    <div class="order-list">
        <%
        if (list.isEmpty()) {
        %>
            <p class="no-orders-message">You haven't placed any orders yet.</p>
        <%
        } else {
            for(OrderModel o : list) {
                // Generate a clean CSS class name from the status (e.g., "Out for Delivery" -> "status-out-for-delivery")
                String statusClass = "status-" + o.getStatus().toLowerCase().replace(" ", "-");
        %>
                <!-- Each order is a clickable card -->
                <a href="TrackOrderServlet?orderId=<%=o.getOrderId() %>" class="order-card">
                    
                    <div class="order-card-header">
                        <h2 class="restaurant-name"><%= restaurantImpl.getRestaurant(o.getRestaurantId()).getName() %></h2>
                        <span class="total-price"><i class="fa-solid fa-indian-rupee-sign"></i> <%=o.getTotalAmount() %></span>
                    </div>

                    <div class="order-card-body">
                        <p class="order-detail"><strong>Order ID:</strong> #<%=o.getOrderId() %></p>
                        <p class="order-detail"><strong>Delivered To:</strong> <%=o.getAddress() %></p>
                    </div>

                    <div class="order-card-footer">
                        <span class="order-status <%= statusClass %>"><%=o.getStatus() %></span>
                    </div>
                    
                </a>
        <%
            } // End of for loop
        } // End of else
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