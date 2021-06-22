<%@ page import ="java.util.ArrayList, model.UserModels.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/MyCss.css"/>
<title>Ordini</title>
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
	

	
	
 	<script src="${pageContext.request.contextPath}/scripts/jquery.js"></script> 
	<script src="${pageContext.request.contextPath}/scripts/OrdiniAdminScripts.js"></script> 
</body>
</html>