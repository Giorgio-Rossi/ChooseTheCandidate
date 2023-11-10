<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.candidatoDB.pw2.entity.CandidaturaUser" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="com.candidatoDB.pw2.entity.Posizione" %>
<%@ page import="com.candidatoDB.pw2.entity.Utente" %>
<%
    List<CandidaturaUser> candidaturaUsers = (List<CandidaturaUser>) request.getAttribute("findCandidature");
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    Utente utenteLoggato = (Utente) request.getSession().getAttribute("utente");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Candidature effettuate</title>
</head>
<body>
    <%@ include file="jsp/navbarHeader.jsp" %>
    <h1>Candidature effettuate</h1>

    <table border="1">
        <tr>
            <th>Candidatura</th>
            <th>Posizione</th>
            <th>Data Candidatura</th>
        </tr>
        <%
            if (candidaturaUsers != null) {
                for (CandidaturaUser candidatura : candidaturaUsers) {
                	   System.out.println("ID Candidatura: " + candidatura.getId_candidatura());
                	    System.out.println("ID Posizione: " + candidatura.getId_posizione());
                	    System.out.println("Data Candidatura: " + candidatura.getData_candidatura());
        %>
        <tr>
            <td><%=candidatura.getId_candidatura()%></td>
            <td><%=candidatura.getId_posizione()%></td>
            <td><%=dateFormat.format(candidatura.getData_candidatura())%></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="3">Nessuna candidatura disponibile</td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>

