<%@ page import="com.candidatoDB.pw2.entity.Utente"%>
<%@ page import="java.util.stream.Stream" %>
<%@ page import="java.lang.reflect.Field" %>
<%@ page import="com.candidatoDB.pw2.entity.CandidaturaUser" %>
<%@ page import="com.candidatoDB.pw2.entity.Posizione" %>
<%@ page import="com.candidatoDB.pw2.entity.UtenteQuiz" %>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.*" %>
<%@ page import="com.candidatoDB.pw2.entity.UsersSkills" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	UtenteIMPL utenteIMPL = new UtenteIMPL();
	Utente utenteLoggato = (Utente) request.getSession().getAttribute("utente");
	ArrayList<String> campi_vuoti = utenteIMPL.getEmptyParameters(utenteLoggato);
	CandidaturaIMPL candidaturaIMPL = new CandidaturaIMPL();
	CandidaturaUser candidaturaRecente = candidaturaIMPL.trovaCandidaturaPiuRecente(utenteLoggato.getId_user());
	Posizione posizioneRecente = null;
	if(candidaturaRecente!=null) {
		posizioneRecente = candidaturaIMPL.getPosizioneByCandidaturaId(candidaturaRecente);
	}
	PosizioneIMPL posizioneIMPL = new PosizioneIMPL();

	UtenteSkillsIMPL utenteSkillsIMPL = new UtenteSkillsIMPL();
	ArrayList<UsersSkills> usersSkills = utenteSkillsIMPL.getAllUserSkillVerifiedOrNot(utenteLoggato);
	SkillIMPL skillIMPL = new SkillIMPL();

	UtenteQuizIMPL utenteQuizIMPL = new UtenteQuizIMPL();

	Map<Posizione,UtenteQuiz> bestCandidatura = utenteQuizIMPL.BestCandidatura(utenteLoggato.getId_user());

	System.out.println(bestCandidatura);
%>

<html>
<head>
	<title>Home</title>
	<link rel="icon" type="image/x-icon"
		  href="${pageContext.request.contextPath}/img/logoPag.png"
		  style="border-radius: 10px">
	<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
			crossorigin="anonymous"/>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"
		  href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/card.css" />

</head>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js'></script>

<link rel="stylesheet"
	  href="${pageContext.request.contextPath}/css/homeuser.css">

<body style="background-color: #d4d4d4;heigth:100vh!important;">

<jsp:include page="jsp/navbarHeader.jsp" />

<main style="margin-top: 69px">
	<div class="container pt-3">
		<div class="container">
			<div class="row">


				<div class="card col-lg-4 d-flex align-items-stretch" style=" background-color: rgba(0,0,0,0); border: none ">
					<div class="slide slide1" style="width:300px;;height:235px;">
						<div class="content">
							<div class="icon" style="background-color:white;">
								<i class="bi bi-card-list"
								   style="font-size: 10rem;text-align: center"><a href="${pageContext.request.contextPath}/home/statistichequiz.jsp" class="btn btn-info m-0"style="font-size: 1rem;">Statistiche Quiz</a></i>
							</div>
						</div>
					</div>
					<div class="slide slide2" style="background-color:#0072BC">
						<div class="content">
							<h3>
								Da modificare!
							</h3>
							<p>da modificare?!</p>
						</div>
					</div>
				</div>

				<div class="card col-lg-4 d-flex align-items-stretch" style=" background-color: rgba(0,0,0,0); border: none">
					<div class="slide slide1"  style="width:300px;height:235px;" >
						<div class="content">
							<div class="icon" style="background-color:white">
								<i class="bi bi-clipboard-data"
								   style="font-size: 10rem;text-align: center"><h1 class="btn btn-info m-1"style="font-size: 1rem">Le tue Skills</h1></i>
							</div>
						</div>
					</div>
					<div class="slide slide2" style="background-color:#0072BC">
						<div class="content">
							<div class="row row-cols-1">
							<%
								for(UsersSkills usersSkills1: usersSkills){
							%>
								<%
									if(usersSkills1.isVerificata()){
								%>
								<div class="col">
									<%=skillIMPL.findById(usersSkills1.getId_skills()).getNome()%>
									<span class="badge rounded-pill bg-success float-md-end mb-3 mb-sm-0"><i class="bi bi-check2-circle"></i></span>
								</div>

								<%
									}else{
								%>
								<div class="col">
									<%=skillIMPL.findById(usersSkills1.getId_skills()).getNome()%>
									<span class="badge rounded-pill bg-warning float-md-end mb-3 mb-sm-0">Da verificare</span>
								</div>

								<%
									}
								%>

							<%
								};
							%>
							</div>
						</div>
					</div>
				</div>


				<div class="card col-lg-4 d-flex align-items-stretch" style=" background-color: rgba(0,0,0,0); border: none">
					<div class="slide slide1"  style="width:300px;height:235px;">
						<div class="content">
							<div class="icon" style="background-color:white">
								<i class="bi bi-person"
								   style="font-size: 10rem;text-align: center"><a href="profilo.jsp" class="btn btn-info m-0"style="font-size: 1rem">Completa il profilo</a></i>
							</div>
						</div>
					</div>
					<div class="slide slide2"style="background-color:#0072BC">
						<div class="row">
							<table class=" table-borderless">
								<tbody>
								<% if(campi_vuoti.isEmpty()){
								%>
								<div class="alert alert-success  align-items-center border border-0" role="alert">
									<div>
										<i class="bi bi-check-circle-fill">Complimenti hai completato il profilo</i>
									</div>
								</div>

								<%
									};
								%>

								<%
									for(String campo : campi_vuoti){
								%>
								<tr>
									<td colspan="2"><%=campo%></td>
									<td><h6 class="mb-2"><span class="badge bg-warning"><i class="bi bi-exclamation-circle" style="font-size: 1rem"></i></span></h6></td>
								</tr>
								<%
									};
								%>
								</tbody>
							</table>
						</div>
					</div>
				</div>

			<div class="card col-lg-4 d-flex align-items-stretch" style=" background-color: rgba(0,0,0,0); border: none">
					<div class="slide slide1"  style="width:300px;height:235px;">
						<div class="content">
							<div class="icon" style="background-color:white">
								<i class="bi bi-receipt-cutoff"
								   style="font-size: 9rem;text-align: center"><h1 class="btn btn-info m-1"style="font-size: 1rem">Miglior Candidatura</h1></i>
							</div>
						</div>
					</div>
					<div class="slide slide2" style="background-color:#0072BC">
						<div class="card-body p-4">
							<%
								if(!bestCandidatura.isEmpty()){
									Posizione posizione = (Posizione) bestCandidatura.keySet().toArray()[0];
							%>

							<h5><%=posizione.getRuolo()%></h5>
							<div class="mt-3">
								<span class="text-muted d-block"><i class="bi bi-calendar-check-fill m-1"></i><%=bestCandidatura.get(posizione).getData_inserimento()%></span>
								<span class="text-muted d-block"><i class="bi bi-geo-alt-fill m-1"></i><%=posizione.getCitta().getNome()%></span>
								<span class="text-muted d-block"><i class="bi bi-list-ul m-1"></i><%=bestCandidatura.get(posizione).getPunteggio()%></span>
							</div>
							<%
							}else {
							%>
							<div class="alert alert-primary  align-items-center border border-0" role="alert">
								<div>
									<i class="bi bi-info-circle-fill m-1"></i> Non hai effettuato nessuna candidatura
								</div>
							</div>
							<%
								};
							%>

						</div>
					</div>
				</div>
		

				<div class="card col-lg-4 d-flex align-items-stretch" style=" background-color: rgba(0,0,0,0); border: none">
					<div class="slide slide1"  style="width:300px;height:235px;">
						<div class="content">
							<div class="icon" style="background-color:white">
								<i class="bi bi-receipt-cutoff"
								   style="font-size: 9rem;text-align: center"><h1 class="btn btn-info m-1"style="font-size: 1rem">Candidatura più recente</h1></i>
							</div>
						</div>
					</div>
					<div class="slide slide2" style="background-color:#0072BC">
						<div class="card-body p-4">
							<%
								if(posizioneRecente!=null){
									if(posizioneRecente.getStato().equals("aperta")){
							%>
							<span class="badge rounded-pill bg-success float-md-end mb-3 mb-sm-0"><%=posizioneRecente.getStato()%></span>
							<%
							}else{
							%>
							<span class="badge rounded-pill bg-danger float-md-end mb-3 mb-sm-0"><%=posizioneRecente.getStato()%></span>
							<%
								};
							%>
							<h5><%=posizioneRecente.getRuolo()%></h5>
							<div class="mt-3">
								<span class="text-muted d-block"><i class="bi bi-calendar-check-fill m-1"></i><%=candidaturaRecente.getData_candidatura()%></span>
								<span class="text-muted d-block"><i class="bi bi-geo-alt-fill m-1"></i><%=posizioneRecente.getCitta().getNome()%></span>
							</div>
							<%
							}else {
							%>
							<div class="alert alert-primary  align-items-center border border-0" role="alert">
								<div>
									<i class="bi bi-info-circle-fill m-1"></i> Non hai effettuato nessuna candidatura
								</div>
							</div>
							<%
								};
							%>

						</div>
					</div>
				</div>

				<div class="card col-lg-4 d-flex align-items-stretch" style="background-color: rgba(0,0,0,0); border: none">
					<div class="slide slide1"  style="width:300px;height:235px;">
						<div class="content">
							<div class="icon" style="background-color:white">
								<i class="bi bi-calendar" style="font-size: 10rem; text-align: center;"><h1 class="btn btn-info m-1"style="font-size: 1rem;">Annunci Recenti</h1></i>
							</div>
						</div>
					</div>
		<div class="slide slide2" style="background-color:#0072BC;overflow:auto">
    <div class="card-body p-4" >
        <%
        if(utenteLoggato.getId_citta()!=null){
        	List<Posizione> posizioniRecenti = posizioneIMPL.topTreAnnunci(utenteLoggato.getId_citta());

            if (!posizioniRecenti.isEmpty()) {
                for (Posizione posizione : posizioniRecenti) {
        %>
        <div class="mb-2">
			<h5><%=posizione.getRuolo()%></h5>
			<div class="mt-3">
				<span class="text-muted d-block"><i class="bi bi-calendar-check-fill m-1"></i><%=posizione.getData_inserimento()%></span>
				<span class="text-muted d-block"><i class="bi bi-geo-alt-fill m-1"></i><%=posizione.getCitta().getNome()%></span>
			</div>
        </div>
        <%
                }
            } else {
        %>
        <div class="alert alert-info" role="alert">
            <i class="bi bi-info-circle-fill m-1"></i> Nessun annuncio recente disponibile a <%=utenteLoggato.getId_citta().getNome()%>
        </div>
        <%
            }
		}
        %>
    </div>
</div>




				</div>
			</div>
		</div>
	</div>
</main>



<div class="modal fade" id="statusSuccessModal" tabindex="-1" role="dialog" data-bs-backdrop="static" data-bs-keyboard="false">
	<div class="modal-dialog modal-dialog-centered modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-body text-center p-lg-4">
				<i class="bi bi-check-circle-fill" style="font-size: 5rem"></i>
				<h4 class="text-success mt-3">Candidatura inviata correttamente!</h4>
				<p class="mt-3">Controlla i risultati del test nella sezione Statistiche Quiz</p>
				<button type="button" class="btn btn-sm mt-3 btn-success" data-bs-dismiss="modal">Ok</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="errorModal" tabindex="-1" role="dialog" data-bs-backdrop="static" data-bs-keyboard="false">
	<div class="modal-dialog modal-dialog-centered modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-body text-center p-lg-4">
				<i class="bi bi-x-circle-fill" style="font-size: 5rem"></i>
				<h4 class="text-danger mt-3">Hai già effettuato il quiz per questa candidatura!</h4>
				<p class="mt-3">Controlla i risultati del test nella sezione Statistiche Quiz</p>
				<button type="button" class="btn btn-sm mt-3 btn-danger" data-bs-dismiss="modal">Ok</button>
			</div>
		</div>
	</div>
</div>


<%
	String success =  session.getAttribute("candidatura_fatta") == null ?  null : session.getAttribute("candidatura_fatta").toString();

	if(success != null && Boolean.parseBoolean(success)){
%>
<script>
	var myModal = new bootstrap.Modal(document.getElementById('statusSuccessModal'))
	myModal.show()
	<% session.removeAttribute("candidatura_fatta");%>
</script>
<%
	} else if(success!=null){
%>
<script>
	var myModal = new bootstrap.Modal(document.getElementById('errorModal'))
	myModal.show()
	<% session.removeAttribute("candidatura_fatta");%>
</script>
<%
	};
%>




<div class="modal fade" id="statusSuccessModal" tabindex="-1" role="dialog" data-bs-backdrop="static" data-bs-keyboard="false">
	<div class="modal-dialog modal-dialog-centered modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-body text-center p-lg-4">
				<i class="bi bi-check-circle-fill" style="font-size: 5rem"></i>
				<h4 class="text-success mt-3">Candidatura inviata correttamente!</h4>
				<p class="mt-3">Controlla i risultati del test nella sezione Statistiche Quiz</p>
				<button type="button" class="btn btn-sm mt-3 btn-success" data-bs-dismiss="modal">Ok</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="errorModal" tabindex="-1" role="dialog" data-bs-backdrop="static" data-bs-keyboard="false">
	<div class="modal-dialog modal-dialog-centered modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-body text-center p-lg-4">
				<i class="bi bi-x-circle-fill" style="font-size: 5rem"></i>
				<h4 class="text-danger mt-3">Hai già effettuato il quiz per questa candidatura!</h4>
				<p class="mt-3">Controlla i risultati del test nella sezione Statistiche Quiz</p>
				<button type="button" class="btn btn-sm mt-3 btn-danger" data-bs-dismiss="modal">Ok</button>
			</div>
		</div>
	</div>
</div>




<div class="modal fade" id="statusSuccessModal" tabindex="-1" role="dialog" data-bs-backdrop="static" data-bs-keyboard="false">
	<div class="modal-dialog modal-dialog-centered modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-body text-center p-lg-4">
				<i class="bi bi-check-circle-fill" style="font-size: 5rem"></i>
				<h4 class="text-success mt-3">Candidatura inviata correttamente!</h4>
				<p class="mt-3">Controlla i risultati del test nella sezione Statistiche Quiz</p>
				<button type="button" class="btn btn-sm mt-3 btn-success" data-bs-dismiss="modal">Ok</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="errorModal" tabindex="-1" role="dialog" data-bs-backdrop="static" data-bs-keyboard="false">
	<div class="modal-dialog modal-dialog-centered modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-body text-center p-lg-4">
				<i class="bi bi-x-circle-fill" style="font-size: 5rem"></i>
				<h4 class="text-danger mt-3">Hai già effettuato il quiz per questa candidatura!</h4>
				<p class="mt-3">Controlla i risultati del test nella sezione Statistiche Quiz</p>
				<button type="button" class="btn btn-sm mt-3 btn-danger" data-bs-dismiss="modal">Ok</button>
			</div>
		</div>
	</div>
</div>


</body>
</html>