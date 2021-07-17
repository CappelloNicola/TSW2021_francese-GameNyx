<%@ page import="model.PurchaseModels.ProductDAO" %>
<%@ page import="model.PurchaseModels.ProductBean" %>
<%@ page import="java.util.ArrayList" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<link rel="stylesheet" type="text/css" href="css/menu.css">

<style>
   .productElement
   {
       display: inline-block;
       width: 200px;
       margin-left: 5%;
       margin-top: 40px;
   }
   #showGamesBackground
   {
       position: absolute;
       background-color: #525c8e;
       margin-top: -40px;
       width: 100%;
       height: 100%;
   }
   #showGamesContainer
   {
       padding-top: 10%;
       width: 80%;
       margin: auto;
   }

   #copertina
   {
       text-align: center;
       width: 120px;
   }
   #copertina img
   {
       width: 200px;
       height: 246px;
   }
   #prezzo
   {
       height: 30px;
       line-height: 30px;
       text-align: center;
       color: white;
   }

   #titolo
   {
       height: 30px;
       padding: 15px;
       text-align: center;
       margin: 0;
       color: white;
       font-family: "Roboto Condensed", sans-serif;
   }

   a
   {
       text-decoration: none;
       color: white;
       font-family: "Roboto Condensed", sans-serif;
   }
   a:visited
   {
       text-decoration: none;
       color: white;
       font-family: "Roboto Condensed", sans-serif;
   }

   #copertinaDiv
   {

   }

   #informazioniDiv
   {
       margin: 0;
       background: #3a416a;
   }

   .addToCart
   {
       height: 30px;
       width: 150px;
       background-color: #04AA6D;
       border-color: #04AA6D;
       font-weight: bold;
       margin-left: 25px;
       margin-top: 10px;
       margin-bottom: 20px;
       border: none;
       cursor: pointer;
   }
   .ordinaButton
   {
       margin-left: 13%;
   }
</style>

<div id="slideShowSwitchContainer">
    <p id="slideShowTitle">Giochi del momento</p>

    <img id="leftJoycon" src="./images/icons/joyconLeftSide.png">
    <img id="rightJoycon" src="./images/icons/joyconRightSide.png">

    <!-- Il link per la reidirezione (productID) e la copertina vengono messe manualmente-->
    <div class="slideshow-container">

        <div class="mySlides fade" style="display: none;">
            <a style="text-decoration: none;" href="ProductInfoServlet?productID=14" target="_blank"><img src="./images/SlideshowImages/ds2slideshow.jpg" style="width:100%;margin-top: 2px;"></a>
        </div>

        <div class="mySlides fade" style="display: none;">
            <a style="text-decoration: none;" href="ProductInfoServlet?productID=3" target="_blank"><img src="./images/SlideshowImages/ac2slideshow.jpg" style="width:100%;margin-top: 2px;"></a>
        </div>

        <div class="mySlides fade" style="display: block;">
            <a style="text-decoration: none;" href="ProductInfoServlet?productID=2" target="_blank"><img src="./images/SlideshowImages/rdr2slideshow.jpg" style="width:100%;margin-top: 2px;"></a>
        </div>

        <a class="prev" onclick="plusSlides(-1)">&#10094</a>
        <a class="next" onclick="plusSlides(1)">&#10095</a>

    </div>
</div>

<!-- TODO Implementazione possibile : AJAX o JS così da non dover ricaricare la pagina-->


<div class="centralDiv">
    <div class="barraGeneri">
        <h1 style="margin-left: 8%;">Generi</h1>
        <div id="upBar">
            <a href="?genere=Avventura#upBar">
            <span style="margin-left: 10%" class="genreButton">
                <img id="elementGenre" src="./images/GenreBar%20icons/adventureIcon.png" width="80px">
                <p>AVVENTURA</p>
            </span>
            </a>
            <a href="?genere=Azione#upBar">
            <span class="genreButton">
                <img id="elementGenre" src="./images/GenreBar%20icons/FPSicon.png" width="80px">
                <p>AZIONE</p>
            </span>
            </a>
            <span class="genreButton">
                <img id="elementGenre" src="./images/GenreBar%20icons/RacingIcon.png" width="80px">
                <p>SPORTIVI</p>
            </span>
            <a href="?genere=RPG#upBar">
            <span class="genreButton">
                <img id="elementGenre" src="./images/GenreBar%20icons/rpgIcon.png" width="80px">
                <p>DI RUOLO</p>
            </span>
            </a>
            <span class="genreButton">
                <img id="elementGenre" src="./images/GenreBar%20icons/puzzleIcon.png" width="80px">
                <p>STRATEGICI</p>
            </span>
            <span class="genreButton">
                <img id="elementGenre" src="./images/GenreBar%20icons/simulazioneIcon.png" width="80px">
                <p>SIMULAZIONE</p>
            </span>
        </div>
        <div id="downBar">
            <a href="?vendite#upBar">
                <span class="ordinaButton">
                    Più venduti
                </span>
            </a>
            <a href="?popolari#upBar">
                <span class="ordinaButton">
                    Più popolari
                </span>
            </a>
            <a href="?ordina#upBar">
                <span class="ordinaButton">
                    Ordina per
                </span>
            </a>
        </div>
    </div>

    <div id="showGamesBackground">
        <div id="showGamesContainer">

        <%
            ArrayList<ProductBean> products = new ArrayList<>();
            ProductDAO productDAO = new ProductDAO();

            if(request.getParameter("genere")==null || request.getParameter("vendite")!=null)
            {

               products = productDAO.doRetrieveByNumeroVendite();
            }
            else
            {
               products = productDAO.doRetrieveByGenre(request.getParameter("genere"));
            }
        %>

        <%
           for(ProductBean e:products)
           {

        %>

            <div class="productElement">
                <div id="copertinaDiv">
                <a style="text-decoration: none" href="ProductInfoServlet?productID=<%=e.getId()%>" target="_blank">
                    <% String copertina=request.getContextPath()+"/images/"+e.getTitolo()+"/copertina.jpg"; %>
                    <div id="copertina"><img src="<%= copertina %>"></div>
                </a>
                </div>
                <div id="informazioniDiv">
                    <p id="titolo"><%=e.getTitolo()%></p>
                    <p id="prezzo">
                        <%=e.getPrezzo()%> euro
                    </p>

                <form method="get" action="AddToCartServlet" target="_self">
                    <input class="addToCart" type="hidden" value="<%=e.getId() %>" name="productID">
                    <input class="addToCart" type="submit" value="Aggiungi al Carrello">
                </form>
                </div>
            </div>

        <%
           }
        %>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/scripts/jquery.js"></script>
<script src="/GameNyx/scripts/menuScripts.js"></script>

<script>

    //Evidenziamento del prodotto al passaggio del mouse
    $(function() {
        $(".productElement").hover(function () {
            this.style.boxShadow="0 4px 8px 0 rgb(255 255 255 / 30%), 0 6px 20px 0 rgb(255 255 255 / 30%)";
        }).mouseleave(function (){
            this.style.boxShadow="none";
        });

    });
</script>