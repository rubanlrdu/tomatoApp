<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*, com.tomato.models.*, java.util.Set, java.util.HashSet, java.util.ArrayList,
com.tomato.DAO.*,com.tomato.DAOImplementation.*"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="styles/MenuStyles.css">
<link rel="stylesheet" href="styles/HeaderAndFooterStyles.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<meta charset="UTF-8">
<title>tomatoApp</title>
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
             <a href="OrderHistory.jsp"class="ordersButton" id="dropDownButtons"><i class="fa-solid fa-box-archive"></i> Orders</a>
             <a href="AddressServlet?redirectTo=manageAddress" class="manageAddressButton ordersButton" id="dropDownButtons"><i class="fa-solid fa-map-location-dot"></i> Manage Address</a>
             <a href="LogoutServlet" class="logoutButton ordersButton" id="dropDownButtons"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
        </div>
        </div>
    <%
    }%>
    </div>
</div>
</header>
<div class="mainContainer">
    
    
    <%
    List<MenuModel> menus=(List<MenuModel>)request.getAttribute("menus");
    RestaurantDAO restaurantImpl=new RestaurantImpl();
	String categories=restaurantImpl.getRestaurant(Integer.parseInt(request.getParameter("restaurantId"))).getMenuType();
	StringTokenizer category=new StringTokenizer(categories,",");
	RestaurantModel restaurant=restaurantImpl.getRestaurant((Integer.parseInt(request.getParameter("restaurantId"))));
	%>
    <h1 class="sectionTitle"><%=restaurant.getName() %></h1>
    <h2><%=restaurant.getCusineType() %></h2>
    <h2>ETA <%=restaurant.getEta() %></h2>
	<%
	while(category.hasMoreTokens())
    {

		
		MenuDAO menuImpl=new MenuImpl();
		String currentCategory=category.nextToken();
		List<MenuModel> menusByCategory=menuImpl.getMenyByCategory(Integer.parseInt(request.getParameter("restaurantId")), currentCategory);
		%>
		<div class="categoryContainer">
		<h1><%=currentCategory%></h1>
		</div>

		<div class="menuGrid">
				<%
		for(MenuModel menu:menusByCategory)
		{
			%>
		<div class="menu-item-card">
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
	                <div>
	                <form action="cartServlet" method="post">
	                <input type="hidden" name="menuId" value="<%=menu.getMenuId()%>">
	                <input type="hidden" name="quantity" value="1">
	                <input type="hidden" name="restaurantId" value="<%=menu.getRestaurantId()%>">
	                
	                <input type="hidden" name="action" value="add">
	                <%if(menu.isAvailable()){ %>
	                <button class="addToCartButton" type="submit" value="Add to Cart">Add To Cart</button>
	                <%} %>
	                </form>
	                <%if(!menu.isAvailable()) { %>
	                <button class="notAvailableButton">Item Not Available</button>
	                <%} %>
	                </div>
            	</div>           
        </a>
        </div>
	<%
		}
	%>
			
		</div>
				<%
		
	}%>
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
<script>
    // 1. Select ALL elements with the class "categoryContainer". This returns a list.
    const categoryHeaders = document.querySelectorAll('.categoryContainer');

    // 2. Loop through each header in the list.
    categoryHeaders.forEach(header => {
        
        // 3. Add a separate click event listener to EACH header.
        header.addEventListener('click', function() {
            
            // 4. 'this' refers to the specific header that was clicked.
            //    'nextElementSibling' finds the menuGrid that is immediately after this header in the HTML.
            const menuGrid = this.nextElementSibling;
            
            // 5. Use 'toggle' instead of 'add'. Toggle will add the class if it's not there,
            //    and REMOVE it if it is there. This allows you to both show AND hide the menu.
            menuGrid.classList.toggle('active');
            categoryContainer.classList.toggle('active');
        });
    });
</script>
</body>

</html>