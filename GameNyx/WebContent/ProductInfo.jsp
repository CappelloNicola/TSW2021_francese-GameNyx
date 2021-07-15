<%@page import="model.PurchaseModels.ProductBean"%>
<%@page import="model.PurchaseModels.Cart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/MyCss.css"/>
<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<% ProductBean product =(ProductBean) request.getAttribute("product"); %>

<title><%=product.getTitolo() %></title>
</head>
<body>

	<jsp:useBean id="cart" class="model.PurchaseModels.Cart" scope="session" />


<%
	/*if (request.getParameter("addToCart") != null && request.getParameter("addToCart").equals("aggiungi") ) 
	{
		cart.addToCart(product);
		cart.showCart();
	}*/

%>



<div id="productInformationDiv">
	<div id="productInfoImage">
		<% String copertina="./images/"+product.getTitolo()+"/copertina.jpg"; %>
		<img src="<%= copertina %>">
	</div>
	<div>
		<table>
		  <tr>
		    <td><b>Titolo</b></td>
		    <td><%=product.getTitolo() %></td>
		  </tr>
		  <tr>
		    <td><b>Descrizione</b></td>
		    <td><%=product.getDescrizione()%></td>
		  </tr>
		  <tr>
		    <td><b>Casa Produttrice</b></td>
		    <td><%=product.getCasaProduttrice()%></td>
		  </tr>
		  <tr>
		    <td><b>Genere</b></td>
		    <td><%=product.getGenere()%></td>
		  </tr>
		  <tr>
		    <td><b>Data pubblicazione</b></td>
		    <td><%=product.getDataPubblicazione()%></td>
		  </tr>
		 <tr>
		    <td><b>Lingua</b></td>
		    <td><%=product.getLingua()%></td>
		  </tr>
		 <tr>
		    <td><b>Piattaforma</b></td>
		    <td><%=product.getPiattaforma()%></td>
		  </tr>
		  <tr>
		    <td><b>Presenza sottotitoli</b></td>
		    <td><%=product.getSottotitoli()%></td>
		  </tr>
		  <tr>
		    <td><b>Prezzo</b></td>
		    <td><%=product.getPrezzo()%> &euro;</td>
		  </tr>
		  <tr>
		    <td><b>Iva</b></td>
		    <td><%=product.getIva()%>%</td>
		  </tr>
		  <tr>
		    <td><h3>Prezzo Totale:</h3></td>
		    <td><%=product.getPrezzoTotale()%> &euro;</td>
		  </tr>
		 </table>
		<form action="AddToCartServlet" method="get" target="_self"><!-- invia i dati alla stessa pagina -->
			<!-- reinserisce nell'url l'id del prodotto per non perderlo -->
			<input class="button" type="hidden" value="<%=product.getId() %>" name="productID">
			<input class="button" type="submit" name="addToCart" value="aggiungi al carrello">
		</form>
	</div>
</div>
</body>
</html>