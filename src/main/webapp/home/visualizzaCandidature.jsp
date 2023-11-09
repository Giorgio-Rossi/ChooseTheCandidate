<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="com.candidatoDB.pw2.entity.CandidaturaUser"%>
<%@page import="com.candidatoDB.pw2.entity.Utente" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%   Utente utenteLoggato = (Utente) request.getSession().getAttribute("utente");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

%>



<!DOCTYPE html>
<html>
<head>
    <title>Candidature effettuate</title>
</head>
<body>
	<jsp:include page="jsp/navbarHeader.jsp" />
	<h1>Candidature effettuate da <%=utenteLoggato.getNome() +" " +  utenteLoggato.getCognome()%></h1>
    <table border="1">
        <tr>
            <th>Candidatura</th>
            <th>Posizione</th>
            <th>Data Candidatura</th>
        </tr>
        <% List<CandidaturaUser> candidaturaUsers = (List<CandidaturaUser>) request.getAttribute("candidature");
            for(CandidaturaUser candidatura: candidaturaUsers){
        %>
            <tr>
                <td><%=candidatura.getId_candidatura()%></td>
                <td><%=candidatura.getId_posizione()%></td>
                <td><%=candidatura.getData_candidatura()%></td>
            </tr>
        <%
            }
        %>
    </table>
</body>
</html>
