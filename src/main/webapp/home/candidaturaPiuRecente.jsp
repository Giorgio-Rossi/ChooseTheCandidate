<%@page import="com.candidatoDB.pw2.interfaces.impl.CandidaturaIMPL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.candidatoDB.pw2.entity.CandidaturaUser"%>
<%@ page import="com.candidatoDB.pw2.entity.Utente"%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

Utente utenteLoggato = (Utente) request.getSession().getAttribute("utente");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candidatura più recente</title>
</head>

<jsp:include page="jsp/navbarHeader.jsp" />

<body>
	<h1>Candidatura più recente</h1>

	<%
	CandidaturaIMPL candidaturaIMPL = new CandidaturaIMPL();
	%>
	<%
	int userId = (int) request.getSession().getAttribute("userId");
	%>
	<%
	CandidaturaUser candidaturaPiuRecente = candidaturaIMPL.trovaCandidaturaPiùRecente(userId);
	%>



	<%
	if (candidaturaPiuRecente != null) {
	%>
	<p>
		ID Candidatura:
		<%=candidaturaPiuRecente.getId_candidatura()%></p>
	<p>
		Descrizione:
		<%=candidaturaPiuRecente.getId_posizione()%></p>
	<p>
		Data di candidatura:
		<%=candidaturaPiuRecente.getData_candidatura()%></p>
	<%
	} else {
	%>
	<p>Nessuna candidatura recente trovata.</p>
	<%
	}
	%>

</body>
</html>
