<%@page import="model.PurchaseModels.ProductBean"%>
<%@page import="model.PurchaseModels.Cart"%>
<%@page import="model.UserModels.UserBean"%>
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

<%
		UserBean user=(UserBean) session.getAttribute("currentUserSession");
		
		if(user!=null)
		{
			if(!user.getAdmin())
			{
				response.sendError(HttpServletResponse.SC_UNAUTHORIZED);//error 401
				return;
			}
		}
		else
		{
			response.sendRedirect(request.getContextPath()+"/Login.jsp");
			return;
		}
	%>



<div id="productInformationDivAdmin">
	<div id="productInfoImageAdmin">
		<% String copertina="./images/"+product.getTitolo()+"/copertina.jpg"; %>
		<img src="<%= copertina %>">
	</div>
	<div>
		<table>
		  <tr>
		    <td><b>Titolo</b></td>
		    <td><input type="text" size=50 value="<%=product.getTitolo() %>"></td>
		  </tr>
		  <tr>
		    <td><b>Descrizione</b></td>
		    <td><input type="text" size=50 value="<%=product.getDescrizione()%>"></td>
		  </tr>
		  <tr>
		    <td><b>Casa Produttrice</b></td>
		    <td><input type="text" size=50 value="<%=product.getCasaProduttrice()%>"></td>
		  </tr>
		  <tr>
		    <td><b>Genere</b></td>
		    <td><select id="genreSelect"name="genere" autocomplete="off"> <!-- "selected" non funziona senza autocomplete="off" su Firefox -->
			    <option value="Rpg">Rpg</option>
			    <option value="Azione">Azione</option>
			  </select></td>
		  </tr>
		  <tr>
		    <td><b>Data pubblicazione</b></td>
		    <td><input type="date" value="<%=product.getDataPubblicazione()%>"></td>
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
		    <td><%=product.getPrezzo()%> euro</td>
		  </tr>
		  <tr>
		    <td><b>Iva</b></td>
		    <td><%=product.getIva()%>%</td>
		  </tr>
		  <tr>
		    <td><h3>Prezzo Totale:</h3></td>
		    <td><%=product.getPrezzoTotale()%></td>
		  </tr>
		 </table>
	</div>
</div>
</body>

	<script src="${pageContext.request.contextPath}/scripts/jquery.js"></script> 
	<script src="${pageContext.request.contextPath}/scripts/ProdottoAdminScripts.js"></script>
	<script>
		var genre="<%=product.getGenere()%>";
		changeSelected(genre);
	</script>
</html>