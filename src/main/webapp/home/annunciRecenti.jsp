<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.candidatoDB.pw2.entity.Citta"%>
<%@page import="com.candidatoDB.pw2.entity.Posizione"%>
<%@page import="com.candidatoDB.pw2.entity.CategoriaPosizione"%>
<%@page import="com.candidatoDB.pw2.entity.Quiz"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Annunci più recenti</title>
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/img/logoPag.png"
	style="border-radius: 10px">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/homeuser.css">
</head>
<body style="background-color: #d4d4d4">

	<jsp:include page="jsp/navbarHeader.jsp" />

	<main style="margin-top: 58px">
		<div class="container pt-3">
			<h1>Annunci più recenti</h1>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Numero ammissioni</th>
						<th>Descrizione</th>
						<th>Città</th>
						<th>Categoria</th>
						<th>Stato</th>
						<th>Data inserimento</th>
						<th>Ruolo</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Posizione posizione : (List<Posizione>) request.getAttribute("posizioniPiuRecenti")) {
					%>
					<tr>
						<td><%=posizione.getId_posizione()%></td>
						<td><%=posizione.getN_ammissioni()%></td>
						<td><%=posizione.getDescrizione()%></td>
						<td><%=posizione.getCitta().getNome()%></td>
						<td><%=posizione.getCategoria().getNome_categoria()%></td>
						<td><%=posizione.getStato()%></td>
						<td><%=posizione.getData_inserimento()%></td>
						<td><%=posizione.getRuolo()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</main>


</body>
</html>
