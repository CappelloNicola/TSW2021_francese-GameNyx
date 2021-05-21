<%@ page import ="java.util.ArrayList, model.PurchaseModels.ProductBean"%>
<%@ page import ="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<link rel="stylesheet" type="text/css" href="css/menu.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%
    @SuppressWarnings (value="unchecked") //per non fare comparire il warning

    ArrayList<ProductBean> products = (ArrayList<ProductBean>) request.getAttribute("products");

    if(products==null)
    {
        response.sendRedirect("./ProductsServlet");
        return;
    }
%>

<a id="carrello" style="background: #e5910b" href="Cart.jsp" target="_blank">Mostra carrello</a>

<div class="menuCentrale">

    <table>
        <tr>
            <td id="FirstRow"><h2>Titolo</h2></td>
            <td id="FirstRow"><h2>Descrizione</h2></td>
        </tr>
        <% for(ProductBean e :products) { %>

        <tr>
            <td id="tdSx">
                <% String copertina="./images/"+e.getTitolo()+"/copertina.jpg"; %>
                <img src="<%= copertina %>" width="120px">
                <h3><%= e.getTitolo()%></h3>
            </td>
            <td id="tdDx">
                <form method="get" action="ProductInfoServlet" target="_blank"> <!-- Form all'interno del ciclo per non accorpare tutti gli id nell'url -->
                    <input class="button" type="hidden" value="<%=e.getId() %>" name="productID">
                    <input class="button" type="submit" value="Dettagli">
                </form>
                <form method="get" action="AddToCartServlet" target="_self">
                    <input class="button" type="hidden" value="<%=e.getId() %>" name="productID">
                    <input class="button" type="submit" value="Aggiungi al Carrello">
                </form>
            </td>
        </tr>

        <% } %>
    </table>
</div>