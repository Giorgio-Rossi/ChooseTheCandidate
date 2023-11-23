<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.candidatoDB.pw2.entity.*"%>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.*"%>
<%@ page import="com.servlets.pw2.controller.ErrorManager"%>
<%@ page import="com.servlets.pw2.controller.DbOperations"%>
<%@ page isELIgnored="false"%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

UtenteIMPL utenteIMPL = new UtenteIMPL();
Utente utente = new Utente();

String utente1 = request.getParameter("utente1");

String chiaveSicurezza = request.getParameter("chiaveSicurezza");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Password dimenticata</title>
<script type="text/javascript" src="Script/checkPassword.js"></script>

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
<body>

	<form method="post" id="form1"
		action="${pageContext.request.contextPath}/passwordDimenticata">

		<input type="text" name="chiaveSicurezza" id="chiaveSicurezza"
			placeholder="chiaveSicurezza" required><br> <input
			type="email" name="email"
			pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" id="email"
			placeholder="Email" required><br>

		<div>
			<%
				if(!ErrorManager.getSUccessMessage((HttpServletRequest) request).isEmpty()){
				%>
			<div
				style="margin-top: 4%; width: 100%; height: 1.5em; font-size: 1.5em; text-align: center; color: green; background: lightgreen; border: 3px solid darkgreen;; transform: translateX(2%); border-radius: 30px;">
				<%= ErrorManager.getSUccessMessage((HttpServletRequest) request)%>
			</div>
			<%
				};
				%>

			<%
				if(!ErrorManager.getErrorMessage((HttpServletRequest) request).isEmpty()){
				%>
			<div class="alert_alert-danger" role="alert">
				<%= ErrorManager.getErrorMessage((HttpServletRequest) request)%>
			</div>
			<%
				};
				%>
				

		</div>
		<input type="submit" class="passwordDimenticata">

	</form>




	</main>
</body>
</html>