<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Restaurant</title>
</head>
<body>
<h1>Since, U didnt have any restuarant db, add restuarant details to continue !</h1>
<%
int adminId=(Integer)session.getAttribute("userId");
%>
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
        <input type="hidden" name="adminUserId" value="<%=adminId%>">
        <input type="hidden" name="redirectTo" value="ManageRestaurant">
        <label for="restaurantImagePath">Image Path</label>
        <input type="text" name="restaurantImagePath"><br>
        <label for="menuType">Menu Type</label>
        <input type="text" name="menuType"><br>
        <input type="hidden" name="restaurantAction" value="create">
        <input type="submit" value="Submit">
        </form>
    </div>

</body>
</html>