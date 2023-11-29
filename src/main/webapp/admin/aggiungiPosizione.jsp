<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.candidatoDB.pw2.entity.*"%>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.*"%>
<%@ page import="com.servlets.pw2.controller.ErrorManager"%>
<%@ page isELIgnored="false"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<%
ArrayList<Citta> cities = new CittaIMPL().getAllCitta();
ArrayList<Regione> regioni = new RegioneIMPL().getAllRegioni();
QuizIMPL quizImpl = new QuizIMPL();
ArrayList<Quiz> quiz = quizImpl.getAllQuiz();
CategoriaPosizioneIMPL cpImpl = new CategoriaPosizioneIMPL();
ArrayList<CategoriaPosizione> catpos= cpImpl.getAllCategoriePosizioni();
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Nuova Posizione</title>
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
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" />


<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/css/homeuser.css" />

<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/css/classificacandidatura.css" />


</head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>





<body style="background-color: #d4d4d4">

	<jsp:include page="jspA/navbarHeaderAdmin.jsp" />

	<main style="margin-top: 58px">

		<div class="container mt-5">

			<div class="row flex-lg-nowrap">
				<div class="col">
					<div class="row">
						<div class="col mb-3">
							<div class="card mt-4">
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
											<div class="tab-pane active">
												<form method="post" action="${pageContext.request.contextPath}/gestionePosizioni">
													<select class="form-select" name="categoria" id="categoria"
															aria-label="Default select example">
															<option disabled selected>Categoria</option>
															<%
															for (CategoriaPosizione cp : catpos) {
															%>
															<option value="<%=cp.getId_categoria()+" "+ cp.getNome_categoria()%>"><%=cp.getNome_categoria()%></option>
															<%
															}
															%>
														</select><br>
													<div class="mb-3">
														<label for="ruolo" class="form-label">Ruolo</label>
														<input type="text" class="form-control " name="ruolo" id="ruolo" placeholder="Ruolo" required>
													</div>

													<div class="mb-3">
														<label for="n_ammissioni" class="form-label">Numero ammissioni</label><br>
														<input type="number" name="n_ammissioni" class="form-control" min="1" max="400" id="n_ammissioni" required/>
													</div>


													<div class="form-group mb-3" aria-labelledby="navbarDropdown"
														style="margin-right: 10px">
														<select class="form-select" name="quiz" id="quiz"
															aria-label="Default select example">
															<option disabled selected>Quiz</option>
															<%
															for (Quiz q : quiz) {
															%>
															<option value="<%=q.getId_quiz()+" "+q.getDescrizione()%>"><%=q.getDescrizione()%></option>
															<%
															}
															%>
														</select>
													</div>

													<div class="form-group mb-3" aria-labelledby="navbarDropdown"
														style="margin-right: 10px">
														<select class="form-select" name="citta" id="citta"
															aria-label="Default select example">
															<option disabled selected>Città</option>
															<%
															for (Regione r : regioni) {
															%>
															<optgroup label="<%=r.getNome()%>">
																<%
																for (Citta c : cities) {
																	if (c.getRegione().getNome().equals(r.getNome())) {
																%>
																<option value="<%=c.getId_citta()+" "+c.getRegione().getId_regione()+" "+c.getNome()%>"><%=c.getNome()%></option>
																<%
																}
																}
																%>
															</optgroup>
															<%
															}
															%>
														</select>
													</div>

													<div class="mb-3">
														<label for="data_inserimento" class="form-label">Data inserimento</label>
														<input type="date" class="form-control" name="data_inserimento" id="data_inserimento" onfocus="(this.type='date')" min="2023-01-01" max="2023-12-31"  required>
													</div>

													<div class="mb-3">
														<label for="descrizione" class="form-label">Descrizione</label>
														<textarea class="form-control mb-1" name="descrizione" id="descrizione"  rows="3" required></textarea>
													</div>


													<div class="form-check">
														<input class="form-check-input" type="radio" name="stato" id="aperta" value="aperta">
														<label class="form-check-label" for="aperta">
															Aperta
														</label>
													</div>

													<div class="form-check mb-3">
														<input class="form-check-input" type="radio" name="stato" id="chiusa" value="chiusa" checked>
														<label class="form-check-label" for="chiusa">
															Chiusa
														</label>
													</div>



											<div class="bottomRegister">
												<button type="submit" class="btn btn-primary">Conferma</button>
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