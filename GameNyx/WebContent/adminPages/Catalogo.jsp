<%@ page import ="java.util.ArrayList, model.UserModels.UserBean, model.PurchaseModels.ProductBean, model.PurchaseModels.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/MyCss.css"/>
<title>Catalogo</title>
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
	<%
		ProductDAO dao=new ProductDAO();
		ArrayList <ProductBean> catalogo=dao.doRetrieveAll(null);
	%>
	
	<div id="divCatalogo">

    <table id="tableCatalogo">
        
        <% for(ProductBean e :catalogo) { %>

        <tr>
            <td rowspan="3">
                <% String copertina=request.getContextPath()+"/images/"+e.getTitolo()+"/copertina.jpg"; %>
                <img class="copertina" src="<%= copertina %>" width="120px">
            </td>
            <td>
                <span id="gameTitle" > <%= e.getTitolo()%> </span>
            </td>
        </tr>
        <tr>
        	<td>	
        		<%
        			boolean isInCatalogo=e.getInCatalogo();
        			String inCatalogo="";
        			if(isInCatalogo)
        			{
        				inCatalogo="In catalogo";
        			}
        			else
        			{
        				inCatalogo="Non in catalogo";
        			}

        		%>
        		<span><%= inCatalogo %></span>
        	</td>
        </tr>
        <tr>
            <td>
                <form id="dettagliForm" method="get" action="../ProductInfoServlet" target="_blank"> <!-- Form all'interno del ciclo per non accorpare tutti gli id nell'url -->
                    <input type="hidden" value="<%=e.getId() %>" name="productID">
                    <input class="dettagliButton" type="submit" value="Dettagli">
                </form>
            </td>
        </tr>
      

        <% } %>
    </table>
</div>
	
	
 	<script src="${pageContext.request.contextPath}/scripts/jquery.js"></script> 
	<script src="${pageContext.request.contextPath}/scripts/CatalogoScripts.js"></script> 
</body>
</html>