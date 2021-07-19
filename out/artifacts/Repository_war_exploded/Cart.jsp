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
	.paymentCard
	{
		width:100px;
		height:auto;
	}
</style>
</head>
<body>

<% 
	Cart carrello=null;
	ProductBeanCart product=null;
	int size=0;
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
		<h1>Carrello vuoto</h1>
<% 
		return;
	}

%>
	
	<!-- Aggiungere JavaScript: se il carrello è vuoto, l'innerHTML diventa "Carrello vuoto" -->
	<h1 id="cartTitle">Carrello</h1>
	<br>

	<% 
			double prezzoTotale=0;
			for(int i=0; i<size; i++)
			{
				product=carrello.getProduct(i);	
				
			
	%>	
	
		
		<div id="productContainer">
				<div id="cartImageContainer">
					<% String copertina="./images/"+product.getTitolo()+"/copertina.jpg"; %>
					<img id="cartImage" src="<%= copertina %>">
				</div>
			
				<div id="CartInformationDiv">
				<table>
				  <tr>
				    <td><b>Titolo</b></td>
				    <td><%=product.getTitolo() %></td>
				  </tr>
				  <tr>
				    <td><b>Piattaforma</b></td>
				    <td><%=product.getPiattaforma()%></td>
				  </tr>
				  <tr>
				    <td><h3>Prezzo (IVA inclusa)</h3></td>
				    <td><font color="green"><%=product.getPrezzoTotale()*product.getCartQuantity()%> euro </font></td>
				  </tr>
				  <tr>
				    <td><h3>Quantit&agrave;</h3></td>
				    <td>
				    <form method="get" action="ModifyQuantityServlet"> <!-- form che invia alla servlet la nuova quantità e il prodotto -->
				    	<input type="hidden" name="productID" value="<%= product.getId() %>">
				    	<input style="width:35px" type="number" name="setQuantity" value="<%=product.getCartQuantity()%>">
				    	<input class="button" type="submit" name="sendQuantity" value="aggiorna">
						<input class="button" type="submit" name="remove" value="rimuovi">
				    </form>
				    </td>
				  </tr>
				  <tr>
				 
				  </tr>
				  
				  
				 </table>
				 	</div>
</div>
	<% 
			prezzoTotale=prezzoTotale+(product.getPrezzoTotale()*product.getCartQuantity());
			prezzoTotale=Math.floor(prezzoTotale * 100) / 100;
			
			} 
	
	%>
	
	<h2 id="prezzoTotale">Prezzo Totale: <%=prezzoTotale %> </h2>
	<!-- Checkout che annulla il carrello  -->
	<form method="get" action="CheckoutServlet">
	<hr>
	<h2>Spedizione</h2>
	<p> <input type="text" name="indirizzo" placeholder="Indirizzo"> </p>
	<p> <input type="text" name="numeroCivico" placeholder="Numero Civico"> *SNC se assente </p>
	<p> <input type="text" name="cap" placeholder="CAP"> </p>
	<p> <input type="text" name="citta" placeholder="Citt&agrave;"> </p>
	<p> <input type="text" name="provincia" placeholder="Provincia"> </p>
	<hr>
	<h2>Pagamento</h2>
	<p>Carte accettate: </p>
	<img class="paymentCard" src="images/paymentCards/mastercard.jpg">
	<img class="paymentCard" src="images/paymentCards/visa.jpg">
	<p> <input type="text" name="intestatario" placeholder="Intestatario"> </p>
	<p> <input type="text" name="numeroCarta" placeholder="Numero Carta"> </p>
	<p> <input type="text" name="meseScadenza" placeholder="Mese di scadenza" onfocus="(this.type='number')" onblur="(this.type='text')" min='1' max='12'> </p>
	<p> <input type="text" name="annoScadenza" placeholder="Anno di scadenza" onfocus="(this.type='number')" onblur="(this.type='text')" min='2021' max='2050'> </p>
	<p> <input type="text" name="cvv" placeholder="CVV"> </p>
	<h1 id="checkout"><input class="button" type="submit" name="checkout" value="Checkout"></h1>
	</form>
	



</body>
</html>