<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.candidatoDB.pw2.entity.CandidaturaUser" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Candidatura più recente</title>
</head>
<body>
    <h1>Candidatura più recente</h1>
<%CandidaturaUser candidaturaPiuRecente = new CandidaturaUser() %>
    <%
    if (candidaturaPiuRecente != null) {
    %>
        <p>ID Candidatura: <%=candidaturaPiuRecente.getId_candidatura()%></p>
        <p>Descrizione: <%=candidaturaPiuRecente.getId_posizione() %></p>
        <p>Data di candidatura: <%=candidaturaPiuRecente.getData_candidatura() %></p>
    <%
    } else {
    %>
        <p>Nessuna candidatura recente trovata.</p>
    <%
    }
    %>

</body>
</html>
