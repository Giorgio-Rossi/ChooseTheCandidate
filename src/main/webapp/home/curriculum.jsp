<%@ page import="com.servlets.pw2.controller.ErrorManager"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.candidatoDB.pw2.entity.*" %>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.*" %>

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

ArrayList<Skill> skills = (ArrayList<Skill>) new SkillIMPL().findAll();

ArrayList<Skill> skill_utente = new UtenteSkillsIMPL().getAllUserSkillVerifiedOrNot(utente, true);


/*
for (Esperienza test : esperienze) {
	System.out.println(test + "");
}

for (Istruzione test2 : istruzioni) {
	System.out.println(test2 + "");
}
*/


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

<link rel="stylesheet"
	  href="${pageContext.request.contextPath}/css/cv.css">

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

												<i class="bi bi-file-earmark-person-fill"
												   style="margin-right: 5px; font-size: 150px"></i>

											</div>
											<div class="d-flex justify-content-center">
												<label for="fileUpload" class="file-upload btn btn-primary  rounded-pill shadow"><i class="bi bi-upload"></i> Aggiorna il tuo CV
													<input id="fileUpload" type="file" accept="image/*,application/pdf" name="cv" form="modifica_istruzione" style="display: none">
													<%
														if(utente.getCV() != null){
													%>
													<%=utente.getCV()%>
													<%
														}
													%>
												</label>

											</div>

													<div class="col d-flex justify-content-end">
														<button class="btn btn-success" type="submit" form="modifica_istruzione">Salva</button>
													</div>
											</div>
											<div class="mb-2"><strong>Istruzioni</strong></div>
											<div class="tab-content pt-3">
												<div class="tab-pane active">

												<%
													for(Istruzione istruzione : istruzioni){
												%>

													<div class="row" id="appendi_istruzione">
														<div class="col">
															<div class="row">
																<input type="hidden" id="custId" name="id_istruzione" value="<%=istruzione.getId_istruzione()%>">

																<div class="col">
																	<div class="form-group">
																		<label for="descrizione_istruzione" class="form-label">Descrizione Istruzione</label>
																		<textarea class="form-control" id="descrizione_istruzione" rows="3" name="descrizione_istruzione <%=istruzione.getId_istruzione()%>"><%=istruzione.getDescrizione_istruzione()%></textarea>
																	</div>
																</div>
																<div class="col">
																	<div class="form-group">
																		<label>Grado</label>
																		<input class="form-control" type="text"  id="grado_istruzione" name="grado_istruzione <%=istruzione.getId_istruzione()%>"  value=<%=istruzione.getGrado()%>>
																	</div>
																</div>
																<div class="row row-cols-5">
																	<div class="col">
																		<div class="form-group">
																			<label>Valutazione</label>
																			<input class="form-control" type="text"  id="valutazione_istruzione" name="valutazione_istruzione <%=istruzione.getId_istruzione()%>"  value=<%=istruzione.getValutazione()%> >
																		</div>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col">
																	<div class="form-group">
																		<label>Data inizio</label>
																		<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ"); %>
																		<input class="form-control"  id="inizio_istruzione" type="date" name="inizio_istruzione <%=istruzione.getId_istruzione()%>"  value=<%=istruzione.getData_inizio()%>>
																	</div>
																</div>
																<div class="col">
																	<div class="form-group">
																		<label>Data fine (se prevista)</label>
																		<%java.text.DateFormat df2 = new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ"); %>
																		<input class="form-control" id="fine_istruzione" type="date" name="fine_istruzione <%=istruzione.getId_istruzione()%>"  value=<%=istruzione.getData_fine()%>>
																	</div>
																</div>
															</div>
															<div class="row row-cols-3">
																<div class="col">
																	<div class="form-group">
																		<%Citta citta = (istruzione.getId_citta() != 0)? new CittaIMPL().getCittaById(istruzione.getId_citta()) : null;

																		%>
																		<label>Sede</label>
																		<select class="form-select" id="sede_istruzione" aria-label="Default select example" name="sede_istruzione <%=istruzione.getId_istruzione()%>">

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
																				<option value="<%=c.getId_citta()+" "+r.getId_regione()+" "+c.getNome()+" "+istruzione.getId_istruzione()%>" name="sede_istruzione <%=istruzione.getId_istruzione()%>"><%=c.getNome()%></option>
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




												<%
													};
												%>
												</div>
											</div>
										</div>

									<div class="mb-2"><strong>Esperienze</strong></div>


									<div class="tab-content pt-3">

										<div class="tab-pane active">

											<%
												for(Esperienza esperienza : esperienze){
											%>

												<div class="row" id="appendi_esperienza">
													<div class="col">
														<div class="row" >
															<input type="hidden" id="custId2" name="id_esperienza" value="<%=esperienza.getId_esperienza()%>">

															<div class="col">
																<div class="form-group">
																	<label for="descrizione_istruzione" class="form-label">Descrizione Esperienza</label>
																	<textarea class="form-control" id="descrizione_esperienza" rows="3" name="descrizione_esperienza <%=esperienza.getId_esperienza()%>"><%=esperienza.getDescrizione_attivita()%></textarea>
																</div>
															</div>
															<div class="col">
																<div class="form-group">
																	<label>Anni</label>
																	<input class="form-control" id="anni_esperienza" type="text" name="anni_esperienza <%=esperienza.getId_esperienza()%>"  value=<%=esperienza.getAnni()%> >
																</div>
															</div>
															<div class="row">
																<div class="col">
																	<div class="form-group">
																		<label>Azienda</label>
																		<input class="form-control" id="azienda_esperienza" type="text" name="azienda_esperienza <%=esperienza.getId_esperienza()%>"  value=<%=esperienza.getAzienda()%> >
																	</div>
																</div>
																<div class="col">
																	<div class="form-group">
																		<label>Tipo Contratto</label>
																		<input class="form-control" type="text" id="contratto_esperienza" name="contratto_esperienza <%=esperienza.getId_esperienza()%>"  value=<%=esperienza.getTipo_contratto()%> >
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col">
																	<div class="form-group">
																		<label>Posizione Lavorativa</label>
																		<input class="form-control" type="text" id="posizione_esperienza" name="posizione_esperienza <%=esperienza.getId_esperienza()%>"  value=<%=esperienza.getPosizione_lavorativa()%> >
																	</div>
																</div>
																<div class="col">
																	<div class="form-group">
																		<label>Settore</label>
																		<input class="form-control" type="text" id="settore_esperienza" name="settore_esperienza <%=esperienza.getId_esperienza()%>"  value=<%=esperienza.getSettore()%> >
																	</div>
																</div>
																<div class="col">
																	<div class="form-group">
																		<label>RAL</label>
																		<input class="form-control" type="text" id="ral_esperienza" name="ral_esperienza <%=esperienza.getId_esperienza()%>"  value=<%=esperienza.getRal()%> >
																	</div>
																</div>

															</div>

														</div>
														<div class="row">
															<div class="col">
																<div class="form-group">
																	<label>Data inizio</label>
																	<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ"); %>
																	<input class="form-control" type="date" id="inizio_esperienza" name="inizio_esperienza <%=esperienza.getId_esperienza()%>"  value=<%=esperienza.getData_inizio()%>>
																</div>
															</div>
															<div class="col">
																<div class="form-group">
																	<label>Data fine (se prevista)</label>
																	<%java.text.DateFormat df2 = new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ"); %>
																	<input class="form-control" type="date" id="fine_esperienza" name="fine_esperienza <%=esperienza.getId_esperienza()%>"  value=<%=esperienza.getData_fine()%>>
																</div>
															</div>
														</div>
														<div class="row row-cols-3">
															<div class="col">
																<div class="form-group">
																	<%Citta citta = (esperienza.getId_citta() !=null)? esperienza.getId_citta() : null;
																		System.out.println(citta);
																	%>
																	<label>Sede</label>
																	<select class="form-select" id="sede_esperienza" aria-label="Default select example" name="sede_esperienza <%=esperienza.getId_esperienza()%>">

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
																			<option name="sede_esperienza <%=esperienza.getId_esperienza()%>" value="<%=c.getId_citta()+" "+r.getId_regione()+" "+c.getNome()+" "+esperienza.getId_esperienza()%>"><%=c.getNome()%></option>
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





											<%
												};
											%>

										</div>
										</div>

									</form>

									<div class="row mb-1">
										<div class="col d-flex justify-content-end">
											<button class="btn btn-primary" onclick="CloneIstruzione()" id="duplica_istruzione">Aggiungi Istruzione</button>
										</div>
									</div>

									<div class="row">
										<div class="col d-flex justify-content-end">
											<button class="btn btn-primary" onclick="CloneEsperienza()" id="duplica_esperienza">Aggiungi Esperienza</button>
										</div>
									</div>

									<h2>Le tue Skills</h2>
									<div class="row row-cols-3 row-cols-lg-3 mb-lg-auto">
										<div class="col-4 col-lg-2">
											<div class="input-group rounded">
												<input type="search" id="textboxEmp" class="my-textbox form-control rounded" placeholder="Search" aria-label="Cerca Skill" aria-describedby="search-addon" />
												<span class="input-group-text border-0" id="search-addon">
													<i class="bi bi-search"></i>
										  		</span>
											</div>
											<div class="skillsMenu">
												<div class="no-results">Non ci sono skill con questo nome</div>

												<%
												for(Skill skill : skills){
												%>

												<div class="item">
													<p class="skill"><%=skill.getNome()%></p>
												</div>
												<%
													};
												%>

											</div>
										</div>

										<div class="row">
											<div class="col-sm m-1" id="p">
												<%
													for(Skill u_skill : skill_utente){
												%>
												<%=u_skill.getNome()%>
												<i class="bi bi-award-fill" style="font-size: 2rem"></i><br>
												<%
													};
												%>

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


	<script>

		var $noResults = $('.no-results');
		var $names = $(".skill");
		var $personsMenu = $('.skillsMenu');

		var $searchBox = $(".my-textbox").on('input', function() {
			var value = $(this).val().trim().toUpperCase();

			if (!value) {
				$personsMenu.hide();
				return;
			}

			var matches = $personsMenu.show().find('div').each(function() {
				var content = $(this).text().toUpperCase();
				$(this).toggle(content.indexOf(value) !== -1);
			});

			$noResults.toggle(matches.filter(':visible').length == 0);
		});

		$('.item').on('click', function() {
			var v = $searchBox.val($(this).find('.skill').text());

			var element3 = document.createElement("input");
			element3.type = "button";
			element3.name = "add";
			element3.value="Verifica la skill!";
			element3.className="btn btn-info btn-xs m-1";

			var element = document.createElement("h6");
			element.innerHTML = v.val();


			//document.getElementById("p").innerHTML+=v.val()
			document.getElementById("p").appendChild(element)
			document.getElementById("p").appendChild(element3)
			$personsMenu.hide();
		});





		function CloneIstruzione() {

			var $clone = $('#appendi_istruzione').clone();
			$clone.find('input, textarea, select').val('');


			$clone.find('#descrizione_istruzione').attr('name','descrizione_istruzione nuova')
			$clone.find('#grado_istruzione').attr('name','grado_istruzione nuova')
			$clone.find('#valutazione_istruzione').attr('name','valutazione_istruzione nuova')
			$clone.find('#inizio_istruzione').attr('name','inizio_istruzione nuova')
			$clone.find('#fine_istruzione').attr('name','fine_istruzione nuova')
			$clone.find('#sede_istruzione').attr('name','sede_istruzione nuova')


			$clone.find('input, textarea, select').attr('value', ' ');
			$clone.appendTo('#appendi_istruzione');

			document.getElementById('duplica_istruzione').style.visibility='hidden';
		}

		function CloneEsperienza() {

			var $clone = $('#appendi_esperienza').clone();
			$clone.find('input, textarea, select').val('');

			$clone.find('#descrizione_esperienza').attr('name','descrizione_esperienza nuova')
			$clone.find('#anni_esperienza').attr('name','anni_esperienza nuova')
			$clone.find('#azienda_esperienza').attr('name','azienda_esperienza nuova')
			$clone.find('#contratto_esperienza').attr('name','contratto_esperienza nuova')
			$clone.find('#posizione_esperienza').attr('name','posizione_esperienza nuova')
			$clone.find('#settore_esperienza').attr('name','settore_esperienza nuova')
			$clone.find('#ral_esperienza').attr('name','ral_esperienza nuova')
			$clone.find('#inizio_esperienza').attr('name','inizio_esperienza nuova')
			$clone.find('#fine_esperienza').attr('name','fine_esperienza nuova')
			$clone.find('#sede_esperienza').attr('name','sede_esperienza nuova')



			$clone.find('input, textarea, select').attr('value', ' ');
			$clone.appendTo('#appendi_esperienza');
			document.getElementById('duplica_esperienza').style.visibility='hidden';
		}


	</script>

</body>
</html>