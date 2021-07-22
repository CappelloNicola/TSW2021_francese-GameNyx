<%@ page import="model.PurchaseModels.ProductDAO" %>
<%@ page import="model.PurchaseModels.ProductBean" %>
<%@ page import="java.util.ArrayList" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<link rel="stylesheet" type="text/css" href="css/menu.css">


<body class="menuBackground">
<div id="slideShowSwitchContainer">
    <p id="slideShowTitle">Giochi del momento</p>

    <img id="leftJoycon" src="./images/icons/joyconLeftSide.png">
    <img id="rightJoycon" src="./images/icons/joyconRightSide.png">

    <!-- Il link per la reidirezione (productID) e la copertina vengono messe manualmente-->
    <div class="slideshow-container">

        <div class="mySlides fade" style="display: none;">
            <a style="text-decoration: none;" href="ProductInfoServlet?productID=14"><img src="./images/SlideshowImages/ds2slideshow.jpg"></a>
        </div>

        <div class="mySlides fade" style="display: none;">
            <a style="text-decoration: none;" href="ProductInfoServlet?productID=3"><img src="./images/SlideshowImages/ac2slideshow.jpg"></a>
        </div>

        <div class="mySlides fade" style="display: block;">
            <a style="text-decoration: none;" href="ProductInfoServlet?productID=2"><img src="./images/SlideshowImages/rdr2slideshow.jpg"></a>
        </div>

        <a class="prev" onclick="plusSlides(-1)">&#10094</a>
        <a class="next" onclick="plusSlides(1)">&#10095</a>

    </div>
</div>


<div class="centralDiv">
    <div class="barraGeneri">
        <div id="upBar">
            <div class="upBarIconsContainer">
            <a href="?genere=Avventura#upBar">
            <span class="genreButton zoom">
                <img class="elementGenre" src="./images/GenreBar%20icons/adventureIcon.png" >
                <p>AVVENTURA</p>
            </span>
            </a>
            <a href="?genere=Azione#upBar">
            <span class="genreButton zoom">
                <img class="elementGenre" src="./images/GenreBar%20icons/FPSicon.png" >
                <p>AZIONE</p>
            </span>
            </a>
            <a href="?genere=Sport#upBar">
            <span class="genreButton zoom">
                <img class="elementGenre" src="./images/GenreBar%20icons/RacingIcon.png" >
                <p>SPORTIVI</p>
            </span>
            </a>
            <a href="?genere=RPG#upBar">
            <span class="genreButton zoom">
                <img class="elementGenre" src="./images/GenreBar%20icons/rpgIcon.png">
                <p>DI RUOLO</p>
            </span>
            </a>
            <a href="?genere=Puzzle#upBar">
            <span class="genreButton zoom" >
                <img class="elementGenre" src="./images/GenreBar%20icons/puzzleIcon.png">
                <p>STRATEGICI</p>
            </span>
            </a>
            <a href="?genere=Platform#upBar">
            <span class="genreButton zoom">
                <img class="elementGenre" src="./images/GenreBar%20icons/platformIcon.png">
                <p>PLATFORM</p>
            </span>
            </a>
        </div>
        </div>
        <div id="downBar">
            <a href="?vendite#upBar">
                <span class="ordinaButton">
                    Più venduti
                </span>
            </a>
            <a href="?nuovi#upBar">
                <span class="ordinaButton">
                    Ultime uscite
                </span>
            </a>
            <a href="?prezzo#upBar">
                <span class="ordinaButton">
                    Prezzo minore
                </span>
            </a>
        </div>
    </div>

    <div id="showGamesBackground">
        <div id="showGamesContainer">

            <%
                ArrayList<ProductBean> products = new ArrayList<>();
                ProductDAO productDAO = new ProductDAO();

                try {


                    if (request.getParameter("vendite") != null)
                    {
                        products = productDAO.doRetrieveByNumeroVendite();
                    }
                    else if(request.getParameter("nuovi")!=null)
                    {
                        products = productDAO.doRetrieveByDateDESC();
                    }
                    else if(request.getParameter("prezzo")!=null)
                    {
                        products = productDAO.doRetrieveByPrice();
                    }
                    else if(request.getParameter("genere")!=null)
                    {
                        products = productDAO.doRetrieveByGenre(request.getParameter("genere"));
                    }
                    else
                    {
                        products = productDAO.doRetrieveByNumeroVendite();
                    }

                }catch (Exception e)
                {
                    e.printStackTrace();
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
</body>
<script src="${pageContext.request.contextPath}/scripts/jquery.js"></script>
<script src="${pageContext.request.contextPath}/scripts/menuScripts.js"></script>
