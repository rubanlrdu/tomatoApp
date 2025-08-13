<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@page import= "java.util.List,com.tomato.models.*,
     com.tomato.DAOImplementation.*,com.tomato.DAO.*" 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="Restaurants" id="restaurantOption">
    <div class="addRestaurantContainer" id="createRestaurant">
    	<h1>Add Restaurant</h1>
        <form action="RestaurantDbServlet" method="post">
        
        <label for="restaurantIdentifier">Unique Identifier name</label>
        <input type="text" name="restaurantIdentifier"><br>
        <label for="restaurantName">Name</label>
        <input type="text" name="restaurantName"><br>
        <label for="restaurantAddress">Address</label>
        <input type="text" name="restaurantAddress"><br>
        <label for="restaurantPhone">Phone</label>
        <input type="text" name="restaurantPhone"><br>
        <label for="restaurantRating">Rating</label>
        <input type="number" name="restaurantRating"><br>
        <label for="restaurantCusineType">Cusine Type</label>
        <input type="text" name="restaurantCusineType"><br>
        <label for="restaurantEta">ETA</label>
        <input type="text" name="restaurantEta"><br>
        <label for="adminUserId">adminUserId</label>
        <input type="text" name="adminUserId"><br>
        <label for="restaurantImagePath">Image Path</label>
        <input type="text" name="restaurantImagePath"><br>
        <input type="hidden" name="restaurantAction" value="create">
        <input type="submit" value="Submit">
        </form>
    </div>
    <div class="updateRestaurantContainer" id="updateRestaurant">
    <h1>Update Restaurant</h1>
        <form action="RestaurantDbServlet" method="get">
	        <input type="hidden" name="restaurantAction" value="allRestaurant">
	        <input type="submit" value="Fetch Restaurants" >
        </form>
        <%
        List<RestaurantModel> restaurants=(List<RestaurantModel>)session.getAttribute("getAllRestaurant");		
        %>
        <form action="RestaurantDbServlet" method="post">
        <label for="restaurant-select">Choose a Restaurant:</label>
                <select id="restaurant-select" name="restaurantIdentifier" required>
                    <option value="" disabled selected>-- Select a Restaurant --</option> 
                    <% 
                    if(restaurants!=null)
                    for(RestaurantModel r:restaurants)
            		{ %>
                    <option value="<%=r.getRestaurantId()%>"><%=r.getName()%> </option>
                    <%
                    }%>
                </select>

        <p>Enter the details to be updated.</p>

        <label for="restaurantName">Name</label>
        <input type="text" name="restaurantName"><br>

        <label for="restaurantAddress">Address</label>
        <input type="text" name="restaurantAddress"><br>

        <label for="restaurantPhone">Phone</label>
        <input type="text" name="restaurantPhone"><br>

        <label for="restaurantRating">Rating</label>
        <input type="text" name="restaurantRating"><br>

		<label for="restaurantCusineType">CusineType</label>
        <input type="text" name="restaurantCusineType"><br>

        <label for="restaurantEta">ETA</label>
        <input type="text" name="restaurantEta"><br>

        <label for="restaurantImagePath">Image Path</label>
        <input type="text" name="restaurantImagePath"><br>
        
        <label for="adminUserId">Admin UserId</label>
        <input type="text" name="adminUserId"><br>
        
        <input type="hidden" name="restaurantAction" value="update">

        <input type="submit" title="submit">
        </form>
    </div>
    <div class="deleteRestaurantContainer" id="deleteRestaurant">
    	<h1>Delete Restaurant</h1>
    	<form action="AdminServlet" method="post">
        <label for="restaurant-select">Choose a Restaurant:</label>
                <select id="restaurant-select" name="restaurantIdentifier" required><br>
                    <option value="" disabled selected>-- Select a Restaurant --</option> 
                    <% 
                    if(restaurants!=null)
                    for(RestaurantModel r:restaurants)
            		{ %>
                    <option value="<%=r.getRestaurantId()%>"><%=r.getName()  %> </option>
                    <%
                    }%>
                </select>
                <input type="hidden" name="restaurantAction" value="delete">
                <input type="submit" title="submit">
        </form>
    
    </div>
    </div>
</body>
</html>