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

//Esperienza esperienza = (Esperienza) session.getAttribute("esperienza");

EsperienzaIMPL esperienzeUtente = new EsperienzaIMPL();
List<Esperienza> esperienze = esperienzeUtente.getAllExperience(IdUtente.getId_user());

IstruzioneIMPL istruzioneUtente = new IstruzioneIMPL();
List<Istruzione> istruzioni = istruzioneUtente.getAllInstruction(IdUtente.getId_user());

ArrayList<Regione> regioni = new RegioneIMPL().getAllRegioni();

ArrayList<Citta> cities = new CittaIMPL().getAllCitta();



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
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logoPag.png" style="border-radius: 10px">
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>




<body style="background-color: #d4d4d4">

	<jsp:include page="jsp/navbarHeader.jsp" />



	<main style="margin-top: 58px">

		<div class="container mt-5" >

			<div class="row flex-lg-nowrap">
				<div class="col">
					<div class="row">
						<div class="col mb-3">
							<div class="card mt-4">
								<div class="card-body" >
									<%
										if(!ErrorManager.getSUccessMessage((HttpServletRequest) request).isEmpty()){
									%>
									<div class="alert alert-success">
										<%= ErrorManager.getSUccessMessage((HttpServletRequest) request)%>
									</div>
									<%
										};
									%>
									<%
										if(!ErrorManager.getErrorMessage((HttpServletRequest) request).isEmpty()){
									%>
									<div class="alert alert-danger">
										<%= ErrorManager.getErrorMessage((HttpServletRequest) request)%>
									</div>
									<%
										};
									%>
									<%
										if(!ErrorManager.getOtherMessage((HttpServletRequest) request).isEmpty()){
									%>
									<div class="alert alert-warning">
										<%= ErrorManager.getOtherMessage((HttpServletRequest) request)%>
									</div>
									<%
										};
									%>

									<form class="form" method="post" action="${pageContext.request.contextPath}/curriculumUtente" id="modifica_istruzione"  enctype='multipart/form-data'>


									<div class="e-profile">
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
											<div class="d-flex justify-content-center">
												<label for="fileUpload" class="file-upload btn btn-primary  rounded-pill shadow"><i class="bi bi-upload"></i> Aggiorna il tuo CV
													<input id="fileUpload" type="file" accept="image/*" name="foto_profilo" form="modifica_istruzione" style="display: none">
												</label>
											</div>

													<div class="col d-flex justify-content-end">
														<button class="btn btn-primary" type="submit" form="modifica_istruzione">Salva</button>
													</div>
											</div>
											<div class="mb-2"><strong>Istruzioni</strong></div>
											<div class="tab-content pt-3" id="appendi_istruzione">
												<div class="tab-pane active">

												<%
													for(Istruzione istruzione : istruzioni){
												%>

													<div class="row">
														<div class="col">
															<div class="row">

																<div class="col">
																	<div class="form-group">
																		<label for="descrizione_istruzione" class="form-label">Descrizione Istruzione</label>
																		<textarea class="form-control" id="descrizione_istruzione" rows="3" name="descrizione_istruzione"><%=istruzione.getDescrizione_istruzione()%></textarea>
																	</div>
																</div>
																<div class="col">
																	<div class="form-group">
																		<label>Grado</label>
																		<input class="form-control" type="text" name="grado_istruzione"  value=<%=istruzione.getGrado()%>>
																	</div>
																</div>
																<div class="row">
																	<div class="col">
																		<div class="form-group">
																			<label>Valutazione</label>
																			<input class="form-control" type="text" name="valutazione_istruzione"  value=<%=istruzione.getValutazione()%> >
																		</div>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col">
																	<div class="form-group">
																		<label>Data inizio</label>
																		<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ"); %>
																		<input class="form-control" type="date" name="inizio_istruzione"  value=<%=istruzione.getData_inizio()%>>
																	</div>
																</div>
																<div class="col">
																	<div class="form-group">
																		<label>Data fine (se prevista)</label>
																		<%java.text.DateFormat df2 = new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ"); %>
																		<input class="form-control" type="date" name="fine_istruzione"  value=<%=istruzione.getData_fine()%>>
																	</div>
																</div>
															</div>
															<div class="row row-cols-3">
																<div class="col">
																	<div class="form-group">
																		<%Citta citta = (new CittaIMPL().getCittaById(istruzione.getId_citta()) !=null)? new CittaIMPL().getCittaById(istruzione.getId_citta()) : null;

																		%>
																		<label>Città di nascita</label>
																		<select class="form-select" aria-label="Default select example" name="citta">

																			<%
																				if(citta!=null){

																			%>
																			<option value="<%=citta.getId_citta()+" "+citta.getRegione().getId_regione()+" "+citta.getNome()%>" selected><%=citta.getNome()%></option>
																			<%
																			}else{
																			%>
																			<option selected style="display: none" value="">Seleziona una città</option>
																			<%
																				};
																			%>
																			<%
																				for(Regione r : regioni) {
																			%>
																			<optgroup label="<%=r.getNome()%>">
																					<%
                                                                                    for(Citta c : cities){
                                                                                     if(c.getRegione().getNome().equals(r.getNome())){
                                                                                         %>
																				<option value="<%=c.getId_citta()+" "+r.getId_regione()+" "+c.getNome()%>"><%=c.getNome()%></option>
																					<%
                                                                                     }
                                                                                    }
                                                                            }
                                                                        %>


																		</select>
																	</div>
																</div>
															</div>
														</div>
													</div>

													<div class="row">
														<div class="col d-flex justify-content-end">
															<button class="btn btn-primary" onclick="CloneIstruzione()" id="duplica_istruzione">Aggiungi Istruzione</button>
														</div>
													</div>


												<%
													};
												%>
												</div>
											</div>
										</div>

									<div class="mb-2"><strong>Esperienze</strong></div>


									<div class="tab-content pt-3" id="appendi_esperienza">

										<div class="tab-pane active">

											<%
												for(Esperienza esperienza : esperienze){
											%>

												<div class="row">
													<div class="col">
														<div class="row">

															<div class="col">
																<div class="form-group">
																	<label for="descrizione_istruzione" class="form-label">Descrizione Esperienza</label>
																	<textarea class="form-control" id="descrizione_esperienza" rows="3" name="descrizione_esperienza"><%=esperienza.getDescrizione_attivita()%></textarea>
																</div>
															</div>
															<div class="col">
																<div class="form-group">
																	<label>Anni</label>
																	<input class="form-control" type="text" name="anni_esperienza"  value=<%=esperienza.getAnni()%> >
																</div>
															</div>
															<div class="row">
																<div class="col">
																	<div class="form-group">
																		<label>Azienda</label>
																		<input class="form-control" type="text" name="azienda"  value=<%=esperienza.getAzienda()%> >
																	</div>
																</div>
																<div class="col">
																	<div class="form-group">
																		<label>Tipo Contratto</label>
																		<input class="form-control" type="text" name="tipo_contratto"  value=<%=esperienza.getTipo_contratto()%> >
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col">
																	<div class="form-group">
																		<label>Posizione Lavorativa</label>
																		<input class="form-control" type="text" name="posizione_lavorativa"  value=<%=esperienza.getPosizione_lavorativa()%> >
																	</div>
																</div>
																<div class="col">
																	<div class="form-group">
																		<label>Settore</label>
																		<input class="form-control" type="text" name="settore"  value=<%=esperienza.getSettore()%> >
																	</div>
																</div>
																<div class="col">
																	<div class="form-group">
																		<label>RAL</label>
																		<input class="form-control" type="text" name="ral"  value=<%=esperienza.getRal()%> >
																	</div>
																</div>

															</div>

														</div>
														<div class="row">
															<div class="col">
																<div class="form-group">
																	<label>Data inizio</label>
																	<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ"); %>
																	<input class="form-control" type="date" name="inizio_istruzione"  value=<%=esperienza.getData_inizio()%>>
																</div>
															</div>
															<div class="col">
																<div class="form-group">
																	<label>Data fine (se prevista)</label>
																	<%java.text.DateFormat df2 = new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ"); %>
																	<input class="form-control" type="date" name="fine_istruzione"  value=<%=esperienza.getData_fine()%>>
																</div>
															</div>
														</div>
														<div class="row row-cols-3">
															<div class="col">
																<div class="form-group">
																	<%Citta citta = (esperienza.getId_citta() !=null)? esperienza.getId_citta() : null;
																		System.out.println(citta);
																	%>
																	<label>Città di nascita</label>
																	<select class="form-select" aria-label="Default select example" name="citta">

																		<%
																			if(citta!=null){

																		%>
																		<option value="<%=citta.getId_citta()+" "+citta.getRegione().getId_regione()+" "+citta.getNome()%>" selected><%=citta.getNome()%></option>
																		<%
																		}else{
																		%>
																		<option selected style="display: none" value="">Seleziona una città</option>
																		<%
																			};
																		%>
																		<%
																			for(Regione r : regioni) {
																		%>
																		<optgroup label="<%=r.getNome()%>">
																				<%
                                                                                    for(Citta c : cities){
                                                                                     if(c.getRegione().getNome().equals(r.getNome())){
                                                                                         %>
																			<option value="<%=c.getId_citta()+" "+r.getId_regione()+" "+c.getNome()%>"><%=c.getNome()%></option>
																				<%
                                                                                     }
                                                                                    }
                                                                            }
                                                                        %>


																	</select>
																</div>
															</div>
														</div>
													</div>
												</div>


											<div class="row">
												<div class="col d-flex justify-content-end">
													<button class="btn btn-primary" onclick="CloneEsperienza()" id="duplica_esperienza">Aggiungi Esperienza</button>
												</div>
											</div>


											<%
												};
											%>

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




	</main>


	<script>

		function CloneIstruzione() {

			var $clone = $('#appendi_istruzione').clone();
			$clone.find('input, textarea, select').val('');
			$clone.appendTo('#appendi_istruzione');


			document.getElementById('duplica_istruzione').style.visibility='hidden';

		}

		function CloneEsperienza() {

			var $clone = $('#appendi_esperienza').clone();
			$clone.find('input, textarea, select').val('');
			$clone.appendTo('#appendi_esperienza');


			document.getElementById('duplica_esperienza').style.visibility='hidden';

		}


	</script>

</body>
</html>