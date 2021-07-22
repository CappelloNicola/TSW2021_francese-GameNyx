<%@ page import ="java.util.ArrayList, model.UserModels.UserBean"%>
<%@ page import="model.PurchaseModels.AcquistoBean" %>
<%@ page import="model.PurchaseModels.ProductBean" %>
<%@ page import="model.PurchaseModels.ProductBeanCart" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/MyCss.css"/>
<title>Ordini</title>

	<style>
		table
		{
			width:50%;
		}
	
		td
		{
			border: 1px solid black;
			padding: 10px 10px 10px;
			width: 100px;
			height: 30px;
			text-align: center;
		}
		tr:nth-child(even)
		{
			background: #EEEEEE;
		}

	</style>
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
	
	<%@ include file="../fragments/AdminNavbar.jsp" %>

	<div id="controlliSort">
		<input type="button" id="perData" class="buttonSort" value="Ordina per data">
		<input type="button" id="perNominativo" class="buttonSort" value="Ordina per nominativo">

		<form action="${pageContext.request.contextPath}/ViewOrdersServlet" method="POST">
			<input class="orderByDate textDesign" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" name="dataInizio" placeholder="Data di inizio" >
			<input class="orderByDate textDesign" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" name="dataFine" placeholder="Data di fine" >

			<input id="utente" class="textDesign" name="utente" type="text" placeholder="Nominativo utente">
			<input id="mostra" type="submit" name="mostra" value="Mostra">
		</form>
	</div>

	<table id="tableOrdiniAdmin">
		<tr style="background: rgba(94,93,93,0.85)">
			<td><h2>Utente</h2></td>
			<td><h2>Indirizzo</h2></td>
			<td><h2>Stato</h2></td>
			<td><h2>Data ordine</h2></td>
			<td><h2>Prezzo totale</h2></td>
			<td colspan="100%"><h2>Acquisti</h2></td>
		</tr>

		<%
		ArrayList<AcquistoBean> ordini = (ArrayList<AcquistoBean>) request.getAttribute("ordini");

		if(ordini!=null)
		{
			for(AcquistoBean e:ordini)
			{
		%>
						<tr>
							<td>
								<%= e.getUtente() %>
							</td>
							<td>
								<%= e.getIndirizzo() %>
							</td>
							<td>
								<%= e.getStato() %>
							</td>
							<td>
								<%= e.getDataOrdine() %>
							</td>

							<td>
								<%= e.getPrezzo() %> &euro;
							</td>
							<% ArrayList<ProductBeanCart> videogiochiOrdine =  e.getVideogiochi();

								int i=0;
								for(ProductBean videogioco:videogiochiOrdine){
							%>
							<%
								String copertina="./images/"+videogioco.getTitolo()+"/copertina.jpg";
							%>
							<!-- Copertine cliccabili anche dai dettagli degli ordini che portano alle informazioni sul gioco-->
							<td><a style="text-decoration: none;" href="ProductInfoServlet?productID=<%=videogioco.getId()%>" target="_blank"><img id="copertine" src="<%= copertina %>" width="80px"></a></td>
							<%
							}
							%>
						</tr>

		<%
			}
		}
		%>
	</table>
	
	
 	<script src="${pageContext.request.contextPath}/scripts/jquery.js"></script> 
	<script src="${pageContext.request.contextPath}/scripts/OrdiniAdminScripts.js"></script>

	<!-- Gestione bottoni visualizzazione ordini -->
	<script>
		$(".orderByDate").hide();
		$("#utente").hide();
		$("#mostra").hide();

		$(document).ready(function () {
			$("#perData").click(function () {
				$(".orderByDate").show();
				$("#utente").hide();
				$("#mostra").show();
			});

			$("#perNominativo").click(function () {
				$("#utente").show();
				$(".orderByDate").hide();
				$("#mostra").show();
			});

		});
	</script>
</body>
</html>