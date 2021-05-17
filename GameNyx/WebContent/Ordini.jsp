<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.ArrayList, model.AcquistoBean"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
	table, tr, td {
  border: 1px solid black;
}

</style>

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
	<tr>
	
		<td><h2>Numero Ordine</h2></td>
		<td><h2>Data</h2></td>
		<td><h2>Prezzo</h2></td>
		<td><h2>Dettagli</h2></td>
	</tr>
		<% for(AcquistoBean e :ordini) { %>
		
	<tr>
		<td>
			<%= e.getNumeroOrdine() %>
		</td>
		
		<td>
			<%= e.getDataOrdine() %>
		</td>
		
		<td>
			<%= e.getPrezzo() %>
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