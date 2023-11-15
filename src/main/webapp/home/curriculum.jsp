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

										<div class="container">

											<%
											for (Esperienza espe : esperienze) {
											%>

											<div class="card mb-3 shadow-lg">
												<div class="card-body">
													<div class="d-flex flex-column flex-lg-row">
														<%
														String initials = "";
														for (String s : espe.getPosizione_lavorativa().split(" ")) {
															initials += s.charAt(0);
														}
														%>
														<span class="avatar avatar-text rounded-3 me-4 mb-2"><%=initials%></span>
														<div class="row flex-fill">
															<div class="col-sm-5">
																<h4 class="h5"><%=espe.getSettore()%></h4>
																<span class="badge bg-primary m-1"><%=espe.getAzienda()%></span><span
																	class="badge bg-success"><i
																	class="bi bi-calendar-check-fill mt-2"> <%=espe.getTipo_contratto()%></i></span>
															</div>
															<div class="col-sm-4 py-2">
																<span class="badge bg-info"><%=espe.getData_inizio()%></span>
																<span class="badge bg-info"><%=espe.getData_fine()%></span>
															</div>
															<%
															if (espe.getUtente() != null) {
																
															%>
															<div class="col-sm-3 text-lg-end">
																<span class="badge bg-success"><%=espe.getDescrizione_attivita().toUpperCase()%></span>
															</div>
															<%
															} else {
															%>
															<div class="col-sm-3 text-lg-end">
																<span class="badge bg-danger"><%=espe.getDescrizione_attivita().toUpperCase()%></span>
															</div>
															<%
															}
															;
															%>

														</div>
													</div>
												</div>
											</div>

											<%
											}
											%>

										</div>

										<div class="container">

											<%
											for (Istruzione istru : istruzioni) {
											%>

											<div class="card mb-3 shadow-lg">
												<div class="card-body">
													<div class="d-flex flex-column flex-lg-row">
														<%
														String initials = "";
														for (String s : istru.getDescrizione_istruzione().split(" ")) {
															initials += s.charAt(0);
														}
														%>
														<span class="avatar avatar-text rounded-3 me-4 mb-2"><%=initials%></span>
														<div class="row flex-fill">
															<div class="col-sm-5">
																<h4 class="h5"><%=istru.getGrado()%></h4>
																<span class="badge bg-primary m-1"><%=istru.getValutazione()%></span><span
																	class="badge bg-success"><i
																	class="bi bi-calendar-check-fill mt-2"> <%=istru%></i></span>
															</div>
															<div class="col-sm-4 py-2">
																<span class="badge bg-info"><%=istru.getData_inizio()%></span>
																<span class="badge bg-info"><%=istru.getData_fine()%></span>
															</div>

															<%
															;
															%>

														</div>
													</div>
												</div>
											</div>

											<%
											}
											%>

										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
</body>
</html>
