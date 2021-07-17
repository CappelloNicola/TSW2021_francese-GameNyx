<%@page import="model.PurchaseModels.ProductBean"%>
<%@page import="model.PurchaseModels.Cart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/MyCss.css"/>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<% ProductBean product =(ProductBean) request.getAttribute("product"); %>

<title><%=product.getTitolo() %></title>

	<style>
		.ProductInfoContainer
		{
			width: 70%;
			margin: auto;
			margin-top: 3%;
		}

		.ProductInfoContainer p
		{
			font-family: "Roboto Condensed", sans-serif;
			font-size: 30px;
			color: black;
			font-weight: bold;
		}
		.ProductInfoMedia
		{
			width: 68%;
			display: inline-block;
		}
		.trailerContainer
		{
			position: relative;
			overflow: hidden;
			width: 100%;
			padding-top: 56.25%;
		}
		.trailerContainer iframe
		{
			position: absolute;
			top: 0;
			left: 0;
			bottom: 0;
			right: 0;
			width: 100%;
			height: 100%;
			border: none;
		}
		.screenshotsContainer
		{

		}
		.screenshotsContainer img
		{
			width: 200px;
			padding-top: 15px;
		}
		.ProductInfoDetails
		{
			width: 30%;
			display: inline-block;
			border-radius: 30px;
			background: blue;
			float: right;
		}
	</style>
</head>
<body>

<%@ include file="fragments/header.jsp"%>
<jsp:useBean id="cart" class="model.PurchaseModels.Cart" scope="session" />


<div class="ProductInfoContainer">
	<p><%=product.getTitolo()%></p>
	<div class="ProductInfoMedia">
		<div class="trailerContainer">
			<iframe src="<%=product.getTrailerURL()%>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
		<div class="screenshotsContainer">
			<img src="https://sm.ign.com/ign_it/screenshot/default/control-new-3_d3gd.jpg">
			<img src="https://images.everyeye.it/img-notizie/control-remedy-mostra-gioco-nuovi-screenshot-4k-v4-362679.jpg">
		</div>
	</div>
	<div class="ProductInfoDetails">
		<p>d</p>
		<p>d</p>

	</div>
</div>
</body>
</html>