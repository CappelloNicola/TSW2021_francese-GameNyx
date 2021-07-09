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
	
	<!-- Aggiungere JavaScript: se il carrello � vuoto, l'innerHTML diventa "Carrello vuoto" -->
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
				    <form method="get" action="ModifyQuantityServlet"> <!-- form che invia alla servlet la nuova quantit� e il prodotto -->
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
	<p id="indirizzoConsegna"> <input type="text" name="indirizzo" placeholder="indirizzo di consegna"> </p>
	<h1 id="checkout"><input class="button" type="submit" name="checkout" value="Checkout"></h1>
	</form>
	



</body>
</html>