<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List, com.tomato.models.MenuModel"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="MenuStyles.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<meta charset="UTF-8">
<title>tomatoApp</title>
</head>
<body>
<header>
<div class="navBar">
    <div class="navBarLogoContainer">
        <h1 class="navBarLogo">tomato</h1>
    </div>
    <div class="navBarButtons">
        <div class="loginButtonContainer"><a class="loginButton" href="LoginPage.jsp">login</a></div>
        <div class="signupButtonContainer"><a class="signupButton" href="RegisterPage.jsp">signup</a></div>
        <div class="cartButtonContainer"><a href="CartPage.jsp" class="cartButton">cart</a></div>
    </div>
</div>
</header>
<div class="mainContainer">
    <h1 class="sectionTitle">Menu</h1>
    <div class="menuGrid">
    
    <%
    List<MenuModel> menus=(List<MenuModel>)request.getAttribute("menus");
    for(MenuModel menu : menus)
    {
    %>
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
	                <form action="cartServlet" method="post">
	                <input type="hidden" name="menuId" value="<%=menu.getMenuId()%>">
	                <input type="hidden" name="quantity" value="1">
	                <input type="hidden" name="restaurantId" value="<%=menu.getRestaurantId()%>">
	                
	                <input type="hidden" name="action" value="add">
	                <input type="submit" value="Add to Cart">
	                </form>
            	</div>           
        </a>
        
    <%
    }
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