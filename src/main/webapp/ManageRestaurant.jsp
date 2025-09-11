<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tomato.models.RestaurantModel, com.tomato.DAOImplementation.RestaurantImpl, com.tomato.DAO.RestaurantDAO" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles/HeaderAndFooterStyles.css">
<link rel="stylesheet" href="styles/ManageRestaurantStyles.css">
<meta charset="UTF-8">
<title>Manage Restaurant</title>
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
int restaurantId=(Integer)(session.getAttribute("restaurantId"));
RestaurantDAO restaurantImpl=new RestaurantImpl();
RestaurantModel r=restaurantImpl.getRestaurant(restaurantId);

%>
<header class="secondary-header">
    <nav class="sub-nav">
        <a href="ManageRestaurant.jsp?restaurantId=<%=restaurantId%>" class="sub-nav-link active">Restaurant Details</a>
        <a href="ManageMenu.jsp?restaurantId=<%=restaurantId%>" class="sub-nav-link">Manage Menu</a>
    </nav>
</header>

<div class="mainContainer">
    
    <!-- Left column: Restaurant Preview -->
    <div class="restaurant-preview-card">
        <h1 class="section-title">Live Preview</h1>
        <!-- Reusing restaurant card structure -->
        <div class="restaurant-card">
            <img src="<%= r.getImagePath() %>" alt="<%= r.getName() %>" class="restaurant-image">
            <div class="restaurantInfo">
                <h2 class="restaurantName"><%= r.getName() %></h2>
                <p class="restaurant-cuisine"><%= r.getCusineType() %></p>
                <div class="restaurantMetaData">
                    <span class="rating"><i class="fas fa-star"></i> <%= r.getRating() %></span>
                    <span><%= r.getEta() %> mins</span>
                </div>
            </div>           
        </div>
    </div>

    <!-- Right column: Update Form -->
    <div class="update-form-card">
        <h1 class="section-title">Update Restaurant Details</h1>
        <p class="form-subtitle">Only fill in the fields you want to change.</p>
        
        <form action="RestaurantDbServlet" method="post">
            <!-- Hidden fields -->
            <input type="hidden" value="<%= r.getRestaurantId() %>" name="restaurantIdentifier">
            <input type="hidden" value="<%= r.getAdminUserId() %>" name="adminUserId">
            <input type="hidden" value="<%= r.getRestaurantUniqueIdentifier() %>" name="restaurantUniqueIdentifier">
            <input type="hidden" name="redirectTo" value="ManageRestaurant">
            <input type="hidden" name="restaurantAction" value="update">

            <!-- Form fields -->
            <div class="form-grid">
                <div class="form-group">
                    <label for="restaurantName">Name</label>
                    <input type="text" id="restaurantName" name="restaurantName" placeholder="<%= r.getName() %>">
                </div>
                <div class="form-group">
                    <label for="restaurantPhone">Phone</label>
                    <input type="text" id="restaurantPhone" name="restaurantPhone" placeholder="<%= r.getPhone() %>">
                </div>
            </div>

            <div class="form-group">
                <label for="restaurantAddress">Address</label>
                <input type="text" id="restaurantAddress" name="restaurantAddress" placeholder="<%= r.getAddress() %>">
            </div>

            <div class="form-grid">
                <div class="form-group">
                    <label for="restaurantCusineType">Cuisine Type</label>
                    <input type="text" id="restaurantCusineType" name="restaurantCusineType" placeholder="<%= r.getCusineType() %>">
                </div>
                 <div class="form-group">
                    <label for="menuType">Menu Categories (comma-separated)</label>
                    <input type="text" id="menuType" name="menuType" placeholder="<%= r.getMenuType() %>">
                </div>
            </div>

            <div class="form-grid">
                <div class="form-group">
                    <label for="restaurantRating">Rating</label>
                    <input type="text" id="restaurantRating" name="restaurantRating" placeholder="<%= r.getRating() %>">
                </div>
                <div class="form-group">
                    <label for="restaurantEta">ETA (in minutes)</label>
                    <input type="text" id="restaurantEta" name="restaurantEta" placeholder="<%= r.getEta() %>">
                </div>
            </div>

            <div class="form-group">
                <label for="restaurantImagePath">Image Path</label>
                <input type="text" id="restaurantImagePath" name="restaurantImagePath" placeholder="<%= r.getImagePath() %>">
            </div>
            
            <div class="form-group">
                <label for="isAvailable">Availability</label>
                <select id="isAvailable" name="isAvailable">
                    <option value="1" <%= r.isActive() ? "selected" : "" %>>Active (Open for orders)</option>
                    <option value="0" <%= !r.isActive() ? "selected" : "" %>>Inactive (Closed)</option>
                </select>
            </div>
            
            <button type="submit" class="btn btn-primary">Save Changes</button>
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