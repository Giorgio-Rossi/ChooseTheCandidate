<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.candidatoDB.pw2.entity.CandidaturaUser"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
    <title>Candidature effettuate</title>
    
     <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous" />
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />

</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
   
</head>
<body>
    <%@ include file="jsp/navbarHeader.jsp"%>
    <h1>Candidature effettuate</h1>

    <table>
        <tr>
            <th>Posizione</th>
            <th>Data Candidatura</th>
          
        </tr>

        <%
        List<CandidaturaUser> candidatureList = (List<CandidaturaUser>) request.getAttribute("findCandidature");
        
        if (candidatureList != null && !candidatureList.isEmpty()) {
            for (CandidaturaUser candidatura : candidatureList) {
        %>
                <tr>
                    <td><%=candidatura.getId_posizione()%></td>
                    <td><%=candidatura.getData_candidatura()%></td>
                    
                </tr>
        <%
            }
        } else {
        %>
            <tr>
                <td colspan="">Nessuna candidatura disponibile</td>
          
            </tr>
        <%
        }
        %>

    </table>


</body>
</html>
