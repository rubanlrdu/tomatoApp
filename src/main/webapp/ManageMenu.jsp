<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*, com.tomato.models.*, java.util.Set, java.util.HashSet, java.util.ArrayList,
com.tomato.DAO.*,com.tomato.DAOImplementation.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles/MenuStyles.css">
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
<div class="secondaryHeader">
<a href="ManageRestaurant.jsp?restaurantId=<%=restaurantId%>">Restaurant</a>
<a href="ManageMenu.jsp?restaurantId=<%=restaurantId%>">Menu</a>

</div>
<div class="mainContainer">
	
    <div class="addNewMenuContainer">
    <div class="createMenuContainer" id="createMenu">
    <h1>Create Menu</h1>
    <form action="MenuDbServlet" method="post">
       		<input type="hidden" value="<%=restaurantId%>" name="restaurantId">
       		<input type="hidden" value="manageMenu" name="redirectTo">
            <label for="itemName">Item Name</label>
        	<input type="text" name="itemName"><br>
        	<label for="description">Description</label>
        	<input type="text" name="description"><br>
        	<label for="price">Price</label>
        	<input type="text" name="price"><br>
        	<label for="rating">rating</label>
        	<input type="text" name="rating"><br>
       		<label for="isAvailable">Is Available</label>
	        <select name="isAvailable">
	        <option value="1"> Available</option>
	        <option value="0"> Not Available</option>
	        </select>
        	<label for="imagePath">ImagePath</label>
        	<input type="text" name="imagePath"><br>
        	
        	<label for="category">Choose Category</label>
        	<select name="category">
        	<%
        	while(category2.hasMoreTokens())
        	{
        		String currentCategory2=category2.nextToken();
        	%>
        	<option value="<%=currentCategory2 %>"> <%=currentCategory2 %></option>
        	<%
        	}%>
        	</select>
        	<input type="hidden" name="menuAction" value="create">
        	<input type="submit" value="Submit">
    
    </form>
    
    </div>
    </div>

    <h1 class="sectionTitle"><%=restaurant.getName() %></h1>
    <h2><%=restaurant.getCusineType() %></h2>
    <h2>ETA <%=restaurant.getEta() %></h2>
	<%
	while(category.hasMoreTokens())
    {

		
		MenuDAO menuImpl=new MenuImpl();
		String currentCategory=category.nextToken();
		List<MenuModel> menusByCategory=menuImpl.getMenyByCategory(Integer.parseInt(request.getParameter("restaurantId")), currentCategory);
		%>
		<div class="categoryContainer">
		<h1><%=currentCategory%></h1>
		</div>

		<div class="menuGrid">
				<%
		for(MenuModel menu:menusByCategory)
		{
			%>
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
	                <div>
	                <form action="EditMenu.jsp?menuId=<%=menu.getMenuId()%>&restaurantId=<%=menu.getRestaurantId()%>" method="post">
	                <input type="hidden" name="menuId" value="<%=menu.getMenuId()%>">
	                <input type="hidden" name="restaurantId" value="<%=menu.getRestaurantId()%>">
	                <button class="addToCartButton" type="submit" value="Add to Cart">Edit Menu</button>
	                </form>
	                </div>
            	</div>           
        </a>
        </div>
	<%
		}
	%>
			
		</div>
				<%
		
	}%>
</div>

</body>
</html>