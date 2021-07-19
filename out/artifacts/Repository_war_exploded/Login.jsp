
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

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

		#formLogin
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


		#loginButton
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
<body>
	<%@ include file="fragments/header.jsp"%>
	<div id="formLogin">
		<form method="post" action="LoginServlet">
		<div class="formValidation">
			Username<br>
			<input class="textInputStyle" type="text" name="username">
		</div>
		<div class="formValidation">
			<br>Password<br>
			<input class="textInputStyle" type="password" name="password">
		</div>
		<%
		   //possibile implementazione : sapere se è stato sbagliato l'username o la password e mostrare l'errore
		   String error =request.getParameter("error");
		   if(error!=null)
		   {
		%>
			<p style="margin-left: 30%;color: red;font-size: 18px">Username o password errati</p>
		<%
		   }
		%>
		<input id="loginButton" type="submit" value="Accedi">
		</form>
</div>
</body>
</html>