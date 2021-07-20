<%@page import="model.PurchaseModels.ProductBean"%>
<%@page import="model.PurchaseModels.Cart"%>
<%@page import="model.PurchaseModels.ProductBeanCart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/MyCss.css">
<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Carrello</title>
<style>
	.cartContainer
	{
		width: 100%;
		height: 95%;
	}
	.cartBackground
	{
		background-color: #525c8e;
	}
	.paymentCard
	{
		width:50px;
		height:auto;
	}

	.emptyCart
	{
		width: 50%;
		height: 80%;
		margin: auto;
		text-align: center;
		margin-top: 10%;
	}
	.cartProducts
	{
		display: inline-block;
		float: left;
		width: 65%;
		border-radius: 15px;
		margin-top: 5%;
		margin-left: 1.5%;
		background-color: rgb(58, 65, 106, 0.8);
	}
	.checkoutContainer
	{
		width: 29.5%;
		display: inline-block;
		text-align: center;
		border-radius: 15px;
		margin-top: 4.6%;
		margin-left: 2.5%;
		background-color: #3a416a;
	}
	.checkoutContainer h2
	{
		color: white;
	}

	.cartImageContainer
	{
		float: left;
		width: 60%;
	}
	.cartImageContainer img {
		width: 80%;
		margin-left: -25px;
		margin-bottom: -5px;
		border-top-left-radius: 30px;
		border-bottom-left-radius: 30px;
	}

	.productContainer p
	{
		display: inline-block;
	}

	.CartInformationDiv .productTitle
	{
		margin-left: 20px;
		font-size: 0.8vw;
		color: white;
	}
	.cartLabels{
		color: white;
	}



	table
	{
		margin-left: 5%;
		margin-right: 5%;
		margin-bottom: 5%;
		border-collapse: inherit;
		border-spacing: 0px 20px;
	}

	td
	{
		width: 5%;
		text-align: center;
		font-size: 1vw;
		color: rgb(218, 218, 218);
		font-weight: 600;
	}
	td:last-child
	{
		border-bottom-right-radius: 30px;
		border-top-right-radius: 30px;
	}
	.copertinaTd
	{
		border-bottom-left-radius: 30px;
		border-top-left-radius: 30px;
	}
	.titleLabel
	{
		font-size: 1vw;
		color: whitesmoke;
		font-weight: 600;
		text-align: left;
	}
	.trBackground
	{
		background: rgb(82, 92, 142,0.3);
	}

	.checkoutContainer p
	{
		color: darkgray;
	}

</style>
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
				<input style="font-size: 13px" class="aggiornaButton" type="submit" name="sendQuantity" value="&#x21bb">
				<input style="width:35px;text-align: center" type="number" name="setQuantity" value="<%=product.getCartQuantity()%>">
				<input style="font-size: 11px" class="removeButton" type="submit" name="remove" value="&#x2716">
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
			<h2 id="prezzoTotale">Prezzo Totale: <%=prezzoTotale %> euro </h2>
			<h1 id="checkout"><input class="button" type="submit" name="checkout" value="Checkout"></h1>
		</form>
	</div>
</div>
</body>
<%@ include file="fragments/footer.jsp"%>
</html>