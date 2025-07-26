<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.dev.service.impl.*,com.dev.service.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Logout Header</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body style="background-color: #F0FFF0;">

<!-- Header Section -->
<div class="container-fluid text-center" style="margin-top: 60px;">
	<div class="row">
		<div class="col-sm-2">
			<img src="logo-left.png" alt="Left Image" class="img-responsive" style="max-height: 300px;">
		</div>
		<div class="col-sm-8">
			<div style="background-color: #FF69B4; color: white; padding: 5px;">
				<h2>E-Shop</h2>
				<h6>We specialize in Electronics</h6>
				<form class="form-inline" action="index.jsp" method="get">
					<div class="input-group">
						<input type="text" class="form-control" size="40" name="search" placeholder="Search Items" required>
						<div class="input-group-btn">
							<input type="submit" class="btn btn-danger" value="Search" />
						</div>
					</div>
				</form>
				<p align="center" style="color: blue; font-weight: bold; margin-top: 5px; margin-bottom: 5px;" id="message"></p>
			</div>
		</div>
		<div class="col-sm-2">
			<img src="logo-right.png" alt="Right Image" class="img-responsive" style="max-height: 600px;">
		</div>
	</div>
</div>

<%
String userType = (String) session.getAttribute("usertype");
if (userType == null) { // GUEST
%>
<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp"><span class="glyphicon glyphicon-home">&nbsp;</span>E-Shop</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="login.jsp">Login</a></li>
				<li><a href="register.jsp">Register</a></li>
				
				<li><a href="index.jsp">Products</a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Category <span class="caret"></span></a>
					<ul class="dropdown-menu">
					        <li><a href="index.jsp?type=recommended">Recommended</a></li>
						<li><a href="index.jsp?type=mobile">Mobiles</a></li>
						<li><a href="index.jsp?type=tv">TVs</a></li>
						<li><a href="index.jsp?type=laptop">Laptops</a></li>
						<li><a href="index.jsp?type=camera">Camera</a></li>
						<li><a href="index.jsp?type=speaker">Speakers</a></li>
						<li><a href="index.jsp?type=tablet">Tablets</a></li>
						<li><a href="index.jsp?type=cooler">Cooler</a></li>
						<li><a href="index.jsp?type=fan">Fan</a></li>
						<li><a href="index.jsp?type=electronics">Electronics</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>
<%
} else if ("customer".equalsIgnoreCase(userType)) {
	int notf = new CartServiceImpl().getCartCount((String) session.getAttribute("username"));
%>
<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="userHome.jsp"><span class="glyphicon glyphicon-home">&nbsp;</span>E-Shop</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="userHome.jsp"><span class="glyphicon glyphicon-home">Products</span></a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Category <span class="caret"></span></a>
					<ul class="dropdown-menu">
					        <li><a href="userHome.jsp?type=recommended">Recommended</a></li>
						<li><a href="userHome.jsp?type=mobile">Mobiles</a></li>
						<li><a href="userHome.jsp?type=tv">TV</a></li>
						<li><a href="userHome.jsp?type=laptop">Laptops</a></li>
						<li><a href="userHome.jsp?type=camera">Camera</a></li>
						<li><a href="userHome.jsp?type=speaker">Speakers</a></li>
						<li><a href="userHome.jsp?type=tablet">Tablets</a></li>
						<li><a href="userHome.jsp?type=cooler">Cooler</a></li>
						<li><a href="userHome.jsp?type=fan">Fan</a></li>
						<li><a href="userHome.jsp?type=electronics">Electronics</a></li>
					</ul>
				</li>
				<% if (notf == 0) { %>
					<li><a href="cartDetails.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>Cart</a></li>
				<% } else { %>
					<li><a href="cartDetails.jsp" style="margin: 0px; padding: 0px;" id="mycart">
						<i data-count="<%=notf%>" class="fa fa-shopping-cart fa-3x icon-white badge" style="background-color: #333; padding-top: 3px;"></i>
					</a></li>
				<% } %>
				<li><a href="orderDetails.jsp">Orders</a></li>
				<li><a href="userProfile.jsp">Profile</a></li>
				<li><a href="./LogoutSrv">Logout</a></li>
			</ul>
		</div>
	</div>
</nav>
<%
} else { // ADMIN
%>
<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="adminViewProduct.jsp"><span class="glyphicon glyphicon-home">&nbsp;</span>E-Shop</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="adminViewProduct.jsp">Products</a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Category <span class="caret"></span></a>
					<ul class="dropdown-menu">
                                                <li><a href="adminViewProduct.jsp?type=recommended">Recommended</a></li>
						<li><a href="adminViewProduct.jsp?type=mobile">Mobiles</a></li>
						<li><a href="adminViewProduct.jsp?type=tv">TVs</a></li>
						<li><a href="adminViewProduct.jsp?type=laptop">Laptops</a></li>
						<li><a href="adminViewProduct.jsp?type=camera">Camera</a></li>
						<li><a href="adminViewProduct.jsp?type=speaker">Speakers</a></li>
						<li><a href="adminViewProduct.jsp?type=tablet">Tablets</a></li>
						<li><a href="adminViewProduct.jsp?type=cooler">Cooler</a></li>
						<li><a href="adminViewProduct.jsp?type=fan">Fan</a></li>
						<li><a href="adminViewProduct.jsp?type=electronics">Electronics</a></li>
					</ul>
				</li>
				<li><a href="adminStock.jsp">Stock</a></li>
				<li><a href="shippedItems.jsp">Shipped</a></li>
				<li><a href="unshippedItems.jsp">Orders</a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Update Items <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="addProduct.jsp">Add Product</a></li>
						<li><a href="removeProduct.jsp">Remove Product</a></li>
						<li><a href="updateProductById.jsp">Update Product</a></li>
					</ul>
				</li>
				<li><a href="./LogoutSrv">Logout</a></li>
			</ul>
		</div>
	</div>
</nav>
<% } %>

</body>
</html>
