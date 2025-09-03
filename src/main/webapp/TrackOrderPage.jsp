<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tomato.models.*, com.tomato.models.OrderModel, com.tomato.DAO.*, 
com.tomato.DAOImplementation.*, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles/HeaderAndFooterStyles.css">
<link rel="stylesheet" href="styles/TrackOrderStyles.css">
<meta charset="UTF-8">
<title>Order Details</title>
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
        
    <%
    }%>
    </div>
</div>
</header>
<div class="mainContainer">
<div class="track-order-container">
    
    <%
    int orderId = (Integer)request.getAttribute("orderId");
    
    OrderDAO orderImpl = new OrderImpl();
    OrderModel order = new OrderModel();
    order.setOrderId(orderId);
    order = orderImpl.getOrder(order); // Fetch the full order details

    // Prepare DAO instances outside the loop
    OrderItemDAO orderItemImpl = new OrderItemImpl();
    List<OrderItemModel> orderItems = orderItemImpl.getAllOrderItemByOrderId(orderId);
    MenuDAO menuImpl = new MenuImpl();
    %>

    <!-- The header section of the tracking card -->
    <div class="order-header">
        <div class="header-info">
            <h1 class="page-title">Order Details</h1>
            <p class="order-id">Order #<%= order.getOrderId() %></p>
        </div>
        <div class="header-status">
            <% 
            String statusClass = "status-" + order.getStatus().toLowerCase().replace(" ", "-");
            %>
            <span class="order-status <%= statusClass %>"><%= order.getStatus() %></span>
        </div>
    </div>

    <!-- The list of items in the order -->
    <div class="item-list">
        <h2 class="section-title">Items in Your Order</h2>
        <%
        for(OrderItemModel item : orderItems) {
            MenuModel menu = menuImpl.getMenu(item.getMenuId());
        %>
            <!-- Each item is a row in the list -->
            <div class="order-item">
                <div class="item-details">
                    <p class="item-name"><%= menu.getItemName() %></p>
                    <p class="item-quantity">Quantity: <%= item.getQuantity() %></p>
                </div>
                <div class="item-price">
                    <%-- Calculating total price for the item row --%>
                    <%= item.getTotalPrice() * item.getQuantity() %> Rupees
                </div>
            </div>
        <%
        } // End of for loop
        %>
    </div>

    <!-- The summary/footer section of the card -->
    <div class="order-summary">
        <div class="summary-line">
            <span class="summary-label">Subtotal</span>
            <span class="summary-value"><%= order.getTotalAmount() %> Rupees</span>
        </div>
        <div class="summary-line">
            <span class="summary-label">Delivery Fee</span>
            <span class="summary-value">FREE</span>
        </div>
        <div class="summary-line total">
            <span class="summary-label">Grand Total</span>
            <span class="summary-value"><%= order.getTotalAmount() %> Rupees</span>
        </div>
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