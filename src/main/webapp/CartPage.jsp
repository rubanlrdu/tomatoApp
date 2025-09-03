<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tomato.models.*, com.tomato.DAOImplementation.*, java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Shopping Cart</title>
    <link rel="stylesheet" type="text/css" href="styles/CartPage.css">
    <link rel="stylesheet" type="text/css" href="styles/HeaderAndFooterStyles.css">
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
<div class="cart-container">
    <div class="cart-header">
        <h1>Your Shopping Cart</h1>
    </div>

    <%
    // Get the cart object from the session
    Cart cart = (Cart) session.getAttribute("Cart");
    float totalPrice = 0;

    // Check if the cart exists and is not empty
    if (cart != null && !cart.getAllItems().isEmpty()) {
    %>
        <div class="cart-items-list">
            <%
            // Loop through each item in the cart
            for (CartItemModel item : cart.getAllItems().values()) {
                float subtotal = item.getPrice() * item.getQuantity();
                totalPrice += subtotal;
            %>
            <div class="cart-item">
                <div class="item-details">
                    <h2 class="item-name"><%= item.getName() %></h2>
                    <p class="item-price"> <%=item.getPrice()%> each</p>
                </div>

                <div class="item-controls">
                    <div class="quantity-control">
                        <%-- Minus Button Form --%>
                        <form action="cartServlet" method="post" style="margin:0;">
                            <input type="hidden" name="menuId" value="<%= item.getId() %>">
                            <input type="hidden" name="restaurantId" value="<%=item.getRestuarantId()%>">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="quantity" value="<%= item.getQuantity() - 1 %>">
                            <button type="submit" class="quantity-btn">-</button>
                        </form>

                        <%-- Quantity Display --%>
                        <span class="quantity-display"><%= item.getQuantity() %></span>

                        <%-- Plus Button Form --%>
                        <form action="cartServlet" method="post" style="margin:0;">
                            <input type="hidden" name="menuId" value="<%= item.getId() %>">
                            <input type="hidden" name="restaurantId" value="<%=item.getRestuarantId()%>">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="quantity" value="<%= item.getQuantity() + 1 %>">
                            <button type="submit" class="quantity-btn">+</button>
                        </form>
                    </div>

                    <p class="item-subtotal">$<%= String.format("%.2f", subtotal) %></p>
                </div>
            </div>
            <%
            session.setAttribute("quantity",item.getQuantity());
            } 
            session.setAttribute("totalPrice",totalPrice);
            
            %>
        </div>

        <%-- Cart Summary Section --%>
        <div class="cart-summary">
            <div class="total-price">
                <span>Total:</span> $<%= String.format("%.2f", totalPrice) %>
            </div>
            <form action="CheckoutPage.jsp"> 
                <button type="submit" class="checkout-btn">Proceed to Checkout</button>
            </form>
        </div>

    <%
    } else {
        // This block is shown if the cart is empty or null
    %>
        <div class="empty-cart-message">
            <h2>Your cart is empty.</h2>
            <p>Looks like you haven't added anything to your cart yet.</p>
            <a href="Home">Continue Shopping</a>
        </div>
    <%
    } // End of if-else block
    %>
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