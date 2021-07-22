<%@page import="model.PurchaseModels.ProductBean"%>
<%@page import="model.PurchaseModels.Cart"%>
<%@page import="model.PurchaseModels.ProductBeanCart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/MyCss.css">
<link rel="stylesheet" type="text/css" href="css/cart.css">
<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Carrello</title>

</head>
<body class="cartBackground">
<%@ include file="fragments/header.jsp"%>

<div class="cartContainer">

<% 

	ProductBeanCart product=null;
%>

<%
	if(session.getAttribute("carrello")!=null)
	{
		carrello=(Cart) session.getAttribute("carrello");
		size=carrello.getSize();
	}
	else
	{	
%>
	<div class="emptyCart">
		<h1>Carrello vuoto</h1>
		<p>ritorna all'homepage per iniziare gli acquisti</p>
	</div>
	<%@ include file="fragments/footer.jsp"%>
<%

		return;
	}

%>

	<div class="cartProducts">
	<table>
		<thead>
		<tr>
			<th scope="col"></th>
			<th scope="col"></th>
			<th scope="col"><p class="cartLabels">Piattaforma</p></th>
			<th scope="col"><p class="cartLabels">Quantità</p></th>
			<th scope="col"><p class="cartLabels">Prezzo</p></th>
		</tr>
		</thead>
		<tbody>
		<%
			double prezzoTotale=0;
			for(int i=0; i<size; i++)
			{
				product=carrello.getProduct(i);
		%>
		<tr class="trBackground">
			<form method="POST" action="ModifyQuantityServlet">
			<td class="copertinaTd">
				<div class="cartImageContainer">
					<% String copertina="./images/"+product.getTitolo()+"/copertina.jpg"; %>
					<img src="<%= copertina %>">
				</div>
			</td>
			<td><p class="titleLabel"><%=product.getTitolo()%></p></td>
			<td><p><%=product.getPiattaforma()%></p></td>
			<td><p>

				<input type="hidden" name="productID" value="<%= product.getId() %>">
				<input class="aggiornaButton" type="submit" name="sendQuantity" value="&#x21bb">
				<input style="width:35px;text-align: center" type="number" name="setQuantity" value="<%=product.getCartQuantity()%>">
				<input class="removeButton" type="submit" name="remove" value="&#x2716">
			</p></td>
			<td><p><%=product.getPrezzoTotale()*product.getCartQuantity()%> euro</p></td>
			</form>
		</tr>
		<%
				prezzoTotale=prezzoTotale+(product.getPrezzoTotale()*product.getCartQuantity());
				prezzoTotale=Math.floor(prezzoTotale * 100) / 100;
			}
		%>
		</tbody>

	</table>
	</div>
	<div class="checkoutContainer">
		<!-- Checkout che annulla il carrello  -->
		<form method="get" action="CheckoutServlet">
			<h2>Spedizione</h2>
			<p> <input type="text" name="indirizzo" placeholder="Indirizzo"> </p>
			<p> *SNC se assente<br><input type="text" name="numeroCivico" placeholder="Numero Civico">  </p>
			<p> <input type="text" name="cap" placeholder="CAP"> </p>
			<p> <input type="text" name="citta" placeholder="Citt&agrave;"> </p>
			<p> <input type="text" name="provincia" placeholder="Provincia"> </p>
			<hr width="70%">
			<h2>Pagamento</h2>
			<p>Carte accettate: </p>
			<img class="paymentCard" src="images/paymentCards/mastercard.jpg">
			<img class="paymentCard" src="images/paymentCards/visa.jpg">
			<p> <input type="text" name="intestatario" placeholder="Intestatario"> </p>
			<p> <input type="text" name="numeroCarta" placeholder="Numero Carta"> </p>
			<p> <input type="text" name="meseScadenza" placeholder="Mese di scadenza" onfocus="(this.type='number')" onblur="(this.type='text')" min='1' max='12'> </p>
			<p> <input type="text" name="annoScadenza" placeholder="Anno di scadenza" onfocus="(this.type='number')" onblur="(this.type='text')" min='2021' max='2050'> </p>
			<p> <input type="text" name="cvv" placeholder="CVV"> </p>
			<div class="priceDiv">
				<p style="text-align: left;margin: 0;color: gainsboro;">Prezzo Totale: </p>
				<h3 style="margin: 0;color: white;font-size: 2vw;"><%=prezzoTotale %> euro </h3>
			</div>
			<h1 id="checkout"><input class="button" type="submit" name="checkout" value="Checkout"></h1>
		</form>
	</div>
</div>
<%@ include file="fragments/footer.jsp"%>
</body>

</html>