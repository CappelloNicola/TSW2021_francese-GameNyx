<%@ page import="model.UserModels.UserBean" %>
<%@ page import="model.PurchaseModels.AcquistoDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.PurchaseModels.ProductBean" %>
<%@ page import="model.PurchaseModels.ProductBeanCart" %>
<%@ page import="model.PurchaseModels.AcquistoBean" %>
<%@ page import="java.sql.SQLException" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/GameNyx/css/profiloCss.css">
<title>Profilo</title>

<link rel="stylesheet" type="text/css" href="css/MyCss.css">
<link rel="stylesheet" type="text/css" href="css/profilo.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<%@ include file="fragments/header.jsp"%>

<% UserBean user = (UserBean) session.getAttribute("currentUserSession");
    AcquistoDAO dao = new AcquistoDAO();
    ArrayList<AcquistoBean> orders = new ArrayList<>();
    try {
         orders = dao.doRetrieveByUser(user.getUsername());
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }

%>

<div class="topContainer">
    <div class="userTopInfoContainer">
        <img id="proPic" src="images/icons/proPicExample.jpg">
        <div class="userTopInfo">
            <p id="username"><%=user.getUsername()%></p>
                <div id="livello">Livello 16</div>
                <div id="barraEspEsterna">
                <div id="barraEspInterna" style="width: 80%;">
                </div></div>
        </div>
    </div>
</div>

<div class="centralDiv">
    <div class="profileButtons">
        <a href="Profile.jsp?informazioni">Profilo</a>
        <a href="index.jsp#upBar">Catalogo</a>
        <a href="GetOrdersServlet">Tutti gli ordini</a>
    </div>

    <div class="centralDivContainer">

        <% if(request.getAttribute("ordini")!=null && request.getParameter("informazioni")==null)
           {
        %>
        <%
            ArrayList<AcquistoBean> ordini=(ArrayList<AcquistoBean>)request.getAttribute("ordini");

            if(ordini==null)
            {

        %>
            <p>Nessun&apos;ordine effettuato</p>
        <%
                return;
            }
        %>

        <table class="orderDetailsTable">
            <tr style="background: #3a416a">
                <td><h2>Data</h2></td>
                <td><h2>Prezzo</h2></td>
                <td><h2>Dettagli</h2></td>
            </tr>
            <% for(AcquistoBean e :ordini) { %>

            <tr>
                <td>
                    <%= e.getDataOrdine() %>
                </td>

                <td>
                    <%= e.getPrezzo() %> &euro;
                </td>

                <td style="width: 30%">
                    <form method="get" action="OrderInfoServlet">
                        <input type="hidden" value="<%=e.getNumeroOrdine() %>" name="numeroOrdine">
                        <input class="dettagli" type="submit" value="Dettagli">
                    </form>
                </td>
            </tr>

            <% } %>
        </table>

        <%
            return;
           }

            if(request.getParameter("numeroOrdine")!=null)
            {
        %>

        <% AcquistoBean ordine = (AcquistoBean) request.getAttribute("dettagliOrdine");  %>

        <h1 style="color: white">Dettagli ordine</h1>
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
                <div id="quantità"> Quantita' : <%= ordine.getVideogiochi().get(i).getCartQuantity()%></div>

                <%
                        i++;
                    }
                %>

            </div>
        </div>

        <%
                 return;
            }

        %>

        <div class="informationsContainer">
            <div class="informations">
                <p class="titolo">Informazioni</p>
                <p>
                    <span class="label">Username</span><span class="info"><%=user.getUsername()%></span>
                </p>
                <p>
                    <span class="label">Nome</span><span class="info"><%=user.getUsername()%></span>
                </p>
                <p>
                    <span class="label">Cognome</span><span class="info"><%=user.getCognome()%></span>
                </p>
                <p>
                    <span class="label">Email</span><span class="info"><%=user.getEmail()%></span>
                </p>
                <p>
                    <span class="label">Telefono</span><span class="info"><%=user.getTelefono()%></span>
                </p>
                <p>
                    <span class="label">Data di nascita</span><span class="info"><%=user.getDataNascita()%></span>
                </p>

            </div>
        </div>
        <div class="lastOrdersContainer">
            <div class="lastOrders">
                <p class="titolo">Ordini in arrivo</p>
                <div class="ordersContainer">
                    <% int i=0;
                        if(orders==null){
                    %>
                        <p>Nessun ordine</p>
                    <%
                            return;
                        }

                        for(AcquistoBean e:orders)
                    {
                        if(e.getStato().equals("ordinato") && i<3)
                        {
                    %>
                        <div class="order">
                            <img width="80px" src="./images/<%=e.getVideogiochi().get(0).getTitolo()%>/copertina.jpg">
                            <p style="color:greenyellow;"><%=e.getStato()%></p>
                            <p style="color: white"><%=e.getPrezzo()%> euro</p>

                        </div>
                    <%
                            i++;
                        }
                    }

                    %>
                </div>
            </div>
        </div>
    </div>


</div>




<%@ include file="fragments/footer.jsp"%>

<script src="/GameNyx/scripts/ProfiloScripts.js"></script>

<script>

    //funzione che prende la quantitÃ&nbsp; dei giochi acquistati dall'utente e aumenta il livello e la percentuale dei punti xp
    //sulla base di esso
    //futura implementazione : sconto in base al livello
    var quantity = <%=request.getAttribute("quantity")%>
    avanzamentoBarraEsperienza(quantity);

</script>