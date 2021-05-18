<%--suppress XmlDuplicatedId --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.ArrayList, model.PurchaseModels.ProductBean"%>
<%@ page import ="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/productsList.css">
<title>Videogames</title>
</head>
<body>

<%
    @SuppressWarnings (value="unchecked") //per non fare comparire il warning

	ArrayList<ProductBean> products = (ArrayList<ProductBean>) request.getAttribute("products");

	if(products==null)
	{
		response.sendRedirect("./ProductsServlet");
		return;
	}
%>

<a style="background: #e5910b" href="Cart.jsp" target="_blank">Mostra carrello</a>
<%
	if(session.getAttribute("currentUserSession")!=null)
	{
%>		<a href="GetOrdersServlet">Ordini</a>
		<a href="LogoutServlet">Logout</a>
<%
	}
	else
	{
%>
		<a href="Login.jsp">Login</a>
		<a href="Registrazione.jsp">Registrati</a>
<%
	}
%>

<table>
	<tr>

		<td id="FirstRow"><h2>Titolo</h2></td>
		<td id="FirstRow"><h2>Descrizione</h2></td>
	</tr>
		<% for(ProductBean e :products) { %>

	<tr>
		<td>
		<%= e.getTitolo()%>
		</td>
		<td id="dettagli">
		<form method="get" action="ProductInfoServlet" target="_blank"> <!-- Form all'interno del ciclo per non accorpare tutti gli id nell'url -->
			<input class="button" type="hidden" value="<%=e.getId() %>" name="productID">
			<input class="button" type="submit" value="Dettagli">
		</form>
		<form method="get" action="AddToCartServlet" target="_self">
			<input class="button" type="hidden" value="<%=e.getId() %>" name="productID">
			<input class="button" type="submit" value="Aggiungi al Carrello">
		</form>
		</td>
	</tr>

	<% } %>
</table>



</body>
</html>