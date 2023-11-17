<%@ page import="com.servlets.pw2.controller.ErrorManager"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="com.candidatoDB.pw2.entity.Utente"%>
<%@ page import="com.candidatoDB.pw2.entity.Citta"%>
<%@ page import="com.candidatoDB.pw2.entity.Regione"%>
<%@ page import="com.candidatoDB.pw2.entity.Esperienza"%>
<%@ page import="com.candidatoDB.pw2.entity.Istruzione"%>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.RegioneIMPL"%>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.IstruzioneIMPL"%>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.EsperienzaIMPL"%>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.UtenteIMPL"%>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.CittaIMPL"%>

<%
Utente utente = (Utente) session.getAttribute("utente");
System.out.println(utente.toString());

ArrayList<Citta> cities = new CittaIMPL().getAllCitta();
ArrayList<Regione> regioni = new RegioneIMPL().getAllRegioni();

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>


<html>
<head>

<title>Profilo</title>
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/img/logoPag.png"
	style="border-radius: 10px">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
</head>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/homeuser.css">

<body style="background-color: #d4d4d4">

	<jsp:include page="jsp/navbarHeader.jsp" />



	<main style="margin-top: 58px"></main>

</body>
</html>
