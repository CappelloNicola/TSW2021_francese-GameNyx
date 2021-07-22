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
		<form name="inserisciProdotto" onSubmit="return formValidation();" action="../InsertProductServlet" method="POST"  enctype="multipart/form-data">
			<div class="formValidationCopertina">
				<label>Copertina: <input type="file" id="copertina" name="copertina" placeholder="Copertina" accept=".png, .jpg, .jpeg"/></label>
			</div>
			<div class="formValidation"> <!-- VALIDARE CON ESPRESSIONI REGOLARI -->
				<input type="text" id="trailer" name="trailer"  maxlength="800" placeholder="Trailer">
			</div>
			<div class="formValidation"> <!-- ci sono titoli di giochi con 3 caratteri : fez -->
				<input type="text" id="titolo" name="nome"  maxlength="80" placeholder="Nome Videogioco">
			</div>
			<div class="formValidation">
			<textarea  rows="20" cols="30" placeholder="Descrizione" id="descrizione" name="descrizione" maxlength="800"></textarea>
			</div>
			<div class="formValidation">
			<input type="text" name="casaProduttrice" id="casaProduttrice" minlength="8" maxlength="100" placeholder="Software House">
			</div>
			<div class="formValidation">
			 <select name="piattaforma" id="piattaforma">
			    <option value="Ps4">Ps4</option>
			    <option value="Xbox One">Xbox One</option>
			    <option value="Ps3">Ps3</option>
			    <option value="Xbox 360">Xbox 360</option>
				 <option value="Nintendo Switch">Nintendo Switch</option>
			  </select>
			</div>
			<div class="formValidation">
			 <select name="genere">
			    <option value="Rpg">Rpg</option>
			    <option value="Azione">Azione</option>
			  </select>
			</div>
			<div class="formValidation">
			 <input type="text" id="data" onfocus="(this.type='date')" onblur="(this.type='text')" name="data" min="1980-04-01" max="2030-12-31" placeholder="Data pubblicazione" >
			</div>
			<div class="formValidation">
				<input type="text" id="prezzo" name="prezzo" placeholder="prezzo">
			</div>
			<div class="formValidation">
			 <input type="number" id="IVA" name="iva" placeholder="IVA" min="0" max="100">
			</div>
			<div class="formValidation">
			 <input type="number" id="quantitaNegozio" name="quantitaNegozio" placeholder="quantità in negozio" min="1" max="10000">
			</div>
			<div id="lingua">
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
			</div>
			<div id="sottotitoli">
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
			</div>
			 <input type="submit" class="dettagliButton" value="Inserisci">
			 <input type="reset" class="dettagliButton" value="Elimina">	

		</form>
	</div>
	
	
 	<script src="${pageContext.request.contextPath}/scripts/jquery.js"></script> 
	<script src="${pageContext.request.contextPath}/scripts/InserisciScripts.js"></script>

</body>
</html>