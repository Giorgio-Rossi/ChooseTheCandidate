<%@ page import="com.servlets.pw2.controller.ErrorManager" %>
<%@ page contentType="text/html;" language="java"

%>

<%   response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<title>Registrazione</title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logoPag.png" id="immagineLogo">

</head>
<script src="${pageContext.request.contextPath}/javascript/checkcampi.js"></script>
<body class="container2">

<div class="left2">
	<div class="top2">
		<img src="img/logoPag.png" alt ="Immagine HP">
	</div>
	<div class="bottom2">
		<div class="formRegistra2">
			<form method="post" action="${pageContext.request.contextPath}/registrazione" onsubmit="return validateAccesso()" >
				<div class="formleft2">
						

					<input class="input2" type="text"  name="nome" id="nome" placeholder="Nome" ><br>
					<input class="input2" type="text"  name="data_nascita" id="data_nascita" placeholder="Data Nascita" onfocus="(this.type='date')" min="1930-01-01" max="2023-12-31" style="width:105%;"><br>	
					<!--<input class="input2" type="text"  name="data_nascita" placeholder="Data Nascita" pattern="[1920-2023]{4}[1-12]{2}[1-31]{2}" 
					style="width:105%;" required><br>-->
					<div  id="focusMessage"></div>
					<input class="input2" type="email"  name="email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" id="email" placeholder="Email" ><br>
					<input class="input2" type="password"  name="password" id="password" placeholder="Password"   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
					onfocus="focusFunction()" onblur="blurFunction()">
					<br>
				</div>
				<div class="bottomRegister2">

					<button type="submit" class="registrati2">Conferma</button>
					<div class="linksLog2" style="padding-top: 4%;" id="divfinale">
						<p>Sei già registrato? <a href="${pageContext.request.contextPath}/login.jsp"><b>Torna al login</b></a></p>
					</div>
					<%
						if(!ErrorManager.getErrorMessage((HttpServletRequest) request).isEmpty()){
					%>
					<div class="alert_alert-danger3" role="alert">
						<%= ErrorManager.getErrorMessage((HttpServletRequest) request)%>
					</div>
					<%
						};
					%>
				</div>
				<div class="formright2">

					<input class="input2" type="text" name="cognome" id="cognome" placeholder="Cognome"  ><br>
					<input class="input2" type="text" name="codice_fiscale" pattern="^[a-zA-Z]{6}[0-9]{2}[a-zA-Z][0-9]{2}[a-zA-Z][0-9]{3}[a-zA-Z]$" id="codice_fiscale" placeholder="Codice Fiscale"  ><br>
					<input class="input2" type="tel" name="telefono" id="telefono" pattern="[0-9]{10}" placeholder="Numero telefono"><br>
					<input class="input2" type="password" name="check_password" id="check_password" placeholder="Conferma password" >
					
				</div>
			</form>
		</div>
	</div>
</div>
<div class="right2">

	<!-- <img src="img/copertina.jpg" alt ="Immagine HP" >-->

	<div  id="img2" class="subtitleImg2">
		<h1>CAMBIARE IL MONDO<br> UN PASSO ALLA VOLTA</h1>
	</div>


</div>

</body>
</html>