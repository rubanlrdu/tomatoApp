<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tomato.models.RestaurantModel, com.tomato.DAOImplementation.RestaurantImpl, com.tomato.DAO.RestaurantDAO" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles/HomeStyles.css">
<meta charset="UTF-8">
<title>Manage Restaurant</title>
</head>
<body>
<%
int restaurantId=(Integer)(session.getAttribute("restaurantId"));
RestaurantDAO restaurantImpl=new RestaurantImpl();
RestaurantModel r=restaurantImpl.getRestaurant(restaurantId);

%>
<div class="secondaryHeader">
<a href="ManageRestaurant.jsp?restaurantId=<%=restaurantId%>">Restaurant</a>
<a href="ManageMenu.jsp?restaurantId=<%=restaurantId%>">Menu</a>

</div>
<div class="mainContainer">
    <div class="restaurantGrid">
<div href="MenuServlet?restaurantId=<%=r.getRestaurantId()%>" style="text-decoration: none; color:inherit;">
            <img src="<%= r.getImagePath() %>" alt="A2B" class="restaurant-image">
            	<div class="restaurantInfo">
	                <h2 class="restaurantName"><%= r.getName() %></h2>
	                <p class="restaurant-cusine"><%= r.getCusineType() %></p>
	                <div class="restaurantMetaData">
	                    <span class="rating"> <i class="fas fa-star"></i> <%= r.getRating() %> </span>
	                    <span><%= r.getEta() %> mins</span>
	                    <span><%=r.getRestaurantId() %> for two</span>
	                </div>
            	</div>           
        </div>
       </div>
<div class="updateRestaurantContainer" id="updateRestaurant">
    <h1>Update Restaurant</h1>

        <p>Enter the details to be updated.</p>
		<form action="RestaurantDbServlet" method="post">
        <input type="hidden" value="<%=r.getRestaurantId()%>" name="restaurantIdentifier">
        <input type="hidden" value="<%=r.getAdminUserId()%>" name="adminUserId">
        <input type="hidden" value="<%=r.getRestaurantUniqueIdentifier()%>" name="restaurantUniqueIdentifier">
        <input type="hidden" name="redirectTo" value="ManageRestaurant">
        
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
        
        <label for="isAvailable">Is Availabe</label>
        <select name="isAvailable">
        <option value="1"> Active</option>
        <option value="0"> Not Active</option>
        </select>
        
        <input type="hidden" name="restaurantAction" value="update">

        <input type="submit" title="submit">
        </form>
    </div>
</div>
</body>
</html>