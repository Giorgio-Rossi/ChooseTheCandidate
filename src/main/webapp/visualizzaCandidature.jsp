<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="com.candidatoDB.pw2.entity.CandidaturaUser"%>
<%@page import="com.candidatoDB.pw2.entity.Utente" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>



<!DOCTYPE html>
<html>
<head>
    <title>Candidature effettuate</title>
</head>
<body>
    <h1>Candidature effettuate da ${sessionScope.utente.nome} ${sessionScope.utente.cognome}</h1>
    <table border="1">
        <tr>
            <th>Candidatura</th>
            <th>Posizione</th>
            <th>Data Candidatura</th>
        </tr>
        <c:forEach items="${candidature}" var="candidatura">
            <tr>
                <td>${candidatura.id_candidatura}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
