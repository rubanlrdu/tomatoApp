<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*, com.tomato.models.*, java.util.Set, java.util.HashSet, java.util.ArrayList,
com.tomato.DAO.*,com.tomato.DAOImplementation.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles/EditMenuStyles.css">
<link rel="stylesheet" href="styles/HeaderAndFooterStyles.css">
<meta charset="UTF-8">
<title>Edit Menu</title>
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
        
    <%
    }%>
    </div>
</div>
</header>
<%
int menuId=Integer.parseInt(request.getParameter("menuId"));
int restaurantId=Integer.parseInt(request.getParameter("restaurantId"));
MenuDAO menuImpl=new MenuImpl();
MenuModel menu=menuImpl.getMenu(menuId);

%>
<!-- Secondary Header for sub-navigation -->
<header class="secondary-header">
    <nav class="sub-nav">
        <a href="ManageRestaurant.jsp?restaurantId=<%=restaurantId%>" class="sub-nav-link">Restaurant Details</a>
        <a href="ManageMenu.jsp?restaurantId=<%=restaurantId%>" class="sub-nav-link active">Manage Menu</a>
        <a href="ViewOrders.jsp?restaurantId=<%=restaurantId%>" class="sub-nav-link">View Orders</a>
    </nav>
</header>

<div class="mainContainer">
		
    <!-- Left column: Live preview of the menu item -->
    <div class="menu-preview-card">
        <h1 class="section-title">Live Preview</h1>
        <div class="menu-item-card">
            <img src="<%= menu.getImagePath() %>" alt="<%= menu.getItemName() %>" class="menu-image">
            <div class="menuInfo">
                <h2 class="itemName"><%= menu.getItemName() %></h2>
                <p class="itemDescription"><%= menu.getDescription() %></p>
                <div class="menuMetaData">
                    <span class="price"><%=menu.getPrice() %> Rupees</span>
                    <span class="rating"><i class="fas fa-star"></i> <%= menu.getRating() %></span>
                </div>
            </div>           
        </div>
    </div>
    
    <!-- Right column: The form to edit the menu item -->
    <div class="edit-form-card">
        <h1 class="section-title">Edit Menu Item</h1>
        <form action="MenuDbServlet" method="post">
            <!-- Hidden fields -->
            <input type="hidden" name="redirectTo" value="manageMenu">
            <input type="hidden" name="restaurantId" value="<%=menu.getRestaurantId()%>">
            <input type="hidden" name="menuId" value="<%=menuId%>">
            <input type="hidden" name="menuAction" value="update">
            
            <!-- Visible form fields -->
            <div class="form-group">
                <label for="itemName">Item Name</label>
                <input type="text" id="itemName" name="itemName" placeholder="<%= menu.getItemName() %>">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <input type="text" id="description" name="description" placeholder="<%= menu.getDescription() %>">
            </div>
            
            <div class="form-grid">
                <div class="form-group">
                    <label for="price">Price</label>
                    <input type="text" id="price" name="price" placeholder="<%= menu.getPrice() %>">
                </div>
                <div class="form-group">
                    <label for="rating">Rating</label>
                    <input type="text" id="rating" name="rating" placeholder="<%= menu.getRating() %>">
                </div>
            </div>

            <div class="form-group">
                <label for="imagePath">Image Path</label>
                <input type="text" id="imagePath" name="imagePath" placeholder="<%= menu.getImagePath() %>">
            </div>
            
            <div class="form-grid">
                <div class="form-group">
                    <label for="isAvailable">Availability</label>
                    <select id="isAvailable" name="isAvailable">
                        <option value="1" <%= menu.isAvailable() ? "selected" : "" %>>Available</option>
                        <option value="0" <%= !menu.isAvailable() ? "selected" : "" %>>Not Available</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="category">Category</label>
                    <select id="category" name="category">
                    <%
                        RestaurantDAO restaurantImpl = new RestaurantImpl();
                        String categories = restaurantImpl.getRestaurant(restaurantId).getMenuType();
                        StringTokenizer category = new StringTokenizer(categories, ",");
                        while(category.hasMoreTokens()) {
                            String currentCategory = category.nextToken();
                    %>
                        <option value="<%=currentCategory %>" <%= currentCategory.equals(menu.getCategory()) ? "selected" : "" %>>
                            <%=currentCategory %>
                        </option>
                    <%
                        }
                    %>
                    </select>
                </div>
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