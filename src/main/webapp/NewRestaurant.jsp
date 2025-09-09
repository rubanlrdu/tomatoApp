<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Restaurant</title>
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

        </div>
            <div class="cartButtonContainer"><a href="LogoutServlet" class="cartButton">Logout</a></div>
    <%
    }%>
    </div>
</div>
</header>

<%
int adminId=(Integer)session.getAttribute("userId");
%>
    <div class="page-container">
    
    <!-- A notice banner at the top -->
    <div class="notice-banner">
        <h1>Welcome! Please add your restaurant details to continue.</h1>
    </div>

    <!-- The main card for the form -->
    <div class="form-card">
        <h1 class="section-title">Add Restaurant</h1>
        <form action="RestaurantDbServlet" method="post">
            
            <!-- Hidden Fields -->
            <input type="hidden" name="adminUserId" value="<%=adminId%>">
            <input type="hidden" name="redirectTo" value="ManageRestaurant">
            <input type="hidden" name="restaurantAction" value="create">

            <!-- Visible Form Fields -->
            <div class="form-group">
                <label for="restaurantIdentifier">Unique Identifier (e.g., 'tomatocafe-pune')</label>
                <input type="text" id="restaurantIdentifier" name="restaurantIdentifier">
            </div>

            <div class="form-group">
                <label for="restaurantName">Restaurant Name</label>
                <input type="text" id="restaurantName" name="restaurantName">
            </div>

            <div class="form-group">
                <label for="restaurantAddress">Address</label>
                <input type="text" id="restaurantAddress" name="restaurantAddress">
            </div>
            
            <div class="form-grid">
                <div class="form-group">
                    <label for="restaurantPhone">Phone</label>
                    <input type="text" id="restaurantPhone" name="restaurantPhone">
                </div>
                <div class="form-group">
                    <label for="restaurantRating">Initial Rating (1-5)</label>
                    <input type="number" id="restaurantRating" name="restaurantRating" min="1" max="5">
                </div>
            </div>

            <div class="form-grid">
                <div class="form-group">
                    <label for="restaurantCusineType">Cuisine Type (e.g., 'Italian, Fast Food')</label>
                    <input type="text" id="restaurantCusineType" name="restaurantCusineType">
                </div>
                <div class="form-group">
                    <label for="restaurantEta">ETA (in minutes)</label>
                    <input type="text" id="restaurantEta" name="restaurantEta">
                </div>
            </div>

            <div class="form-group">
                <label for="restaurantImagePath">Image Path (URL)</label>
                <input type="text" id="restaurantImagePath" name="restaurantImagePath">
            </div>

            <div class="form-group">
                <label for="menuType">Menu Categories (comma-separated, e.g., 'Starters,Main Course,Desserts')</label>
                <input type="text" id="menuType" name="menuType">
            </div>
            
            <button type="submit" class="btn btn-primary">Add Restaurant</button>
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