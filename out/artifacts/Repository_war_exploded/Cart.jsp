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
				<input id="quantitaAcquistabile" style="width:35px;text-align: center" type="number" max="<%=product.getQuantitaNegozio()%>" name="setQuantity"
					 onkeyup="checkQuantity(<%=product.getQuantitaNegozio()%>)" value="<%=product.getCartQuantity()%>">
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

		<%
		UserBean user = (UserBean) session.getAttribute("currentUserSession");
		if(user==null)
		{
		%>
				<div>
					<p style="font-size:1vw;color: #ff1a3f;font-weight: bold">Effettua il login per continuare con l'acquisto</p>
					<div class="priceDiv">
						<p style="text-align: left;margin: 0;color: gainsboro;">Prezzo Totale: </p>
						<h3 style="margin: 0;color: white;font-size: 2vw;"><%=prezzoTotale %> euro </h3>
					</div>
					<h1><input disabled style="background-color: darkgray;border: none" class="button" type="submit" name="checkout" value="Checkout"></h1>
				</div>
		      </div>
			</div>
			<%@ include file="fragments/footer.jsp"%>
		<%

		return;
		}
		%>
		<!-- Checkout che annulla il carrello  -->
		<form name="checkoutForm"  method="get" action="CheckoutServlet" onSubmit="return formValidationSpedizione();">
			<h2>Spedizione</h2>
			<p>
				<input class="inputFormCart" type="text" name="indirizzo" placeholder="Indirizzo" onClick="resetField(this.name);">
				<br>
				<small style="margin-top: 20px;"></small>
			</p>
			<p>
				*SNC se assente<br>
				<input class="inputFormCart" type="text" name="numeroCivico" placeholder="Numero Civico" onClick="resetField(this.name);">
				<br>
				<small></small>
			</p>
			<p>
				<input class="inputFormCart" type="text" name="cap" placeholder="CAP" onClick="resetField(this.name);">
				<br>
				<small></small>
			</p>
			<p>
				<input class="inputFormCart" type="text" name="citta" placeholder="Citt&agrave;" onClick="resetField(this.name);">
				<br>
				<small></small>
			</p>
			<p>
				<input class="inputFormCart" type="text" name="provincia" placeholder="Provincia" onClick="resetField(this.name);">
				<br>
				<small></small>
			</p>
			<hr width="70%">
			<h2>Pagamento</h2>
			<p>Carte accettate: </p>
			<img class="paymentCard" src="images/paymentCards/mastercard.jpg">
			<img class="paymentCard" src="images/paymentCards/visa.jpg">
			<p>
				<input class="inputFormCart" type="text" name="intestatario" placeholder="Intestatario">
				<br>
				<small></small>
			</p>
			<p>
				<input class="inputFormCart" type="text" name="numeroCarta" placeholder="Numero Carta">
				<br>
				<small></small>
			</p>
			<p>
				<input class="inputFormCart" type="text" name="meseScadenza" placeholder="Mese di scadenza" onfocus="(this.type='number')" onblur="(this.type='text')">
				<br>
				<small></small>
			</p>
			<p>
				<input class="inputFormCart" type="text" name="annoScadenza" placeholder="Anno di scadenza" onfocus="(this.type='number')" onblur="(this.type='text')">
				<br>
				<small></small>
			</p>
			<p>
				<input class="inputFormCart" type="text" name="cvv" placeholder="CVV">
				<br>
				<small></small>
			</p>
			<div class="priceDiv">
				<p style="text-align: left;margin: 0;color: gainsboro;">Prezzo Totale: </p>
				<h3 style="margin: 0;color: white;font-size: 2vw;"><%=prezzoTotale %> euro </h3>
			</div>
			<h1 id="checkout"><input class="button" type="submit" name="checkout" value="Checkout"></h1>
		</form>
	</div>
</div>

<script src="${pageContext.request.contextPath}/scripts/jquery.js"></script>
<script src="${pageContext.request.contextPath}/scripts/CartScripts.js"></script>
<%@ include file="fragments/footer.jsp"%>
<script src="${pageContext.request.contextPath}/scripts/CartScripts.js"></script>
</body>

</html>