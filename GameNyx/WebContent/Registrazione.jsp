<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registrazione</title>

<!-- da accorpare in un unico file css -->
<style>
	.textInputStyle
	{
		width: 75%;
		padding: 5px 5px;
		margin: 8px 0;
		display: inline-block;
		border: 1px solid #ccc;
		border-radius: 4px;
		box-sizing: border-box;

	}

	#formRegistrazione
	{
		position: relative;
		width: 25%;
		left: 35%;
		margin-top:5%;
		background-color: #3a416a;
		border-radius: 50px;
	}

	.formValidation
	{
		margin-left: 20%;
		padding-top: 20px;
		color: white;
		font-family: Arial;
	}

	#registratiButton
	{
		background-color: #1F618D;
		width: 200px;
		height: 40px;
		border: none;
		border-radius: 15px;
		color: white;
		margin-left: 30%;
		margin-top: 10%;
		margin-bottom:10% ;
		cursor: pointer;
	}

</style>
</head>
<!-- TODO migliorare i placeholder-->
<body>
<%@ include file="fragments/header.jsp"%>
	<div id="formRegistrazione">
		<form method="post" name="registrazione" onSubmit="return formValidation();" action="RegistrationServlet" >
		<div class="formValidation">
			Username
			<br>
			<input class="textInputStyle" type="text" id="username" name="username" onClick="resetField(this.id);" placeholder="No special characters">
			<br>
			<small></small>
		</div>
		<div class="formValidation">
			Password
			<br>
			<input class="textInputStyle" type="password" id="password" name="password" onClick="resetField(this.id);" placeholder="At least 1 upper case and number">
			<br>
			<small></small>
		</div>
		<div class="formValidation">
			Email
			<br>
			<input class="textInputStyle" type="text" id="email" name="email" onClick="resetField(this.id);" placeholder="example@gmail.it">
			<br>
			<small></small>
		</div>
		<div class="formValidation">
			Nome
			<br>
			<input class="textInputStyle" type="text" id="nome" name="nome" onClick="resetField(this.id);" placeholder="No special characters or numbers">
			<br>
			<small></small>
		</div>
		<div class="formValidation">
			Cognome
			<br>
			<input class="textInputStyle" type="text" id="cognome" name="cognome" onClick="resetField(this.id);" placeholder="No special characters or numbers">
			<br>
			<small></small>
		</div>
		<div class="formValidation">
			Data di nascita
			<br>
			<input class="textInputStyle" type="date" id="data" name="dataNascita" onClick="resetField(this.id);">
			<br>
			<small></small>
		</div>
		<div class="formValidation">
			Telefono
			<br>
			<input class="textInputStyle" type="text" id="telefono" name="telefono" onClick="resetField(this.id);" placeholder="10 numbers required">
			<br>
			<small></small>
		</div>

		<%
			String error = request.getParameter("error");
			if(error!=null)
			{
		%>
			<p style="margin-left: 20%;color: red;font-size: 18px">Email o Username già presenti sul sito</p>
		<%
			}
		%>
		<input id="registratiButton" type="submit" value="Registrati">
	</form>
</div>

	<script src="${pageContext.request.contextPath}/scripts/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/RegistrazioneScripts.js"></script>
</body>
</html>