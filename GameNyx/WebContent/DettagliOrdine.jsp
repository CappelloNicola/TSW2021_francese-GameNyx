<%@ page import="model.PurchaseModels.AcquistoBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.PurchaseModels.ProductBeanCart" %>
<%@ page import="model.PurchaseModels.ProductBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Dettagli</title>
    <link rel="stylesheet" type="text/css" href="css/OrderDetails.css">
</head>
<body>

<% AcquistoBean ordine = (AcquistoBean) request.getAttribute("dettagliOrdine");  %>

<h1>Dettagli ordine</h1>
<div id="main-box">
  <div id="labels" class="container">
    Numero ordine <br><br>
    Stato <br><br>
    Prezzo totale <br><br>
    Indirizzo spedizione<br><br>
    Data ordinazione <br><br>
  </div>

  <div id="info" class="container">

    <%=ordine.getNumeroOrdine()%><br><br>
    <%=ordine.getStato()%><br><br>
    <%=ordine.getPrezzo()%><br><br>
    <%=ordine.getIndirizzo()%><br><br>
    <%=ordine.getDataOrdine()%><br><br>

  </div>

  <div id="videogames" class="container">
    <h3>Videogiochi acquistati</h3>
    <% ArrayList<ProductBeanCart> videogiochiOrdine =  ordine.getVideogiochi();

      int i=0;
      for(ProductBean videogioco:videogiochiOrdine){
    %>
    <%
      String copertina="./images/"+videogioco.getTitolo()+"/copertina.jpg"; %>
      <!-- Copertine cliccabili anche dai dettagli degli ordini che portano alle informazioni sul gioco-->
      <a style="text-decoration: none;" href="ProductInfoServlet?productID=<%=videogioco.getId()%>" target="_blank"><img id="copertine" src="<%= copertina %>" width="100px"></a>

    <!-- Mostra la quantità acquistata per ogni prodotto (utilizza un indice i che scorre l'arrayList) -->
      <div id="quantità"> Quantità : <%= ordine.getVideogiochi().get(i).getCartQuantity()%></div>

    <%
        i++;
      }
    %>

  </div>
</div>

</body>
</html>
