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

<body style="background-color: #d4d4d4">




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
												<form class="form" method="post"
													action="${pageContext.request.contextPath}/updatePosizioni"
													enctype='multipart/form-data'>
													<div class="row">
														<div class="col">
															<div class="row">
																<div class="col">
																	<div class="form-group">
																		<label>Ruolo</label> <input class="form-control"
																			type="text" name="nome"
																			placeholder=<%=posizione.getRuolo()%>
																			value=<%=posizione.getRuolo()%> required>
																	</div>
																</div>
																<div class="col">
                                                                <div class="form-group">
                                                                    <label>Stato</label>
                                                                    <input class="form-control" type="text" name="stato" placeholder=<%=posizione.getStato()%> value=<%=posizione.getStato()%> required>
                                                                </div>
                                                            </div>
                                                           <div class="col">
                                                                <div class="form-group">
                                                                    <label>Citta</label>
                                                                    <input class="form-control" type="text" name="citta" placeholder=<%=posizione.getCitta().getNome()%> value=<%=posizione.getCitta().getNome()%> required>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>Descrizione</label>
                                                                    <input class="form-control" type="text" name="desc" placeholder=<%=posizione.getDescrizione()%> value=<%=posizione.getDescrizione()%> required>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>Numero ammissioni</label>
                                                                    <input class="form-control" type="text" name="ammissioni" placeholder=<%=posizione.getN_ammissioni()%> value=<%=posizione.getN_ammissioni()%> required>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>Data inserimento</label>
                                                                    <input class="form-control" type="date" name="data" placeholder=<%=posizione.getData_inserimento()%> value=<%=posizione.getData_inserimento()%> required>
                                                                </div>
                                                            </div>

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
					</div>
				</div>
			</div>
		</div>

	</main>

</body>
</html>
