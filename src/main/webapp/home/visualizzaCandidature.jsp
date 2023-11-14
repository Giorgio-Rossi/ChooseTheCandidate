<%@page import="com.candidatoDB.pw2.interfaces.impl.CandidaturaIMPL"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.candidatoDB.pw2.entity.CandidaturaUser"%>
<%@ page import="java.util.List"%>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.UtenteIMPL"%>
<%@ page import="com.candidatoDB.pw2.entity.Utente"%>
<%@ page import="java.util.ArrayList"%>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	UtenteIMPL utenteIMPL = new UtenteIMPL();
	Utente utenteLoggato = (Utente) request.getSession().getAttribute("utente");
	ArrayList<String> campi_vuoti = utenteIMPL.getEmptyParameters(utenteLoggato);
	CandidaturaIMPL candidatureIMPL = new CandidaturaIMPL();
	List<CandidaturaUser> candidature = candidatureIMPL.findCandidatureUtenteById(utenteLoggato.getId_user()));
	
	System.out.println(candidature);

	}


%>


<!DOCTYPE html>
<html>
<head>
    <title>Candidature effettuate</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"/>
</head>

<body>
<%@ include file="jsp/navbarHeader.jsp"%>
<h1>Candidature effettuate</h1>

<table class="table">
    <thead>
    <tr>
        <th scope="col">Posizione</th>
        <th scope="col">Data Candidatura</th>
    </tr>
    </thead>
    <tbody>
    <%
    List<CandidaturaUser> candidatureList = (List<CandidaturaUser>) request.getAttribute("candidatureUtente");

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
            <td colspan="2">Nessuna candidatura disponibile</td>
        </tr>
    <%
    }
    %>
    </tbody>
</table>

</body>
</html>

