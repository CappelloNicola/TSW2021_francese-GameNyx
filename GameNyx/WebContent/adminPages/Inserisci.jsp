<%@ page import ="java.util.ArrayList, model.UserModels.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/MyCss.css"/>
<title>Inserisci</title>
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
	
	<div id="InsertForm">
		<form action="../InsertProductServlet" method="POST"  enctype="multipart/form-data">
			<label>Copertina: <input type="file" name="copertina" placeholder="Copertina" accept=".png, .jpg, .jpeg"/></label>
			<input type="text" name="nome" placeholder="Nome Videogioco"> 
			<textarea  cols="30" placeholder="Descrizione" name="descrizione"></textarea>
			<input type="text" name="casaProduttrice" placeholder="Software House">
			 <select name="piattaforma">
			    <option value="Ps4">Ps4</option>
			    <option value="Xbox One">Xbox One</option>
			    <option value="Ps3">Ps3</option>
			    <option value="Xbox 360">Xbox 360</option>
			  </select> 
			 <select name="genere">
			    <option value="Rpg">Rpg</option>
			    <option value="Azione">Azione</option>
			  </select>
			 <input type="text" onfocus="(this.type='date')" onblur="(this.type='text')" name="data" placeholder="Data pubblicazione" >
			 <input type="text" name="prezzo" placeholder="prezzo">
			 <input type="text" name="iva" placeholder="IVA">
			 <input type="number" name="quantitaNegozio" placeholder="quantità in negozio">
			 <fieldset>
			 <legend>Lingue</legend>
			 <table id="lingue">
			 	<tr>
			 		<td><input type="checkbox" name="lingua" value="Italiano"></td>
			 		<td><span>Italiano</span></td>
			 	</tr>
			 	<tr>
			 		<td><input type="checkbox" name="lingua" value="Inglese"></td>
			 		<td><span>Inglese</span></td>
			 	</tr>
			 	<tr>
			 		<td><input type="checkbox" name="lingua" value="Francese"></td>
			 		<td><span>Francese</span></td>
			 	</tr>
			 </table>
			 </fieldset>
			 <fieldset>
			 <legend>Sottotitoli</legend>
			 <table id="sottotitoli">
			 	<tr>
			 		<td><input type="checkbox" name="sottotitolo" value="Italiano"></td>
			 		<td><span>Italiano</span></td>
			 	</tr>
			 	<tr>
			 		<td><input type="checkbox" name="sottotitolo" value="Inglese"></td>
			 		<td><span>Inglese</span></td>
			 	</tr>
			 	<tr>
			 		<td><input type="checkbox" name="sottotitolo" value="Francese"></td>
			 		<td><span>Francese</span></td>
			 	</tr>
			 </table>
			 </fieldset>
			 
			 <input type="submit" class="dettagliButton" value="Inserisci">
			 <input type="reset" class="dettagliButton" value="Elimina">	

		</form>
	</div>
	
	
 	<script src="${pageContext.request.contextPath}/scripts/jquery.js"></script> 
	<script src="${pageContext.request.contextPath}/scripts/InserisciScripts.js"></script> 
</body>
</html>