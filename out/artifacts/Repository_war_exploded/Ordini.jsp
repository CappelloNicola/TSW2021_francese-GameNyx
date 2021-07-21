<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.ArrayList, model.PurchaseModels.AcquistoBean"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


<title>Ordini</title>
</head>
<body>
	
	<%
		ArrayList<AcquistoBean> ordini=(ArrayList<AcquistoBean>)request.getAttribute("ordini");

		if(ordini==null)
		{
		
	%>
			<p>Nessun&apos;ordine effettuato</p>
	<%
			return;
		}
	%>

<table>
	<tr style="background: rgba(94,93,93,0.85)">
		<td><h2>Data</h2></td>
		<td><h2>Prezzo</h2></td>
		<td><h2>Dettagli</h2></td>
	</tr>
		<% for(AcquistoBean e :ordini) { %>
		
	<tr>
		<td>
			<%= e.getDataOrdine() %>
		</td>
		
		<td>
			<%= e.getPrezzo() %> &euro;
		</td>

		<td>
		<form method="get" action="OrderInfoServlet" target="_blank">
			<input type="hidden" value="<%=e.getNumeroOrdine() %>" name="numeroOrdine">
			<input type="submit" value="Dettagli">
		</form>
		</td>	
	</tr>
		
	<% } %>
</table>

</body>
</html>