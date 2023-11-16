<%@ page import="com.servlets.pw2.controller.ErrorManager"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="com.candidatoDB.pw2.entity.Utente"%>
<%@ page import="com.candidatoDB.pw2.entity.Citta"%>
<%@ page import="com.candidatoDB.pw2.entity.Regione"%>
<%@ page import="com.candidatoDB.pw2.entity.Esperienza"%>
<%@ page import="com.candidatoDB.pw2.entity.Istruzione"%>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.RegioneIMPL"%>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.IstruzioneIMPL"%>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.EsperienzaIMPL"%>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.UtenteIMPL"%>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.CittaIMPL"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
Utente utente = (Utente) session.getAttribute("utente");
UtenteIMPL utenteIMPL = new UtenteIMPL();

Utente IdUtente = utenteIMPL.findById(utente.getId_user());

Esperienza esperienza = (Esperienza) session.getAttribute("esperienza");

EsperienzaIMPL esperienzeUtente = new EsperienzaIMPL();
List<Esperienza> esperienze = esperienzeUtente.getAllExperience(IdUtente.getId_user());

IstruzioneIMPL istruzioneUtente = new IstruzioneIMPL();
List<Istruzione> istruzioni = istruzioneUtente.getAllInstruction(IdUtente.getId_user());

for (Esperienza test : esperienze) {
	System.out.println(test + "");
}

for (Istruzione test2 : istruzioni) {
	System.out.println(test2 + "");
}

//ArrayList<Regione> regioni = new RegioneIMPL().getAllRegioni();

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>



<html>

<head>
<title>Curriculum</title>
<!--  <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logoPag.png" style="border-radius: 10px"> -->
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

<body style="background-color: #d4d4d4">

	<jsp:include page="jsp/navbarHeader.jsp" />



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


									<div class="e-experience">
										<div class="row justify-content-center">
											<div class="col-12 col-sm-auto mb-3">
												<%
												if (utente.getCV() != null) {
												%>
												<img
													src=<%=request.getContextPath() + "/img/cv" + utente.getCV()%>
													alt="" height="150" class="rounded-3">
												<%
												} else {
												%>
												<i class="bi bi-person-circle"
													style="margin-right: 5px; font-size: 150px"></i>
												<%
												}
												%>
											</div>
										</div>

										<div class="d-flex justify-content-center">
											<label for="fileUpload"
												class="file-upload btn btn-primary  rounded-pill shadow"><i
												class="bi bi-upload"></i> Cambia il Cv <input
												id="fileUpload" type="file" accept="image/*" name="cv"
												form="modifica_curriculum" style="display: none"> </label>
										</div>
										<form class="form" method="post"
											action="${pageContext.request.contextPath}/curriculumUtente"
											enctype='multipart/form-data'>
											<div class="container">

												<%
													for (Esperienza espe : esperienze) {
													%>

												<div class="tab-content pt-3">
													<div class="tab-pane active">
														<div class="row">
															<div class="col">
																<div class="row">
																	<div class="col">
																		<div class="form-group">
																			<label>Descrizione attività</label> <input
																				class="form-control" type="" name="descAttivita"
																				placeholder=<%=espe.getDescrizione_attivita()%>
																				value=<%=espe.getDescrizione_attivita()%> required>
																		</div>
																	</div>
																	<div class="col">
																		<div class="form-group">
																			<label>Azienda</label> <input class="form-control"
																				type="text" name="azienda"
																				placeholder=<%=espe.getAzienda()%>
																				value=<%=espe.getAzienda()%> required>
																		</div>
																	</div>
																	<div class="col">
																		<div class="form-group">
																			<label>Data inizio</label> <input
																				class="form-control" type="date" name="dataInizio"
																				placeholder=<%=espe.getData_inizio()%>
																				value=<%=espe.getData_inizio()%> required>
																		</div>
																	</div>
																	<div class="col">
																		<div class="form-group">
																			<label>Data fine</label> <input class="form-control"
																				type="date" name="dataFine"
																				placeholder=<%=espe.getData_fine()%>
																				value=<%=espe.getData_fine()%> required>
																		</div>
																	</div>
																	<div class="col">
																		<div class="form-group">
																			<label>Anni</label> <input class="form-control"
																				type="number" name="anni"
																				placeholder=<%=espe.getAnni()%>
																				value=<%=espe.getAnni()%> required>
																		</div>
																	</div>
																	<div class="col">
																		<div class="form-group">
																			<label>Settore</label> <input class="form-control"
																				type="text" name="settore"
																				placeholder=<%=espe.getSettore()%>
																				value=<%=espe.getSettore()%> required>
																		</div>
																	</div>
																	<div class="col">
																		<div class="form-group">
																			<label>Contratto</label> <input class="form-control"
																				type="text" name="contratto"
																				placeholder=<%=espe.getTipo_contratto()%>
																				value=<%=espe.getTipo_contratto()%> required>
																		</div>
																	</div>
																	<div class="col">
																		<div class="form-group">
																			<label>RAL</label> <input class="form-control"
																				type="number" name="contratto"
																				placeholder=<%=espe.getRal()%>
																				value=<%=espe.getRal()%> required>
																		</div>
																	</div>



																</div>

																<%
																	;
																	%>
															</div>
																</div>
																		</div>
																	</div>
																</div>
															</div>

															<%
													}
													%>



															<div class="container">

																<%
													for (Istruzione istru : istruzioni) {
													%>

																<div class="tab-content pt-3">
																	<div class="tab-pane active">
																		<div class="row">
																			<div class="col">
																				<div class="row">
																					<div class="col">
																						<div class="form-group">
																							<label>Descrizione istruzione</label> <input
																								class="form-control" type="text"
																								name="descIstruzione"
																								placeholder=<%=istru.getDescrizione_istruzione()%>
																								value=<%=istru.getDescrizione_istruzione()%>
																								required>
																						</div>
																					</div>
																					<div class="col">
																						<div class="form-group">
																							<label>Grado istruzione</label> <input
																								class="form-control" type="text" name="grado"
																								placeholder=<%=istru.getGrado()%>
																								value=<%=istru.getGrado()%> required>
																						</div>
																					</div>
																					<div class="col">
																						<div class="form-group">
																							<label>Data inizio</label> <input
																								class="form-control" type="date"
																								name="dataInizio"
																								placeholder=<%=istru.getData_inizio()%>
																								value=<%=istru.getData_inizio()%> required>
																						</div>
																					</div>
																					<div class="col">
																						<div class="form-group">
																							<label>Data fine</label> <input
																								class="form-control" type="date" name="dataFine"
																								placeholder=<%=istru.getData_fine()%>
																								value=<%=istru.getData_fine()%> required>
																						</div>
																					</div>
																					<div class="col">
																						<div class="form-group">
																							<label>Valutazione finale</label> <input
																								class="form-control" type="text"
																								name="valutazione"
																								placeholder=<%=istru.getValutazione()%>
																								value=<%=istru.getValutazione()%> required>
																						</div>
																					</div>




																				</div>

																				<%
																	;
																	%>
																			</div>
																		</div>
																	</div>
																</div>
															</div>

															<%
													}
													%>
															<div class="row">
																<div class="col d-flex justify-content-end">
																	<button class="btn btn-primary" type="submit">Salva</button>
																</div>
										</form>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
</body>
</html>