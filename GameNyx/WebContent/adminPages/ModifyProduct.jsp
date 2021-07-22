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
		<form action="ModifyProductServlet" method="POST" enctype="multipart/form-data">
		<table>
		  <tr>
			<td><b>In Catalogo</b></td>
			<td><label>S&igrave; <input id="inCatalogoTrue" type="radio" name="inCatalogo" value="si"> </label>
				<label>No <input id="inCatalogoFalse" type="radio" name="inCatalogo" value="no"> </label>
			</td>
		  </tr>
		  <tr>
			<td><b>URL Trailer</b></td>
			<td><input type="text" name="trailer" value="<%=product.getTrailerURL()%>"></td>
		  </tr> 
		  <tr>
			<td><b>Cambia copertina</b></td>
			<td><input type="file" id="copertina" name="copertina" placeholder="Copertina" accept=".jpg"/></td>
		  </tr>
		  <tr>
		    <td><b>Titolo</b></td>
		    <td><input type="text" name="titolo" size=30 value="<%=product.getTitolo() %>"></td>
		  </tr>
		  <tr>
		    <td><b>Descrizione</b></td>
		    <td><textarea  rows="20" cols="30" name="descrizione" maxlength="800"><%=product.getDescrizione()%></textarea></td>
		  <!--   <td><input type="text" name="descrizione" size=50 value="<%=product.getDescrizione()%>"></td>-->
		  </tr>
		  <tr>
		    <td><b>Casa Produttrice</b></td>
		    <td><input type="text" name="casaProduttrice" size=30 value="<%=product.getCasaProduttrice()%>"></td>
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
			 <td>
				 <select id="platformSelect" name="piattaforma" autocomplete="off">
				 <option value="Ps4">Ps4</option>
				 <option value="Xbox One">Xbox One</option>
				 <option value="Ps3">Ps3</option>
				 <option value="Xbox 360">Xbox 360</option>
				 <option value="Nintendo Switch">Nintendo Switch</option>
				 </select>
			 </td>
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
			  <td><input id="priceForAdmin" style="width: 50px" type="text" name="prezzo" value="<%=product.getPrezzo()%>" onblur="changePrice()"> euro</td>
		  </tr>
		  <tr>
		    <td><b>Iva</b></td>
			  <td><input id="ivaForAdmin" style="width: 50px" type="text" name="iva" value="<%=product.getIva()%>" onblur="changePrice()"> %</td>
		  </tr>
		  <tr>
		    <td><h3>Prezzo Totale:</h3></td>
			  <td><span id="totalPriceForAdmin"><%=product.getPrezzoTotale()%></span></td>
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

	<script src="${pageContext.request.contextPath}/scripts/jquery.js"></script> 
	<script src="${pageContext.request.contextPath}/scripts/ProdottoAdminScripts.js"></script>
	
	<script>
	
	
	$(document).ready(function(){
		/*Cambio gli option*/
		changeSelectedDefault("<%=product.getGenere()%>", "genreSelect");
		changeSelectedDefault("<%=product.getPiattaforma()%>", "platformSelect");


		var lingua="<%=product.getLingua()%>";
		var sottotitoli="<%=product.getSottotitoli()%>";
		var inCatalogo=<%=product.getInCatalogo()%>;
		

		/*suddivido lingue e sottotitoli in array*/
		const linguaArray = lingua.split(",");
		const sottotitoliArray = sottotitoli.split(",");

		/*chiamo le funzioni per spuntare i boxes*/
		checkBoxes(linguaArray, "lingua");
		checkBoxes(sottotitoliArray, "sottotitoli");
		checkRadio(inCatalogo);
		});
	
	

	</script>
</body>

	
	
</html>