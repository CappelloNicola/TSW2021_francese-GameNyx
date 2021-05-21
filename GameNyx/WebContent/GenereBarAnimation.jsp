<%@ page import="model.PurchaseModels.ProductDAO" %>
<%@ page import="model.PurchaseModels.ProductBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<style>
    #container
    {
        display: inline-block;
        margin-left: 10%;
        width: 80%;
        padding: 10px 10px 5px;
    }
    #elementGenre
    {
        padding-left: 40px;
        padding-right: 40px;
    }
    #elementGenre:hover {
        width: 80px;
        height: 80px;
        position: relative;
        animation-name: upAnimation;
        animation-duration:0.3s;           /*velocità dell'animazione*/
        animation-fill-mode: forwards;  /*blocca ultimo frame dell'animazione*/
    }

    @keyframes upAnimation {
        0%   {bottom:0px;}
        100% {bottom:10px;}

    }
</style>
<h1 style="margin-top:5%;margin-left: 40%">Generi</h1>
<div id="container">
    <img id="elementGenre" src="images/GenreBar%20icons/sword.png" width="80px">
    <img id="elementGenre" src="images/GenreBar%20icons/gun.png" width="80px">
    <img id="elementGenre" src="images/GenreBar%20icons/arcade.png" width="80px">
    <img id="elementGenre" src="images/GenreBar%20icons/map.png" width="80px">
</div>

<!--  Prototipo sort by genre servlet/javascript >
/*ProductDAO productDAO =  new ProductDAO();
   ArrayList<ProductBean> productsByGenre = productDAO.doRetrieveByGenre("RPG");

   for(ProductBean e:productsByGenre)
   {

<p> // e.getTitolo() </p>
}-->

