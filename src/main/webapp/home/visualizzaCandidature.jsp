<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.candidatoDB.pw2.entity.CandidaturaUser"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
    <title>Candidature effettuate</title>
</head>
<body>
    <%@ include file="jsp/navbarHeader.jsp"%>
    <h1>Candidature effettuate</h1>

    <table border="1">
        <tr>
            <th>Posizione</th>
            <th>Data Candidatura</th>
        </tr>
        <%
        List<CandidaturaUser> candidaturaUsers = (List<CandidaturaUser>) request.getAttribute("findCandidature");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        if (candidaturaUsers != null) {
            for (CandidaturaUser candidatura : candidaturaUsers) {
        %>
        <tr>
            <td><%=candidatura.getId_posizione()%></td>
            <td>
                <%
                try {
                    out.print(dateFormat.format(candidatura.getData_candidatura()));
                } catch (Exception e) {
                    e.printStackTrace();
                    out.print("Errore nella formattazione della data");
                }
                %>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="2">Nessuna candidatura disponibile</td>
        </tr>
        <%
        }
        %>
    </table>
</body>
</html>
