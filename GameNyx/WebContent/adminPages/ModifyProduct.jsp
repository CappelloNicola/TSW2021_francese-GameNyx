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
		<form action="ModifyProductServlet" method="POST">
		<table>
		  <!-- TODO Aggiungere modifica copertina e cambio nome del file immagine al cambiamento del titolo -->
		  <tr>
		    <td><b>Titolo</b></td>
		    <td><input type="text" name="titolo" size=50 value="<%=product.getTitolo() %>"></td>
		  </tr>
		  <tr>
		    <td><b>Descrizione</b></td>
		    <td><input type="text" name="descrizione" size=50 value="<%=product.getDescrizione()%>"></td>
		  </tr>
		  <tr>
		    <td><b>Casa Produttrice</b></td>
		    <td><input type="text" name="casaProduttrice" size=50 value="<%=product.getCasaProduttrice()%>"></td>
		  </tr>
		  <tr>
		    <td><b>Genere</b></td>
		    <td><select id="genreSelect" name="genere" autocomplete="off"> <!-- "selected" non funziona senza autocomplete="off" su Firefox -->
			    <option value="Rpg">Rpg</option>
			    <option value="Azione">Azione</option>
			  </select></td>
		  </tr>
		  <tr>
		    <td><b>Data pubblicazione</b></td>
		    <td><input type="date" name="data" value="<%=product.getDataPubblicazione()%>"></td>
		  </tr>
		 <tr>
		    <td><b>Lingua</b></td>
			<tr>
			<td></td>
				<td>
					<input type="checkbox" name="lingua" value="Italiano">
					Italiano
				</td>

			</tr>
			<tr>
				<td></td>
				<td>
					<input type="checkbox" name="lingua" value="Inglese">
					Inglese
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<input type="checkbox" name="lingua" value="Francese">
					Francese
				</td>
			</tr>

		 <tr>
		    <td><b>Piattaforma</b></td>
		    <td><select id="platformSelect" name="piattaforma">
				<option value="Ps4">Ps4</option>
				<option value="Xbox One">Xbox One</option>
				<option value="Ps3">Ps3</option>
				<option value="Xbox 360">Xbox 360</option>
			</select> </td>
		  </tr>
			<tr>
				<td><b>Presenza sottotitoli</b></td>
			<tr>
				<td></td>
				<td>
					<input type="checkbox" name="sottotitoli" value="Italiano">
					Italiano
				</td>

			</tr>
			<tr>
				<td></td>
				<td>
					<input type="checkbox" name="sottotitoli" value="Inglese">
					Inglese
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<input type="checkbox" name="sottotitoli" value="Francese">
					Francese
				</td>
			</tr>
		  <tr>
		    <td><b>Prezzo</b></td>
		    <td><input style="width: 50px" type="text" name="prezzo" value="<%=product.getPrezzo()%>"> euro</td>
		  </tr>
		  <tr>
		    <td><b>Iva</b></td>
			  <td><input style="width: 50px" type="text" name="iva" value="<%=product.getIva()%>"> %</td>
		  </tr>
		  <tr>
		    <td><h3>Prezzo Totale:</h3></td>
		    <td><%=product.getPrezzoTotale()%></td>
		  </tr>
		  <tr>
			 <td><h3>Quantità in negozio:</h3></td>
			 <td><input type="text" name="quantitaNegozio" style="width: 50px;" value="<%=product.getQuantitaNegozio()%>"></td>
		  </tr>
		  <tr>
			  <td></td>
			  <td>
				  <input type="hidden" name="id" value="<%= product.getId() %>">		   <!-- utilizzato per identificare il prodotto da cambiare-->
				  <input type="hidden" name="oldTitle" value="<%= product.getTitolo() %>"> <!-- utilizzato per cambiare il nome della cartella-->
				  <input type="submit" name="aggiorna" value="Aggiorna">
				  <input type="submit" name="elimina" value="Elimina">
			  </td>
		  </tr>
		 </table>
		</form>
	</div>

</div>

</body>

	<script src="${pageContext.request.contextPath}/scripts/jquery.js"></script> 
	<script src="${pageContext.request.contextPath}/scripts/ProdottoAdminScripts.js"></script>
	<script>

		var genre="<%=product.getGenere()%>";
		var platform="<%=product.getPiattaforma()%>";

		/*setta il default corretto della select
		* parametri : valoreDefault e ID della select*/

		changeSelectedDefault(genre,'genreSelect');
		changeSelectedDefault(platform,'platformSelect');

		/*setta checked le checkbox corrette della lingua e dei sottotitoli
		* parametri : lingua e nome dei checkbox*/
		var lingua="<%=product.getLingua()%>";
		var sottotitoli="<%=product.getSottotitoli()%>";

		changeCheckboxChecked(lingua,'lingua');
		changeCheckboxChecked(sottotitoli,'sottotitoli');

	</script>
</html>