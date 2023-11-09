<%@ page import="com.candidatoDB.pw2.entity.Posizione"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.candidatoDB.pw2.entity.Citta"%>
<%@ page import="com.candidatoDB.pw2.entity.CategoriaPosizione"%>
<%@ page import="com.candidatoDB.pw2.entity.Quiz"%>
<%@ page isELIgnored="false"%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>

<html>
<head>
<title>Ricerca Posizioni</title>
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/img/logoPag.png"
	style="border-radius: 10px" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/homeuser.css" />
</head>


<body>


	<jsp:include page="jsp/navbarHeader.jsp" />

	<div
		style="display: flex; justify-content: center; align-items: center; padding-top: 10%; flex-direction: column">
		<h1>Ricerca Posizioni</h1>

		<form
			action="${pageContext.request.contextPath}/RicercaPosizioniServlet"
			method="post">
			<div class="form-group">
				<label for="ruolo">Ruolo:</label> <select name="ruolo" id="ruolo">
					<option value="">Tutti</option>
					<option value="Sistemista">Sistemista</option>
					<option value="Web Developer">Web Developer</option>
				</select>
			</div>

			<div class="form-group">
				<label for="citta">Città:</label> <select name="citta" id="citta">
					<option value="">Tutte</option>
					<option value="1">Genova</option>
					<option value="2">Milano</option>
					<option value="3">Roma</option>
					<option value="4">Napoli</option>
					<option value="5">Lodi</option>
					<option value="6">Torino</option>
					<option value="7">Venezia</option>
					<option value="8">Firenze</option>
					<option value="9">Bologna</option>
				</select>
			</div>


			<div class="form-group">
				<label for="categoria">Categoria Posizione:</label> <select
					name="categoria" id="categoria">
					<option value="">Tutte</option>
					<option value="1">bella desc</option>
					<option value="2">desc 2</option>
				</select>
			</div>


			<button type="submit" class="btn btn-primary">Cerca</button>
		</form>

	</div>
</body>
</html>
