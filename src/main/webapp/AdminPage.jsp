<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import= "java.util.List,com.tomato.models.*,
     com.tomato.DAOImplementation.*,com.tomato.DAO.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet" type="text/css" href="styles/AdminPage.css">
</head>
<body>
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
</body>
</html>