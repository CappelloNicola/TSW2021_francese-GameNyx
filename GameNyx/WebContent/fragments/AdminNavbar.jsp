<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/MyCss.css"/>
  
  <!-- Aggiungere JS per rendere li di classe active -->
	<!-- Inserire ricerca di un prodotto in Catalogo -->
	<!-- Inserire ricerca degli ordini -->
	<nav id="adminNav"><ul>
	  <li id="liCatalogo"><a href="../adminPages/Catalogo.jsp">Catalogo</a></li>
	  <li id="liInserisci"><a href="../adminPages/Inserisci.jsp">Inserisci Prodotto</a></li>
	  <li id="liOrdini"><a href="../adminPages/OrdiniAdmin.jsp">Ordini</a></li>
	  <li style="float:right"><a href="../LogoutServlet">Logout</a></li>
	</ul></nav>
	
	