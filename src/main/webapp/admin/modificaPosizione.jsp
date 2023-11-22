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
Posizione posizione = new Posizione();

String idPosizioneParam = request.getParameter("idPosizione");

if (idPosizioneParam != null) {
	int idPosizione = Integer.parseInt(idPosizioneParam);
	posizione = posizioneIMPL.getPosizioneById(idPosizione);
}

ArrayList<Regione> regioni = new RegioneIMPL().getAllRegioni();

ArrayList<Citta> cities = new CittaIMPL().getAllCitta();

QuizIMPL quizImpl = new QuizIMPL();
ArrayList<Quiz> quiz = quizImpl.getAllQuiz();

ArrayList<String> ruoli = posizioneIMPL.getAllRuoli();

CategoriaPosizioneIMPL categoriaPosizioneIMPL = new CategoriaPosizioneIMPL();
ArrayList<CategoriaPosizione> categorie_posizioni = categoriaPosizioneIMPL.getAllCategoriePosizioni();
%>

<html>
<head>

<title>Modifica Posizione</title>
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/img/logoPag.png"
	style="border-radius: 10px">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
</head>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/homeuser.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/modificaPosizione.css">

<body style="background-color: #d4d4d4;">




	<main style="margin: 50px; padding: 0;">

		<div class="container mt-5">

			<div class="row flex-lg-nowrap">
				<div class="col">
					<div class="row">
						<div class="col mb-3">
							<div class="card mt-4" style="border: 2px solid blue;">
								<div class="card-body">
									<%
									if (!ErrorManager.getSUccessMessage((HttpServletRequest) request).isEmpty()) {
									%>
									<div class="alert alert-success">
										<%=ErrorManager.getSUccessMessage((HttpServletRequest) request)%>
									</div>
									<%
									}
									;
									%>
									<%
									if (!ErrorManager.getErrorMessage((HttpServletRequest) request).isEmpty()) {
									%>
									<div class="alert alert-danger">
										<%=ErrorManager.getErrorMessage((HttpServletRequest) request)%>
									</div>
									<%
									}
									;
									%>
									<%
									if (!ErrorManager.getOtherMessage((HttpServletRequest) request).isEmpty()) {
									%>
									<div class="alert alert-warning">
										<%=ErrorManager.getOtherMessage((HttpServletRequest) request)%>
									</div>
									<%
									}
									;
									%>

									<div class="e-profile">

										<div class="tab-content pt-3">
											<div class="tab-pane active justify-content-center">
												<form class="form" method="post"
													action="${pageContext.request.contextPath}/updatePosizioni">
													<input type="hidden" name="id_posizione" value="<%=posizione.getId_posizione()%>">
													<div class="column">
														<div class="row">
															<div class="form-group">
																<label>Categoria</label> <select class="form-select" name="categoria" aria-label="Default select example">

																	<option value="<%=posizione.getCategoria().getId_categoria()%>" selected><%=posizione.getCategoria().getNome_categoria()%></option>

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
															<div class="form-group">
																<label>Ruolo</label> <select class="form-select"
																	name="ruolo" aria-label="Default select example">
																	<option selected><%=posizione.getRuolo()%></option>

																	<%
																	for (String r : ruoli) {
																	%>
																	<option value="<%=r%>"><%=r%></option>
																	<%
																	}
																	%>
																</select>
															</div>
														</div>
														<div class="row">
															<div class="form-group">
																<label>Stato</label> <input class="form-control"
																	type="text" name="stato"
																	placeholder="<%=posizione.getStato()%>"
																	value=<%=posizione.getStato()%> required>
															</div>
														</div>
														<div class="row">
															<div class="form-group">
																<%
																Citta citta = (posizione.getCitta() != null) ? posizione.getCitta() : null;
																%>
																<label>Città</label> <select class="form-select"
																	aria-label="Default select example" name="citta">

																	<%
																	if (citta != null) {
																	%>
																	<option
																		value="<%=citta.getId_citta() + " " + citta.getRegione().getId_regione() + " " + citta.getNome()%>"
																		selected><%=posizione.getCitta().getNome()%></option>
																	<%
																	} else {
																	%>
																	<option selected style="display: none" value="">Seleziona
																		una città</option>
																	<%
																	}
																	;
																	%>
																	<%
																	for (Regione r : regioni) {
																	%>
																	<optgroup label="<%=r.getNome()%>">
																		<%
																		for (Citta c : cities) {
																			if (c.getRegione().getNome().equals(r.getNome())) {
																		%>
																		<option
																			value="<%=c.getId_citta() + " " + r.getId_regione() + " " + c.getNome()%>"><%=c.getNome()%></option>
																		<%
																		}
																		}
																		}
																		%>
																	
																</select>
															</div>
														</div>
														<div class="row">
															<div class="form-group">
																<label>Descrizione</label>
																<textarea class="form-control" type="text" name="desc"
																	placeholder="<%=posizione.getDescrizione()%>" required
																	style="height: 120px; max-height: 300px;"></textarea>
															</div>
														</div>
														<div class="row">
															<div class="form-group">
																<label>Numero ammissioni</label> <input
																	class="form-control" type="text" name="ammissioni"
																	placeholder="<%=posizione.getN_ammissioni()%>"
																	value=<%=posizione.getN_ammissioni()%> required>
															</div>
														</div>
														<div class="row">
															<div class="form-group">
																<label>Quiz </label> <select class="form-select"
																	name="quiz" aria-label="Default select example">
																	<option value="<%=posizione.getQuiz().getId_quiz()%>" selected><%=posizione.getQuiz().getDescrizione()%></option>
																	<%
																	for (Quiz q : quiz) {
																	%>
																	<option value="<%=q.getId_quiz()%>"><%=q.getDescrizione()%></option>
																	<%
																	}
																	%>
																</select>
															</div>
														</div>
														<div class="row">
															<div class="form-group">
																<label>Aggiorna data</label> <input class="form-control"
																	type="date" name="data"
																	placeholder="<%=posizione.getData_inserimento()%>"
																	value=<%=posizione.getData_inserimento()%> required>
															</div>
														</div>


														<div class="row">
															<div class="col d-flex justify-content-center">
																<button class="btn btn-primary" type="submit">Salva</button>
															</div>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</main>

</body>
</html>
