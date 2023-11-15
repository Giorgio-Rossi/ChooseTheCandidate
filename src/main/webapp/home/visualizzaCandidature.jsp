<%@ page import="com.candidatoDB.pw2.interfaces.impl.CandidaturaIMPL"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.candidatoDB.pw2.entity.CandidaturaUser"%>
<%@ page import="java.util.List"%>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.UtenteIMPL"%>
<%@ page import="com.candidatoDB.pw2.entity.Utente"%>
<%@ page import="java.util.ArrayList"%>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	Utente utenteLoggato = (Utente) request.getSession().getAttribute("utente");

	CandidaturaIMPL candidatureIMPL = new CandidaturaIMPL();

	List<CandidaturaUser> candidature = candidatureIMPL.findCandidatureUtenteById(utenteLoggato.getId_user());
	
	System.out.println(candidature);


%>

<!DOCTYPE html>
<html>
<head>
    <title>Candidature effettuate</title>

    <link rel="icon" type="image/x-icon"
          href="${pageContext.request.contextPath}/img/logoPag.png"
          style="border-radius: 10px" />

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous" />
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/homeuser.css" />

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/visualizzacandidature.css" />

</head>



<body style="background-color: #d4d4d4">
<%@ include file="jsp/navbarHeader.jsp"%>

<main style="margin-top: 150px">
<div class="container">

    <%
        for(CandidaturaUser candidaturaUser : candidature){
    %>

    <div class="card mb-3 shadow-lg">
        <div class="card-body">
            <div class="d-flex flex-column flex-lg-row">
                <%
                    String initials = "";
                    for (String s : candidaturaUser.getPosizione().getRuolo().split(" ")) {
                        initials+=s.charAt(0);
                    }
                %>
                <span class="avatar avatar-text rounded-3 me-4 mb-2"><%=initials%></span>
                <div class="row flex-fill">
                    <div class="col-sm-5">
                        <h4 class="h5"><%=candidaturaUser.getPosizione().getRuolo()%></h4>
                        <span class="badge bg-primary m-1"><%=candidaturaUser.getPosizione().getCitta().getNome()%></span><span class="badge bg-success"><i class="bi bi-calendar-check-fill mt-2"> <%=candidaturaUser.getData_candidatura()%></i></span>
                    </div>
                    <div class="col-sm-4 py-2">
                        <span class="badge bg-info"><%=candidaturaUser.getPosizione().getCategoria().getNome_categoria()%></span>
                        <span class="badge bg-info">Ammissioni massime: <%=candidaturaUser.getPosizione().getN_ammissioni()%></span>
                    </div>
                    <%
                        if(candidaturaUser.getPosizione().getStato().equals("aperta")){
                    %>
                    <div class="col-sm-3 text-lg-end">
                        <span class="badge bg-success"><%=candidaturaUser.getPosizione().getStato().toUpperCase()%></span>
                    </div>
                    <%
                         }else{
                    %>
                    <div class="col-sm-3 text-lg-end">
                        <span class="badge bg-danger"><%=candidaturaUser.getPosizione().getStato().toUpperCase()%></span>
                    </div>
                    <%
                        };
                    %>

                </div>
            </div>
        </div>
    </div>

    <%
        }
    %>


</div>
</main>

</body>
</html>

