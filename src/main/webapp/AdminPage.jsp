<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import= "java.util.List,com.tomato.models.*,
     com.tomato.DAOImplementation.*,com.tomato.DAO.*"  %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="styles/HeaderAndFooterStyles.css">
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet" type="text/css" href="styles/AdminPage.css">
</head>
<body>
<header>
<div class="navBar">
    <div class="navBarLogoContainer">
        <h1 class="navBarLogo">tomato</h1>
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
<div class="adminDashBoard">
    <h1>Admin Dashboard</h1>
    <div class="globalOption">
    <form action="AdminServlet">
    <input type="hidden" name="option" value="restaurant">
    <button type="submit"> Restaurants </button>
    </form>
    <form action="AdminServlet">
    <input type="hidden" name="option" value="menu">
    <button type="submit">Menu</button>
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