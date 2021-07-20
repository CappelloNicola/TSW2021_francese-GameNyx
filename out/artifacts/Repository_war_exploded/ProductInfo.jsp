<%@page import="model.PurchaseModels.ProductBean"%>
<%@page import="model.PurchaseModels.Cart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/MyCss.css"/>
	<link rel="stylesheet" type="text/css" href="css/productInfo.css"/>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<% ProductBean product =(ProductBean) request.getAttribute("product"); %>

	<title><%=product.getTitolo() %></title>


</head>
<body>

<%@ include file="fragments/header.jsp"%>
<jsp:useBean id="cart" class="model.PurchaseModels.Cart" scope="session" />


<div class="ProductUpperInfoContainer">
	<p id="titolo"><%=product.getTitolo()%></p>
	<div class="ProductInfoMedia">
		<div class="trailerContainer">
			<iframe src="<%=product.getTrailerURL()%>?autoplay=1&mute=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
		<div class="screenshotsContainer">
			<%  String screenshots = "./images/"+product.getTitolo()+"/";%>
			<img src="<%=screenshots+"1.jpg"%>">
			<img src="<%=screenshots+"2.jpg"%>">
			<img src="<%=screenshots+"3.jpg"%>">
			<img src="<%=screenshots+"4.jpg"%>">
		</div>
	</div>
	<div class="ProductInfoDetails">

		<img src="./images/<%=product.getTitolo()%>/header.jpg">
		<p id="descrizione"><%=product.getDescrizione()%></p>
		<div class="infoContainer">
			<div class="infoLabel">
				<p>Data pubblicazione</p>
				<p>Sviluppatore</p>
			</div>
			<div class="info">
				<p><%=product.getDataPubblicazione()%></p>
				<p><%=product.getCasaProduttrice()%></p>
			</div>
		</div>
		<div class="priceContainer">
			<p>Prezzo</p>
			<span><%=product.getPrezzo()%> euro</span>
			<form action="AddToCartServlet" method="get" target="_self"><!-- invia i dati alla stessa pagina -->
				<!-- reinserisce nell'url l'id del prodotto per non perderlo -->
				<input class="button" type="hidden" value="<%=product.getId() %>" name="productID">
				<input class="button" id="addToCart" type="submit" name="addToCart" value="aggiungi al carrello">
			</form>
		</div>
	</div>
</div>

<div class="productDownInfoContainer">
	<div class="moreInfoContainer">
		<h3>Ulteriori informazioni</h3>
		<hr>
		<div class="moreInfoLabel">
			<span style="display: inline-block;margin-left: 5%;">
				<p>Generi</p>
				<p id="info"><%=product.getGenere()%></p>

				<p>Piattaforme</p>
				<p id="info"><%=product.getPiattaforma()%></p>
			</span>
			<span style="display: inline-block;margin-left: 35%;">
				<p>Lingue</p>
				<p  id="info"><%=product.getLingua()%></p>

				<p>Sottotitoli</p>
				<p id="info"><%=product.getSottotitoli()%></p>
			</span>

		</div>
	</div>

	<div class="productReviewsContainer">
		<h3>Recensioni</h3>
		<hr>
	</div>
</div>


<%@ include file="fragments/footer.jsp"%>
</body>
</html>

<script>
	document.body.style.backgroundImage = "url('./images/<%=product.getTitolo()%>/background.jpg')";
</script>