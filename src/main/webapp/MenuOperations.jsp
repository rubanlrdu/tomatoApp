<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import= "java.util.List,com.tomato.models.*,
     com.tomato.DAOImplementation.*,com.tomato.DAO.*"  %>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="styles/HeaderAndFooterStyles.css">
<meta charset="UTF-8">
<title>Update menu</title>
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
        
    <%
    }%>
    </div>
</div>
</header>
<div>
<%
        	MenuDAO menuImplementation=new MenuImpl();
        	MenuModel menuTable=new MenuModel();
        	List<MenuModel> menus=(List<MenuModel>)request.getAttribute("getAllRestaurantMenu");
            
            %>
            <form action="MenuDbServlet">
            <label for="menu-select">Choose menu</label>
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
                </select>
                
            <label for="itemName">Item Name</label>
        	<input type="text" name="itemname">
        	<label for="description">Description</label>
        	<input type="text" name="description">
        	<label for="price">Price</label>
        	<input type="text" name="price">
        	<label for="rating">Item Name</label>
        	<input type="text" name="itemname"><br>

            <label>Availabilty</label>
        	<input type="radio" name="isAvailable" value="true">
        	<label for="isAvailable">Available</label>
        	<input type="radio" name="isAvailable" value="false">
            <label for="isAvailable">NotAvailable</label><br>
        	<label for="imagePath">ImagePath</label>
        	<input type="text" name="imagePath">
        	<input type="hidden" name="menuAction" value="update">
        	<input type="submit" value="Submit">
        </form>

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