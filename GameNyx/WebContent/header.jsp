<%@ page import="model.UserModels.UserBean" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<link rel="stylesheet" type="text/css" href="css/header.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<div class="header">
    <div id="logo">GameNyx</div>

<%
    if(session.getAttribute("currentUserSession")!=null)
    {
%>
        <% UserBean user = (UserBean) session.getAttribute("currentUserSession");%>

        <a id="headerbuttons" href="LogoutServlet">Logout</a>
        <a id="headerbuttons" style="background: #229954" href="GetOrdersServlet">Ordini</a>

        <!-- Implementare profilo -->
        <div id="user">
           <font color="black" size="3px">logged as</font> <%=user.getUsername()%>
        </div>
<%
}
    else
    {
    %>
        <a id="signup" href="Registrazione.jsp">Sign up</a>
        <a id="headerbuttons" href="Login.jsp">Login</a>
    <%
    }
%>

</div>