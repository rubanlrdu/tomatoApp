<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import= "java.util.List,com.tomato.models.*,
     com.tomato.DAOImplementation.*,com.tomato.DAO.*"  %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="styles/HeaderAndFooterStyles.css">
<meta charset="UTF-8">
<title>Menu Tasks</title>
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
        <div class="profileMenu">
             <a href="OrderHistory.jsp"class="ordersButton" id="dropDownButtons">Orders</a>
        </div>
        </div>
            <div class="cartButtonContainer"><a href="LogoutServlet" class="cartButton">Logout</a></div>
    <%
    }%>
    </div>
</div>
</header>
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
            <label>Availability</label>
        	<input type="radio" name="isAvailable" value="true">
        	<label for="isAvailable">Available</label>
        	<input type="radio" name="isAvailable" value="false">
            <label for="isAvailable">NotAvailable</label><br>
        	<label for="imagePath">ImagePath</label>
        	<input type="text" name="imagePath"><br>
        	<label for="category">Category</label>
        	<input type="text" name="category"><br>
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
        	<label for="category">Category</label>
        	<input type="text" name="category"><br>
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