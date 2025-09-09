<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*, com.tomato.models.*, java.util.Set, java.util.HashSet, java.util.ArrayList,
com.tomato.DAO.*,com.tomato.DAOImplementation.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles/MenuStyles.css">
<meta charset="UTF-8">
<title>Edit Menu</title>
</head>
<body>
<%
int menuId=Integer.parseInt(request.getParameter("menuId"));
int restaurantId=Integer.parseInt(request.getParameter("restaurantId"));
MenuDAO menuImpl=new MenuImpl();
MenuModel menu=menuImpl.getMenu(menuId);

%>
<div class="secondaryHeader">
<a href="ManageRestaurant.jsp?restaurantId=<%=menu.getRestaurantId()%>">Restaurant</a>
<a href="ManageMenu.jsp?restaurantId=<%=menu.getRestaurantId() %>">Menu</a>

</div>
<div class="mainContainer">
		<div class="menu-item-card">
        <a href="#" style="text-decoration: none; color:inherit;">
            <img src="<%= menu.getImagePath() %>" alt="A2B" class="menu-image">
            	<div class="menuInfo">
	                <h2 class="itemName"><%= menu.getItemName() %></h2>
	                <p class="itemDescription"><%= menu.getDescription() %></p>
	                <div class="menuMetaData">
	                    <span class="rating"> <i class="fas fa-star"></i> <%= menu.getRating() %> </span>
	                    <span><%=menu.getPrice() %> Rupees</span>
	                    <span><%=menu.getRating() %> for two</span>
	                 
	                </div>
            	</div>           
        </a>
		</div>
		<div class="updateMenuContainer" id="updateMenu">
        
        <h1>Edit Menu</h1>
        <form action="MenuDbServlet" method="post">
			<input type="hidden" name="redirectTo" value="editMenu">
			<input type="hidden" name="restaurantId" value="<%=menu.getRestaurantId()%>">
			<input type="hidden" name="menuId" value="<%=menuId%>">
        	<input type="hidden" name="menuAction" value="update">
			
            <label for="itemName">Item Name</label>
        	<input type="text" name="itemName"><br>
        	<label for="description">Description</label>
        	<input type="text" name="description"><br>
        	<label for="price">Price</label>
        	<input type="text" name="price"><br>
        	<label for="rating">Rating</label>
        	<input type="text" name="rating"><br>

        	<label for="isAvailable">Availability</label>
	        <select name="isAvailable">
	        <option value="1"> Active</option>
	        <option value="0"> Not Active</option>
	        </select><br>
        	<label for="imagePath">ImagePath</label>
        	<input type="text" name="imagePath"><br>
        	<label for="category">Choose Category</label>
        	<select name="category">
        	<option value="" selected>Choose Category</option>
        	<%
        	RestaurantDAO restaurantImpl=new RestaurantImpl();
        	String categories=restaurantImpl.getRestaurant(restaurantId).getMenuType();
        	StringTokenizer category=new StringTokenizer(categories,",");
        	while(category.hasMoreTokens())
        	{
        		String currentCategory2=category.nextToken();
        	%>
        	<option value="<%=currentCategory2 %>"> <%=currentCategory2 %></option>
        	<%
        	}%>
        	</select><br>
        	<input type="submit" value="Submit">
        </form>

    </div>
</div>
</body>
</html>