<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.candidatoDB.pw2.entity.*"%>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.*"%>
<%@ page import="com.servlets.pw2.controller.ErrorManager"%>
<%@ page isELIgnored="false"%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

PosizioneIMPL posizioneIMPL = new PosizioneIMPL();
ArrayList<Posizione> posizioni;

UtenteQuizIMPL utenteQuizIMPL = new UtenteQuizIMPL();
Utente utente = (Utente) session.getAttribute("utente");

//CandidaturaIMPL candidaturaIMPL = new CandidaturaIMPL();
//List<CandidaturaUser> candidaturaUsers = candidaturaIMPL.findCandidatureUtenteById(utente.getId_user());

//System.out.println(candidaturaUsers);

CandidaturaUserIMPL candidaturaUserIMPL = new CandidaturaUserIMPL();

ArrayList<Citta> cities = new CittaIMPL().getAllCitta();
ArrayList<Regione> regioni = new RegioneIMPL().getAllRegioni();

if (request.getAttribute("risultatiRicerca") == null) {
	posizioni = posizioneIMPL.getAllPosizioni();
} else {
	posizioni = (ArrayList<Posizione>) request.getAttribute("risultatiRicerca");
}

ArrayList<String> ruoli = posizioneIMPL.getAllRuoli();

CategoriaPosizioneIMPL categoriaPosizioneIMPL = new CategoriaPosizioneIMPL();
ArrayList<CategoriaPosizione> categorie_posizioni = categoriaPosizioneIMPL.getAllCategoriePosizioni();

//System.out.println(posizioni);
%>
<html>
<head>
<title>Gestione Posizioni</title>
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/img/logoPag.png"
	style="border-radius: 10px">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />

<link rel="stylesheet" href="../css/homeuser.css">

</head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>


<%
Utente utente_admin = (Utente) request.getSession().getAttribute("admin");
%>


<body style="background-color: #d4d4d4">

	<jsp:include page="/home/jsp/navbarHeaderAdmin.jsp" />
	<!-- ruolo,categoria,citta,n_ammissioni,id_quiz,descrizione,stato,data_inserimento -->

	<main style="margin-top: 58px">

		<div class="container mt-5">
			<div class="row flex-lg-nowrap">
				<div class="col">
					<div class="row">
						<div class="col mb-3">
							<div class="card mt-4">
								<div class="card-body">
									<div class="e-profile">
										<div class="tab-content pt-3">
											<div class="tab-pane active">
												<form class="form" method="post"
													action="${pageContext.request.contextPath}/  "
													id="inserici_posizione" enctype='multipart/form-data'>
													
													<div class="row">
														<div class="col">
															<select class="form-select" name="ruolo"
																aria-label="Default select example">
																<option disabled selected>Ruolo</option>
																<option value="">Tutti</option>
																<%
																for (String r : ruoli) {
																%>
																<option value="<%=r%>"><%=r%></option>
																<%
																}
																;
																%>
															</select>
														</div>

														<div class="col">
															<select name="citta" class="form-select"
																aria-label="Default select example">
																<option disabled selected>Città</option>
																<option value="">Tutte</option>
																<%
																for (Regione r : regioni) {
																%>
																<optgroup label="<%=r.getNome()%>">
																	<%
																	for (Citta c : cities) {
																		if (c.getRegione().getNome().equals(r.getNome())) {
																	%>
																	<option value="<%=c.getId_citta()%>"><%=c.getNome()%></option>
																	<%
																	}
																	}
																	}
																	%>
																
															</select>
														</div>
									
														<div class="col">
															<select class="form-select" name="categoria"
																aria-label="Default select example">
																<option disabled selected>Categoria</option>
																<option value="">Tutte</option>
																<%
																for (CategoriaPosizione cat : categorie_posizioni) {
																%>
																<option value="<%=cat.getId_categoria()%>"><%=cat.getNome_categoria()%></option>
																<%
																}
																;
																%>

															</select>
														</div>
													</div>
													<div class="row">

														<div class="col">
															<div class="form-group">
																<label>Data inserimento</label>
																<%
																java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
																%>
																<input class="form-control" type="date"
																	name="data_nascita" value="">
															</div>
														</div>
													
														<div class="col">
															<div class="form-group">
																<label>numero Ammissione</label> <input
																	class="form-control" type="text" placeholder="Numero Ammissione"
																	value="numero Ammissione " name="indirizzo">
															</div>
														</div>
														<div class="col">
															<div class="form-group">
																<label>Quiz</label> <input class="form-control"
																	type="text" pattern="[0-9]{5}" placeholder="" value=""
																	name="cap">
															</div>
														</div>
														</div>
												<div class="row">
												<div class="col">
													<div class="form-group">
														<label>Descrizione</label> <input class="form-control"
															type="tel" placeholder="" value="" name="telefono">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col">
													<div class="form-group">
														<label>Stato</label> <input class="form-control"
															type="text" placeholder="" value="" name="stato">
													</div>
												</div>
	
											</div>
									
										<div class="row">
											<div class="col d-flex justify-content-end">
												<button class="btn btn-primary" type="submit">Salva</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</main>
</body>
</html>
