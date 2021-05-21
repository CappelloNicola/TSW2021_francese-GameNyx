<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WICKED 404</title>
</head>

<body>
    <p style="margin: auto;width: 30%;font-size:100px;color: #2980B9">ERROR 404</p>
    <p style="margin: auto;width: 23%;font-size:30px;color: green">Scusami, ma lei dove sta andando?</p>
    <!-- implementare immagine di errore casuale -->
    <!-- 70% "game over.png" -->
    <!-- 20% "based.png" -->
    <!-- 10% "wicked.png" -->

    <% int rand = (int) (Math.random()*11)+1;

       if(rand>=1 && rand<=9)
       {
    %>
         <img style="margin-left: 35%;margin-top: 5%" src="images/GenreBar%20icons/WICKED.png" width="512px">
    <%
       }
       else
       {
    %>
        <img style="margin-left: 38%;margin-top: 5%" src="images/GenreBar%20icons/based.png" width="412px">
    <%
       }
    %>

</body>
</html>
