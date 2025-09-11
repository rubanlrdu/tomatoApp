<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tomato.models.AddressModel, com.tomato.DAO.AddressDAO, com.tomato.DAOImplementation.AddressImpl,
java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles/CheckoutPageStyles.css">
   <link rel="stylesheet" href="styles/HeaderAndFooterStyles.css">
<meta charset="UTF-8">
<title>Checkout</title>
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
<div class="checkout-container">
    <form action="CheckoutServlet" id="checkoutForm" class="checkout-form">
        
        <!-- Section for Saved Addresses -->
        <div class="form-section">
            <h1 class="section-title">Select a Address</h1>
            <%
            	int userId=0;
        		if(session.getAttribute("userId")!=null)
        		{
        		userId = (Integer)session.getAttribute("userId");
        		}
        		else{
        			RequestDispatcher rd=request.getRequestDispatcher("LoginPage.jsp");
        			rd.forward(request,response);
        		}
            AddressDAO addressImpl = new AddressImpl();
            List<AddressModel> list = addressImpl.getAllAddressByUser(userId);
            %>
            <div class="form-group">
                <select id="existingAddress" name="existingAddress" required>
                    <option value="none" selected>-- Choose an Option --</option>	
                    <%
                    for(AddressModel a : list) {
                        // FIX: Format the address into a single string for the option text.
                        // We also set the value to the addressId for easier processing in the servlet.
                        String formattedOptionText = String.format("%s - %s, %s", 
                            a.getAddressType(), a.getAddressLine1(), a.getCity());
                    %>
                    <option value="<%= formattedOptionText%>"><%= formattedOptionText %></option>
                    <%
                    }
                    %>
                   <option value="none" class="secondary-button">Enter New Address</option>
                </select>
            </div>
        </div>

        <!-- Button to trigger the new address form -->
        
        <!-- Section for New Address Form (Initially Hidden) -->
        <div class="form-section newAddressContainer">
            <h1 class="section-title">New Delivery Address</h1>
            
            <div class="form-group">
                <label for="addressLine1">Address Line 1 (House No, Street)</label>
                <textarea id="addressLine1" name="addressLine1"></textarea>
            </div>

            <div class="form-group">
                <label for="addressLine2">Address Line 2 (Apartment, Area)</label>
                <textarea id="addressLine2" name="addressLine2"></textarea>
            </div>

            <div class="form-group">
                <label for="landmark">Landmark</label>
                <textarea id="landmark" name="landmark"></textarea>
            </div>
            
            <div class="form-grid">
                <div class="form-group">
                    <label for="city">City</label>
                    <textarea id="city" name="city"></textarea>
                </div>
                <div class="form-group">
                    <label for="state">State</label>
                    <textarea id="state" name="state"></textarea>
                </div>
            </div>

            <div class="form-group">
                <label for="postalCode">Postal Code</label>
                <textarea id="postalCode" name="postalCode"></textarea>
            </div>
            
            <div class="form-grid">
                <div class="form-group">
                    <label for="addressType">Address Type</label>
                    <select id="addressType" name="addressType">
                        <option value="Home">Home</option>
                        <option value="Work">Work</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="saveAddress">Save this address?</label>
                    <select id="saveAddress" name="saveAddress">
                        <option value="yes">Yes</option>
                        <option value="no" selected>No</option>
                    </select>
                </div>
            </div>
        </div>
        
        <!-- Section for Payment -->
        <div class="form-section">
            <h1 class="section-title">Payment Method</h1>
            <div class="form-group">
                <label for="paymentOption">Choose an Option</label>
                <select id="paymentOption" name="paymentOption" required>
                    <option value="cod">Cash On Delivery</option>
                    <option value="online">Online Payment</option>
                </select>
            </div>
        </div>
        
        <input type="submit" value="Place Order" class="primary-button">
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
<script>
document.querySelector(".newAddressButton").onclick=function()
{
	document.querySelector(".newAddressContainer").classList.add('active');
}

</script>
</html>