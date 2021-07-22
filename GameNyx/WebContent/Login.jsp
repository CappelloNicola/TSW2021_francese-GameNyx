
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/loginRegister.css">
<title>Login</title>

	<style>
		body
		{
			background: #525c8e;
		}
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
			width: 30%;
			margin: auto;
			margin-top: 5%;
			background-color: #3a416a;
			border-radius: 20px;
			margin-bottom:5px;
		}

		.formValidation
		{
			margin-left: 15%;
			width: 90%;
			padding-top: 20px;
			color: white;
			font-family: "Roboto Condensed", sans-serif;
		}


		#loginButton
		{
			background-color: #1F618D;
			width: 50%;
			height: 35px;
			border: none;
			border-radius: 15px;
			color: white;
			margin-left: 23%;
			margin-top: 10%;
			/* margin: auto; */
			margin-bottom: 10%;
			cursor: pointer;
		}
		.errorText
		{
			width: 50%;
			margin: auto;
			color: red;
			margin-top: 8%;
			font-size: 18px;
		}
		
		@media screen and (max-width: 958px) {
		  #formLogin
			{
		    
		    	width: 50%;
		    
			}
		}

	</style>
</head>

	<%@ include file="fragments/header.jsp"%>
<body>
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
			<p class="errorText">Username o password errati</p>
		<%
		   }
		%>
		<input id="loginButton" type="submit" value="Accedi">
		</form>
</div>

<%@ include file="fragments/footer.jsp"%>
</body>
</html>