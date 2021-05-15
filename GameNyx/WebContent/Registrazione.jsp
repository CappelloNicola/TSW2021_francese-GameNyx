<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registrazione</title>
</head>
<body>
	<form method="post" action="RegistrationServlet">
	Username
	<br>
	<input type="text" name="username">
	<br>
	Password
	<br>
	<input type="password" name="password">
	<br>
	Email
	<br>
	<input type="email" name="email">
	<br>
	Nome
	<br>
	<input type="text" name="nome">
	<br>
	Cognome
	<br>
	<input type="text" name="cognome">
	<br>
	Data di nascita
	<br>
	<input type="date" name="nascita"> <!-- Restituisce nel formato AAAA-MM-GG -->
	<br>
	Telefono
	<br>
	<input type="number" size="12" name="telefono">
	<br>
	
	<input type="submit" value="Registrati">
</form>
</body>
</html>