<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import= "java.util.List,com.tomato.models.*,
     com.tomato.DAOImplementation.*,com.tomato.DAO.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update menu</title>
</head>
<body>
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

</body>
</html>