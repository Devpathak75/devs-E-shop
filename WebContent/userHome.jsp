<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.dev.service.impl.*, com.dev.service.*,com.dev.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>E-Shop</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #F0FFF0;">

	<%
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userName == null || password == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
	}

	ProductServiceImpl prodDao = new ProductServiceImpl();
	List<ProductBean> products = new ArrayList<ProductBean>();

	String search = request.getParameter("search");
	String type = request.getParameter("type");
	String message = "All Products";
	if (search != null) {
		products = prodDao.searchAllProducts(search);
		message = "Showing Results for '" + search + "'";
	} else if (type != null) {
		products = prodDao.getAllProductsByType(type);
		message = "Showing Results for '" + type + "'";
	} else {
		products = prodDao.getAllProducts();
	}
	if (products.isEmpty()) {
		message = "No items found for the search '" + (search != null ? search : type) + "'";
		products = prodDao.getAllProducts();
	}
	%>

	<jsp:include page="header.jsp" />

	<div class="text-center"
		style="color: black; font-size: 14px; font-weight: bold;"><%=message%></div>
	<!-- <script>document.getElementById('mycart').innerHTML='<i data-count="20" class="fa fa-shopping-cart fa-3x icon-white badge" style="background-color:#333;margin:0px;padding:0px; margin-top:5px;"></i>'</script>
 -->
	<!-- Start of Product Items List -->
	<div class="container">
		<div class="row text-center">

			<%
			for (ProductBean product : products) {
				int cartQty = new CartServiceImpl().getCartItemCount(userName, product.getProdId());
			%>
			<div class="col-sm-4" style='height: 350px;'>
				<div class="thumbnail">
					<img src="./ShowImage?pid=<%=product.getProdId()%>" alt="Product"
						style="height: 150px; max-width: 180px">
					<p class="productname"><%=product.getProdName()%>
					</p>
					<%
					String description = product.getProdInfo();
					description = description.substring(0, Math.min(description.length(), 100));
					%>
					<p class="productinfo"><%=description%>..
					</p>
					<p class="price">
						Rs
						<%=product.getProdPrice()%>
					</p>
					<form method="post">
						<%
						if (cartQty == 0) {
						%>
						<button type="submit"
							formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=1"
							class="btn btn-success">Add to Cart</button>
						&nbsp;&nbsp;&nbsp;
						<button type="submit"
							formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=1"
							class="btn btn-primary">Buy Now</button>
						<%
						} else {
						%>
						<button type="submit"
							formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=0"
							class="btn btn-danger">Remove From Cart</button>
						&nbsp;&nbsp;&nbsp;
						<button type="submit" formaction="cartDetails.jsp"
							class="btn btn-success">Checkout</button>
						<%
						}
						%>
					</form>
					<br />
				</div>
			</div>

			<%
			}
			%>

		</div>
	</div>
	<!-- ENd of Product Items List -->

<!-- Chatbot section -->
<div id="chatbot" style="width:100%;max-width:600px;margin:30px auto;border:1px solid #ccc;background:#fff;z-index:1;padding:10px;border-radius:10px;box-shadow:0 0 10px rgba(0,0,0,0.1);">
  <h4 style="margin-top:0;">Need Help?</h4>
  <div id="chatlog" style="height:280px;overflow:auto;border:1px solid #ddd;padding:5px;margin-bottom:5px;font-size:14px;"></div>
  <input type="text" id="chatInput" placeholder="Ask something..." style="width:75%;padding:5px;" />
  <button onclick="sendChat()" style="width:20%;padding:5px;">Send</button>
</div>

<script>
  function sendChat() {
    const input = document.getElementById("chatInput");
    const log = document.getElementById("chatlog");
    const msg = input.value.trim();
    if (!msg) return;

    log.innerHTML += "<div><b>User:</b> " + msg + "</div>";

    let reply = "I'm here to assist!";
    const q = msg.toLowerCase();

    if (q.includes("price")) reply = "Prices are shown under each product.";
    else if (q.includes("hello")) reply = "Hello , How Can I help You Today.";
    else if (q.includes("Products")) reply = "You Can Check the products above and from category options.";
    else if (q.includes("recommended")) reply = "You can check the recommended products in category.";
    else if (q.includes("buy")) reply = "Use 'Add to Cart' or 'Buy Now' to purchase.";
    else if (q.includes("remove")) reply = "Use 'Remove From Cart' to delete items.";
    else if (q.includes("checkout")) reply = "Click the 'Checkout' button to place your order.";
    else if (q.includes("help")) reply = "You can ask me about shopping, cart, or orders.";
    else if (q.includes("cart")) reply = "View your cart by clicking on the cart icon in the header.";
    else if (q.includes("offers")) reply = "Currently, all products are listed at discounted prices.";
    else if (q.includes("discount")) reply = "Special discounts are shown on the product card.";
    else if (q.includes("contact")) reply = "You can reach support at pdev7169@gmail.com.";
    else if (q.includes("login")) reply = "Already logged in! You’re in your dashboard now.";
    else if (q.includes("register")) reply = "New users can register using the Register option.";
    else if (q.includes("track")) reply = "Tracking is available after placing your order.";
    else if (q.includes("order")) reply = "Go to your profile to view past orders.";
    else if (q.includes("profile")) reply = "Click on the profile icon in the top menu to view or edit your details.";
    else if (q.includes("payment")) reply = "Payments are handled securely at checkout using various options.";
    else if (q.includes("thankyou")) reply = "you're welcome .";
    else if (q.includes("thank you")) reply = "you're welcome .";
    else if (q.includes("thanks")) reply = "you're welcome .";
    else if (q.includes("by")) reply = "by by, have a nice day .";

    log.innerHTML += "<div><b>Dev:</b> " + reply + "</div>";
    input.value = "";
    log.scrollTop = log.scrollHeight;
  }
</script>

	<%@ include file="footer.html"%>

</body>
</html>

<!-- Dev Deepak Pathak-->
