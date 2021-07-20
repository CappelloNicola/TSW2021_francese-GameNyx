<%@ page import="model.UserModels.UserBean" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/GameNyx/css/profiloCss.css">
<title>Profilo</title>

<link rel="stylesheet" type="text/css" href="css/MyCss.css">
<link rel="stylesheet" type="text/css" href="css/profilo.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%@ include file="fragments/header.jsp"%>

<% UserBean user = (UserBean) session.getAttribute("currentUserSession");%>

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
        <input type="submit" id="informazioni" class="profileButtonsStyle" value="Informazioni" onclick="showInformations();">
        <input type="submit" id="ordini" class="profileButtonsStyle" value="Ordini" onclick="location.href='GetOrdersServlet'">
        <input type="submit" id="recensioni" class="profileButtonsStyle" value="Recensioni">
        <input type="submit" id="pagamenti" class="profileButtonsStyle" value="Pagamenti">
    </div>
</div>




<script src="/GameNyx/scripts/ProfiloScripts.js"></script>

<script>

    //showInformations();
    //funzione che prende la quantitÃ&nbsp; dei giochi acquistati dall'utente e aumenta il livello e la percentuale dei punti xp
    //sulla base di esso
    //futura implementazione : sconto in base al livello
    var quantity = <%=request.getAttribute("quantity")%>
    avanzamentoBarraEsperienza(quantity);

    //Da implementare
    //mostrerÃ&nbsp; quanti punti esperienza/giochi mancano per il prossimo livello
    //e i dettagli sul prossimo coupon
    detailsCloud();

    //possibile implementazione della costruzione dinamica dell'output
    //TODO da inserire in un file js passando come parametro l'oggetto da stampare
    function showInformations()
    {
        var flag = document.getElementById("informations");

        if(flag==null) {
            document.getElementById("informazioni").style.backgroundColor="rgb(255,255,255,0.2)";
            var central = document.getElementById("backgroundCentral");
            var div = document.createElement("div");
            div.setAttribute("id", "informations");
            div.className="divInformazioni";

            var infoTag = document.createElement("h3");
            var username = document.createElement("p");
            var email = document.createElement("p");
            var nome = document.createElement("p");
            var cognome = document.createElement("p");
            var telefono = document.createElement("p");
            var data = document.createElement("p");

            infoTag.innerText = "Informazioni";
            username.innerText = "Claudio";
            email.innerText = "darkclaus124@gmail.com";
            nome.innerText = "Claudio";
            cognome.innerText = "Buono";
            telefono.innerText = "331286324";
            data.innerText = "2001-06-07";

            div.append(infoTag);
            div.append(username);
            div.append(email);
            div.append(nome);
            div.append(cognome);
            div.append(telefono);
            div.append(data);
            central.append(div);
        }

    }
    //claudio gay
</script>