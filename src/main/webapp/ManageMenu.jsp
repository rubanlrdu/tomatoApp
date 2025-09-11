<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*, com.tomato.models.*, java.util.Set, java.util.HashSet, java.util.ArrayList,
com.tomato.DAO.*,com.tomato.DAOImplementation.*"%>
<!DOCTYPE html>
<html>
<head>

    <link rel="stylesheet" href="styles/ManageMenuStyles.css">
    <link rel="stylesheet" href="styles/HeaderAndFooterStyles.css">
<meta charset="UTF-8">
<title>Manage Menu</title>
</head>
<body>
<%
int restaurantId=Integer.parseInt(request.getParameter("restaurantId"));
MenuDAO menuImplementation=new MenuImpl();
List<MenuModel> menus=menuImplementation.getAllRestaurantMenu(restaurantId);
RestaurantDAO restaurantImpl=new RestaurantImpl();
String categories=restaurantImpl.getRestaurant(restaurantId).getMenuType();
StringTokenizer category=new StringTokenizer(categories,",");
StringTokenizer category2=new StringTokenizer(categories,",");
RestaurantModel restaurant=restaurantImpl.getRestaurant((Integer.parseInt(request.getParameter("restaurantId"))));
%>

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
<header class="secondary-header">
    <nav class="sub-nav">
        <a href="ManageRestaurant.jsp?restaurantId=<%=restaurantId%>" class="sub-nav-link">Restaurant Details</a>
        <a href="ManageMenu.jsp?restaurantId=<%=restaurantId%>" class="sub-nav-link active">Manage Menu</a>
    </nav>
</header>

<div class="mainContainer">
	
    <!-- Left column: Add New Menu Item Form -->
    <div class="form-card">
        <h1 class="section-title">Add New Menu Item</h1>
        <form action="MenuDbServlet" method="post">
            <input type="hidden" value="<%=restaurantId%>" name="restaurantId">
            <input type="hidden" value="manageMenu" name="redirectTo">
            <input type="hidden" name="menuAction" value="create">
            
            <div class="form-group">
                <label for="itemName">Item Name</label>
                <input type="text" id="itemName" name="itemName">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <input type="text" id="description" name="description">
            </div>
            
            <div class="form-grid">
                <div class="form-group">
                    <label for="price">Price</label>
                    <input type="text" id="price" name="price">
                </div>
                <div class="form-group">
                    <label for="rating">Rating</label>
                    <input type="text" id="rating" name="rating">
                </div>
            </div>

            <div class="form-group">
                <label for="imagePath">Image Path</label>
                <input type="text" id="imagePath" name="imagePath">
            </div>
            
            <div class="form-grid">
                <div class="form-group">
                    <label for="isAvailable">Availability</label>
                    <select id="isAvailable" name="isAvailable">
                        <option value="1">Available</option>
                        <option value="0">Not Available</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="category">Category</label>
                    <select id="category" name="category">
                    <%
                    while(category2.hasMoreTokens()) {
                        String currentCategory2 = category2.nextToken();
                    %>
                        <option value="<%=currentCategory2 %>"><%=currentCategory2 %></option>
                    <%
                    }
                    %>
                    </select>
                </div>
            </div>
            
            <button type="submit" class="btn btn-primary">Add Item</button>
        </form>
    </div>

    <!-- Right column: List of existing menu items -->
    <div class="menu-list-container">
        <h1 class="section-title">Existing Menu Items</h1>
        <%
        while(category.hasMoreTokens()) {
            String currentCategory = category.nextToken();
            MenuDAO menuImpl = new MenuImpl();
            List<MenuModel> menusByCategory = menuImpl.getMenyByCategory(restaurantId, currentCategory);
            
            if (!menusByCategory.isEmpty()) {
        %>
                <h2 class="category-title"><%=currentCategory%></h2>
                <div class="menuGrid">
                    <%
                    for(MenuModel menu : menusByCategory) {
                    %>
                        <div class="menu-item-card">
                            <img src="<%= menu.getImagePath() %>" alt="<%= menu.getItemName() %>" class="menu-image">
                            <div class="menuInfo">
                                <h3 class="itemName"><%= menu.getItemName() %></h3>
                                <p class="itemDescription"><%= menu.getDescription() %></p>
                                <div class="menuMetaData">
                                    <span class="price"><%=menu.getPrice() %> Rupees</span>
                                    <span class="rating"><i class="fas fa-star"></i> <%= menu.getRating() %></span>
                                </div>
                                <form action="EditMenu.jsp" method="get">
                                    <input type="hidden" name="menuId" value="<%=menu.getMenuId()%>">
                                    <input type="hidden" name="restaurantId" value="<%=menu.getRestaurantId()%>">
                                    <button class="btn btn-secondary" type="submit">Edit Menu</button>
                                </form>
                                 <form action="MenuDbServlet" method="post">
                                    <input type="hidden" name="menuId" value="<%=menu.getMenuId()%>">
                                    <input type="hidden" name="restaurantId" value="<%=menu.getRestaurantId()%>">
                                    <input type="hidden" name="menuAction" value="delete">
                                    <input type="hidden" name="redirectTo" value="manageMenu">
                                    <button class="btn btn-secondary" type="submit">Delete</button>
                                </form>
                            </div>           
                        </div>
                    <%
                    } // End inner loop
                    %>
                </div>
        <%
            } // End if
        } // End outer loop
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