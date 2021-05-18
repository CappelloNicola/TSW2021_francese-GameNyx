<%@page import="model.PurchaseModels.ProductBean"%>
<%@page import="model.PurchaseModels.Cart"%>
<%@page import="model.PurchaseModels.ProductBeanCart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/productInformations.css">
<meta charset="ISO-8859-1">
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
	
	<h1>Carrello</h1>
	<br>

	<% 
			double prezzoTotale=0;
			for(int i=0; i<size; i++)
			{
				product=carrello.getProduct(i);	
				
			
	%>	
	
		
		<div class="container">	
				<div class="copertina">
					<% String copertina="./images/"+product.getTitolo()+"/copertina.jpg"; %>
					<img src="<%= copertina %>">
				</div>
			
				<div class="info">
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
				    	<input type="submit" name="sendQuantity" value="aggiorna">
						<input type="submit" name="remove" value="rimuovi">
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
			
			} 
	
	%>
	
	<h2>Prezzo Totale: <%=prezzoTotale %> </h2>
	<!-- Checkout che annulla il carrello  -->
	<form method="get" action="CheckoutServlet">
	<p> <input type="text" name="indirizzo" placeholder="indirizzo di consegna"> </p>
	<h1><input class="button" type="submit" name="checkout" value="Checkout"></h1>
	</form>
	



</body>
</html>