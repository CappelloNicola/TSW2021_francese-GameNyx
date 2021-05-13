<%@page import="model.ProductBean"%>
<%@page import="model.Cart"%>
<%@page import="model.ProductBeanCart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="productInformations.css">
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
		<h1>Carrelo vuoto</h1>
<% 
		return;
	}

%>
	
	<h1>Carrello</h1>
	<br>

	<% 
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
				    <td><h3>Prezzo</h3></td>
				    <td><font color="green"><%=product.getPrezzo()*product.getCartQuantity()%> euro </font></td>
				  </tr>
				  <tr>
				    <td><h3>Quantit&agrave;</h3></td>
				    <td>
				    <form method="get" action="ModifyQuantityServlet"> <!-- form che invia alla servlet la nuova quantità e il prodotto -->
				    	<input type="hidden" name="productID" value="<%= product.getId() %>">
				    	<input style="width:35px" type="number" name="setQuantity" value="<%=product.getCartQuantity()%>">
				    	<input type="submit" name="sendQuantity" value="aggiorna"> <!-- se si aggiorna la pagina si aggiunge +1 quantity!? -->
				    </form>
				    </td>
				  </tr>
				  <tr>
				 
				  </tr>
				  
				  
				 </table>
				 	</div>
</div>
	<% 
			} 
	
	%>
	
	<!-- Checkout che annulla il carrello  -->
	<form method="get" action="CheckoutServlet">
	<h1><input class="button" type="submit" name="checkout" value="Checkout"></h1>
	</form>




</body>
</html>