<%@ page import="model.UserModels.UserBean" %>
<%@page import="model.PurchaseModels.Cart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<link rel="stylesheet" type="text/css" href="css/MyCss.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
    #livesearch
    {
        position: absolute;
        background-color: white;
        margin: auto;
        width: 29%;
        z-index: 2;
        background: white;
        margin-left: 35.5%;
        margin-top: -10px;
        box-shadow: 0 4px 8px 0 rgb(0 0 0 / 30%), 0 6px 20px 0 rgb(0 0 0 / 30%);
    }

    .searchedElement
    {
        margin-top: 3%;
        margin-left: 5%;
        margin-bottom: 3%;
    }

    .searchedElement img
    {
        width: 15%;
        display: inline-block;

    }

    .searchedElement p
    {
        display: inline-block;
        margin-left: 5%;
        color: black;
        font-size: 1vw;
    }



</style>
<div id="header">
    <a id="logo" href="index.jsp">GameNyx</a>

    <input type="text" id="searchBar" placeholder="Cerca videogioco..." onkeyup="showResult(this.value)">


    <div id="headerRightButtons">

        <!-- Carrello con numero della quantità totale di videogiochi nel carrello -->
        <%
            Cart carrello = null;
            int size = 0;
            if(session.getAttribute("carrello")!=null)
            {
                carrello = (Cart) session.getAttribute("carrello");
                size = carrello.getCartTotalQuantity();
            }
        %>

        <a id="cartButton" href="Cart.jsp"><img id="cartImage" src="images/icons/cart.png"><span id="cartSize"><%=size%></span></a>

    <%
    if(session.getAttribute("currentUserSession")!=null)
    {
    %>
        <% UserBean user = (UserBean) session.getAttribute("currentUserSession"); %>

            <div id="userProfile">
              <div class="dropdown" id="profileButton"><%=user.getUsername()%><span id="arrow-down"></span>
                <div class="dropdown-content">
                    <a id="profileButton" style="color: black" href="ProfileServlet?user=<%=user.getUsername()%>">Profilo</a>
                    <a id="profileButton" style="color: black" href="LogoutServlet">Logout</a>
                </div>
              </div>
            </div>
    <%
    }
    else
    {
    %>
        <div id="loginRegisterDiv">
            <a id="signup" href="Registrazione.jsp">Sign up</a>
            <a id="login" href="Login.jsp">Login</a>
        </div>
    <%
    }
    %>
    </div>

</div>
<div id="livesearch"></div>

<script src="${pageContext.request.contextPath}/scripts/jquery.js"></script> 

<script>



function showResult(str)
{
    if (str.length==0)
    {
        document.getElementById("livesearch").innerHTML="";
        return;
    }

    $.ajax({
    	type:"GET",
    	url:"LiveSearchServlet",
    	data:"q="+str,
    	success:function(data)
    	{
    		/*
    			La servlet Java converte un ArrayList in una stringa Json
    			data però non sarà una stringa, ma un oggetto JS rappresentante la stringa
    		*/
    		
    		//TODO da risolvere il conflitto con gli apici singoli
    		
    		/*
    			la funzione append inserisce alla fine e all'interno del tag selezionato il testo specificato
    			come parametro. Tuttavia, se si appende un tag non chiuso, la funzione lo chiude automaticamente. Bisogna fare per questo
    			una stringa da appendere alla fine
    		*/
    		var stringToAppend="<div id='searchedElementsDiv'>"; 
    		
    		
    		
    		if(data[0]==null) //nessun risultato
    		{	
    			stringToAppend=stringToAppend+"<p class='searchedElement'>"+"Nessun risultato trovato"+"</p>";
    			
    		}
    		else
    		{ 
    			$.each(data, function(i, object)
    					{
    						var copertina="./images/"+object.titolo+"/copertina.jpg";
    						stringToAppend=stringToAppend+"<div class='searchedElement'>"+
    							"<a style=\"text-decoration: none;\" href=\"ProductInfoServlet?productID="+object.id+"\" target=\"_blank\">"+
    							'<img src="'+copertina+'">'+
    							"<p>"+object.titolo+"</p>"+
    							"</div>";
    					});	
    		}
    	
    		stringToAppend=stringToAppend+"</div>";
    		$("#livesearch").html(stringToAppend);
    		
    		
    		
    		
    		
    	}
    	
    });
}
</script>