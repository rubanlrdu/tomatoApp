<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration - TomatoApp</title>
    <!-- Link to your new CSS file -->
    <link rel="stylesheet" href="styles/RegisterStyles.css">
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

        <%} %>
        <div class="cartButtonContainer"><a href="CartPage.jsp" class="cartButton"><i class="fa-solid fa-cart-shopping"></i> Cart</a></div>
    </div>
</div>
</header>
<div class="mainContainer">
<% 
    if (userName!=null)
    {
    	%>
   	<form action="Home">
    <button type="submit" class="navBarLogo">Continue Shopping</button></form> 
        <%
    }%>
    <div class="register-container">
        <h1>Create an Account</h1>
        <p class="subtitle">Join us and start exploring!</p>
        
        <form action="UserDbServlet" method="post">
        	<input type="hidden" name="action" value="create">
            
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" placeholder="e.g., John Doe" required>
            </div>
            
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Choose a unique username" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Create a strong password" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="you@example.com" required>
            </div>

            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" name="phone" placeholder="Your contact number" required>
            </div>

            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" placeholder="Your delivery address" required>
            </div>
            
            <!-- Role Selection -->
            <div class="form-group">
                <label>Choose your account type</label>
                <div class="radio-group">
                    <div class="radio-option">
                        <input type="radio" id="customer" name="role" value="Customer" checked>
                        <label for="customer">Customer</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="admin" name="role" value="Admin">
                        <label for="admin">Admin</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="restaurant" name="role" value="Restaurant">
                        <label for="restaurant">Restaurant</label>
                    </div>
                </div>
            </div>
            
            <!-- Submit Button -->
            <button type="submit" class="submit-btn">Register</button>
            
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