<%@ page import="com.candidatoDB.pw2.entity.Posizione"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.candidatoDB.pw2.entity.Citta"%>
<%@ page import="com.candidatoDB.pw2.entity.CategoriaPosizione"%>
<%@ page import="com.candidatoDB.pw2.entity.Quiz"%>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.PosizioneIMPL" %>
<%@ page import="java.util.ArrayList" %>
<%@ page isELIgnored="false"%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	PosizioneIMPL posizioneIMPL = new PosizioneIMPL();
	ArrayList<Posizione> posizioni = new ArrayList<>();
	if(request.getAttribute("risultatiRicerca")==null){
		 posizioni = posizioneIMPL.getAllPosizioni();
	}else{
		posizioni = (ArrayList<Posizione>) request.getAttribute("risultatiRicerca");
	}

	System.out.println(posizioni);
%>

<html>
<head>
<title>Ricerca Posizioni</title>
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


	<link rel="stylesheet" type="text/css" media="screen" href="../css/ricerca_posizioni.css" />


</head>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>

<body style="background-color: #d4d4d4">


	<jsp:include page="jsp/navbarHeader.jsp" />

	<div
		style="display: flex; justify-content: center; align-items: center; padding-top: 10%; flex-direction: column">
		<h1>Ricerca Posizioni</h1>

		<form
			action="${pageContext.request.contextPath}/RicercaPosizioniServlet"
			method="post">
			<div class="form-group">
				<label for="ruolo">Ruolo:</label> <select name="ruolo" id="ruolo">
					<option value="">Tutti</option>
					<option value="Sistemista">Sistemista</option>
					<option value="Web Developer">Web Developer</option>
					<option value="Java Developer">Java Developer</option>
					<option value="Front-End Developer">Front-End Developer</option>
					<option value="Back-End Developer">Back-End Developer</option>
				</select>
			</div>

			<div class="form-group">
				<label for="citta">Città:</label> <select name="citta" id="citta">
					<option value="">Tutte</option>
					<option value="1">Genova</option>
					<option value="2">Milano</option>
					<option value="13">Roma</option>
					<option value="4">Napoli</option>
					<option value="5">Lodi</option>
					<option value="6">Torino</option>
					<option value="7">Venezia</option>
					<option value="8">Firenze</option>
					<option value="9">Bologna</option>
				</select>
			</div>


			<div class="form-group">
				<label for="categoria">Categoria Posizione:</label> <select
					name="categoria" id="categoria">
					<option value="">Tutte</option>
					<option value="1">bella desc</option>
					<option value="2">desc 2</option>
					<option value="3">Sviluppo Web</option>
					<option value="4">Testing Web</option>

				</select>
			</div>


			<button type="submit" class="btn btn-primary">Cerca</button>
		</form>

	</div>

	<main style="margin-top: 58px">
		<div class="container pt-3">
			<div class="container">
				<div class="row">


					<%
						for(Posizione p : posizioni){
					%>

							<div class="card col-lg-4 col-md-6 col-12 mt-4 pt-2 d-flex  align-items-stretch" style=" background-color: #d4d4d4; border: none">
								<div class="slide slide1 ">
									<div class="content  shadow">

											<div class="card-body p-4 bg-light">
												<span class="badge rounded-pill bg-primary float-md-end mb-3 mb-sm-0"><%=p.getCategoria().getNome_categoria()%></span>
												<h5><%=p.getRuolo()%></h5>
												<div class="mt-3">
													<span class="text-muted d-block"><i class="bi bi-calendar-check-fill m-1"></i><%=p.getData_inserimento()%></span>
													<span class="text-muted d-block"><i class="bi bi-geo-alt-fill m-1"></i><%=p.getCitta().getNome()%></span>
												</div>

												<div class="mt-3">
													<a href="#" class="btn btn-primary">Candidati</a>
												</div>
											</div>

									</div>
								</div>
								<div class="slide slide2">
									<div class="content">
										<p><%=p.getDescrizione()%></p>
									</div>
								</div>
							</div>

					<%
						};
					%>

				</div>
			</div>
		</div>
	</main>


</body>
</html>
