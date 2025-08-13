<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tomato.models.*, com.tomato.DAOImplementation.*, java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Shopping Cart</title>
    <link rel="stylesheet" type="text/css" href="styles/CartPage.css">
</head>
<body>

<div class="cart-container">
    <div class="cart-header">
        <h1>Your Shopping Cart</h1>
    </div>

    <%
    // Get the cart object from the session
    Cart cart = (Cart) session.getAttribute("Cart");
    double totalPrice = 0.0;

    // Check if the cart exists and is not empty
    if (cart != null && !cart.getAllItems().isEmpty()) {
    %>
        <div class="cart-items-list">
            <%
            // Loop through each item in the cart
            for (CartItemModel item : cart.getAllItems().values()) {
                double subtotal = item.getPrice() * item.getQuantity();
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
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="quantity" value="<%= item.getQuantity() - 1 %>">
                            <button type="submit" class="quantity-btn">-</button>
                        </form>

                        <%-- Quantity Display --%>
                        <span class="quantity-display"><%= item.getQuantity() %></span>

                        <%-- Plus Button Form --%>
                        <form action="cartServlet" method="post" style="margin:0;">
                            <input type="hidden" name="menuId" value="<%= item.getId() %>">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="quantity" value="<%= item.getQuantity() + 1 %>">
                            <button type="submit" class="quantity-btn">+</button>
                        </form>
                    </div>

                    <p class="item-subtotal">$<%= String.format("%.2f", subtotal) %></p>
                </div>
            </div>
            <%
            } // End of for loop
            %>
        </div>

        <%-- Cart Summary Section --%>
        <div class="cart-summary">
            <div class="total-price">
                <span>Total:</span> $<%= String.format("%.2f", totalPrice) %>
            </div>
            <form action="checkoutServlet" method="get"> 
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

</body>
</html>