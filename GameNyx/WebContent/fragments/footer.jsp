

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<link rel="stylesheet" type="text/css" href="css/footer.css">

<footer>

	<!--  
    <table id="informazioniFooter" >
    <thead>
    	<tr>
    		<th><b>Chi siamo</b></th>
    		<th id="contatto"><b>Contattaci</b></th>
    		<th><b>Social</b></th>
    	</tr>
    </thead>
    <tbody>
    	<tr>
    		<td> Siamo <b>Nicola Cappello</b> e <b>Claudio Buono</b> <br> studenti iscritti all'indirizzo informatico <br> dell'Universit&agrave; degli studi di Salerno </td>
    		<td><b>Email:</b> Gamenyx@gmail.com <br> <b>Cellulare:</b> 080-435-678-76</td>
    		<td><img src="images/SocialIcons/instagram.png" width="30px" height="auto"> 
    					<br>
    					<b ><a class="socialLink" href="https://www.instagram.com/niky_hat/" target="_blank">Nicola</a></b>
    					<br>
    					<b><a class="socialLink" href="https://www.instagram.com/claudio.buono01/" target="_blank">Claudio</a></b>
    					<br>
    					<br>
    			<img src="images/SocialIcons/facebook.png" width="30px" height="auto">
    					<br>
    					<b><a class="socialLink" >Nicola</a></b>
    					<br>
						<b><a class="socialLink" >Claudio</a></b>
    					<br>
    		</td>
    	</tr>
    </tbody>
    </table>
    	<p id="copyright"><b>©  2020 N&C Industry - All Rights Reserved.</b></p>
    	<br>
    	-->
    	
        <div id="footerIcons">
        	<ul>
        		<li><img src="images/SocialIcons/facebook.png"></li>
        		<li><img src="images/SocialIcons/instagram.png"></li>
        		<li><img src="images/SocialIcons/twitter.png"></li>
        		<li><img src="images/SocialIcons/youtube.png"></li>
        	</ul>
        </div>
        
        <di id="footerHeaders">
        	<ul>
        		<li><button onclick="showChiSiamo()">Chi siamo</button></li>
        		<li><button onclick="showContattaci()">Contattaci</button></li>
        	</ul>
        </div>
        
        <div id="chiSiamoDiv">
       		<p> Siamo <b>Nicola Cappello</b> e <b>Claudio Buono,</b> studenti iscritti all'indirizzo informatico dell'Universit&agrave; degli studi di Salerno</p>
       	</div>
       	<div id="contattaciDiv">
       		<p>Email:</b> Gamenyx@gmail.com</p>
       		<p> <b>Cellulare:</b> 080-435-678-76</p>
       	</div>
        
        <div id="copyrightDiv">
      		  <p id="copyright"><b>©  2020 N&C Industry - All Rights Reserved.</b></p>
        </div>
       	

    	<script src="${pageContext.request.contextPath}/scripts/footerScripts.js"></script>
</footer>