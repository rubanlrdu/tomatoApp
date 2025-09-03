<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - TomatoApp</title>
    <!-- Link to the CSS file -->
    <link rel="stylesheet" href="styles/LoginStyles.css">
    <link rel="stylesheet" href="styles/HeaderAndFooterStyles.css">
    <!-- Optional: Link to Google Fonts for a modern look -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap" rel="stylesheet">
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

    <div class="login-container">
        <h1>Login</h1>
        <p class="subtitle">Welcome back! Please enter your details.</p>
        
        <form action="loginServlet" method="post">
            
            <!-- Username Field -->
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>
            </div>
            
            <!-- Password Field -->
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            
            <!-- Role Selection -->
            <div class="form-group">
                <label>Select Your Role</label>
                <div class="radio-group">
                    <div class="radio-option">
                        <input type="radio" id="role-customer" name="role" value="customer" checked>
                        <label for="role-customer">Customer</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="role-admin" name="role" value="admin">
                        <label for="role-admin">Admin</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="role-restaurant" name="role" value="restaurant">
                        <label for="role-restaurant">Restaurant</label>
                    </div>
                </div>
            </div>
            
            <!-- Submit Button -->
            <button type="submit" class="submit-btn">Login</button>
            
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