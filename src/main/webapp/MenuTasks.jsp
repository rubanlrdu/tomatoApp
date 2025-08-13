<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import= "java.util.List,com.tomato.models.*,
     com.tomato.DAOImplementation.*,com.tomato.DAO.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="Menus" id="menuOption">
    <%
        List<RestaurantModel> restaurants=(List<RestaurantModel>)session.getAttribute("getAllRestaurant");		
   	%>
    <div class="createMenuContainer" id="createMenu">
    <h1>Create Menu</h1>
    <form action="MenuDbServlet" method="post">
    		<label for="restaurant-select">Choose a Restaurant:</label>
                <select id="restaurant-select" name="restaurantId" required>
                    <option value="" disabled selected>-- Select a Restaurant --</option> 
                    <% 
                    if(restaurants!=null)
                    for(RestaurantModel r:restaurants)
            		{ %>
                    <option value="<%=r.getRestaurantId()%>"><%=r.getName()  %> </option>
                    <%
                    }%>
                </select><br>
            <label for="itemName">Item Name</label>
        	<input type="text" name="itemName"><br>
        	<label for="description">Description</label>
        	<input type="text" name="description"><br>
        	<label for="price">Price</label>
        	<input type="text" name="price"><br>
        	<label for="rating">rating</label>
        	<input type="text" name="rating"><br>
            <label>Availabilty</label>
        	<input type="radio" name="isAvailable" value="true">
        	<label for="isAvailable">Available</label>
        	<input type="radio" name="isAvailable" value="false">
            <label for="isAvailable">NotAvailable</label><br>
        	<label for="imagePath">ImagePath</label>
        	<input type="text" name="imagePath"><br>
        	<input type="hidden" name="menuAction" value="create">
        	<input type="submit" value="Submit">
    
    </form>
    
    </div>
    <div class="updateMenuContainer" id="updateMenu">
        
        <h1>Update Menu</h1>
        <form action="RestaurantDbServlet" method="get">
	        <input type="hidden" name="restaurantAction" value="allRestaurant">
	        <input type="submit" value="Fetch Restaurants" >
        </form>
            <label for="restaurant-select">Choose a Restaurant:</label>
            <form action="MenuDbServlet" method="get">
            	<input type="hidden" name="menuAction" value="getAllRestaurantMenu">
               <select id="restaurant-select" name="restaurantIdForMenu" required>
                    <option value="" disabled selected>-- Select a Restaurant --</option> 
                    <% 
                    if(restaurants!=null)
                    for(RestaurantModel r:restaurants)
            		{ 
            		%>
                    <option value="<%=r.getRestaurantId()%>"><%=r.getName()  %> </option>
                    <%
                    }%>
                    
                </select>
            <input type="submit" value="Fetch Menu">
            </form>
            <%
        	MenuDAO menuImplementation=new MenuImpl();
        	MenuModel menuTable=new MenuModel();
        	List<MenuModel> menus=(List<MenuModel>)request.getAttribute("getAllRestaurantMenu");
            
            %>
            <form action="MenuDbServlet" method="post">
            <label for="menu-select">Choose menu</label><br>
                <select id="menu-select" name="menuId" required>
                    <option value="" disabled selected>-- Select menu --</option> 
					<% 
					if (menus!=null)
                    for(MenuModel m: menus)
            		{ 
            		%>
                    <option value="<%=m.getMenuId()%>"><%=m.getItemName()%></option>
                     <%
                    }%>
                </select><br>
                
            <label for="itemName">Item Name</label>
        	<input type="text" name="itemName"><br>
        	<label for="description">Description</label>
        	<input type="text" name="description"><br>
        	<label for="price">Price</label>
        	<input type="text" name="price"><br>
        	<label for="rating">Item Name</label>
        	<input type="text" name="itemname"><br>

            <label>Availabilty</label><br>
        	<input type="radio" name="isAvailable" value="true">
        	<label for="isAvailable">Available</label>
        	<input type="radio" name="isAvailable" value="false">
            <label for="isAvailable">NotAvailable</label><br>
        	<label for="imagePath">ImagePath</label>
        	<input type="text" name="imagePath"><br>
        	<input type="hidden" name="menuAction" value="update">
        	<input type="submit" value="Submit">
        </form>

    </div>
    <div class="deleteMenuContainer" id="deleteMenu">
    <h1>Delete Menu</h1>
        <form action="RestaurantDbServlet" method="get">
	        <input type="hidden" name="restaurantAction" value="allRestaurant">
	        <input type="submit" value="Fetch Restaurants" >
        </form>
            <label for="restaurant-select">Choose a Restaurant:</label>
            <form action="MenuDbServlet" method="get">
            	<input type="hidden" name="menuAction" value="getAllRestaurantMenu">
               <select id="restaurant-select" name="restaurantIdForMenu" required>
                    <option value="" disabled selected>-- Select a Restaurant --</option> 
                    <% 
                    if(restaurants!=null)
                    for(RestaurantModel r:restaurants)
            		{ 
            		%>
                    <option value="<%=r.getRestaurantId()%>"><%=r.getName()  %> </option>
                    <%
                    }%>
                    
                </select>
            <input type="submit" value="Fetch Menu">
            </form>
            <form action="MenuDbServlet" method="post">
            <label for="menu-select">Choose menu</label><br>
                <select id="menu-select" name="menuId" required>
                    <option value="" disabled selected>-- Select menu --</option> 
					<% 
					if (menus!=null)
                    for(MenuModel m: menus)
            		{ 
            		%>
                    <option value="<%=m.getMenuId()%>"><%=m.getItemName()%></option>
                     <%
                    }%>
                </select><br>
            <input type="hidden" name="menuAction" value="delete">
        	<input type="submit" value="Submit">
            </form>    
    </div>
    </div>
</body>
</html>