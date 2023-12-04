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
<body class="container2">

<div class="left2">
	<div class="top2">
		<img src="img/logoPag.png" alt ="Immagine HP">
	</div>
	<div class="bottom2">
		<div class="formRegistra2">
			<form method="post" action="${pageContext.request.contextPath}/registrazione" >
				<div class="formleft2">
						

					<input class="input2" type="text"  name="nome" id="nome" placeholder="Nome"  required><br>
					<input class="input2" type="text"  name="data_nascita" id="data_nascita" placeholder="Data Nascita" onfocus="(this.type='date')" min="1930-01-01" max="2023-12-31" style="width:105%;" required><br>	
					<!--<input class="input2" type="text"  name="data_nascita" placeholder="Data Nascita" pattern="[1920-2023]{4}[1-12]{2}[1-31]{2}" 
					style="width:105%;" required><br>-->
					<div  id="focusMessage"></div>
					<input class="input2" type="email"  name="email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" id="email" placeholder="Email"  required><br>
					<input class="input2" type="password"  name="password" id="password" placeholder="Password"  required
					title="Lunghezza compresa tra 8 e 256 caratteri;
					Almeno una lettera maiuscola ed una minuscola;
					Almeno un numero;
					Almeno un carattere speciale tra: ! # $ % & @ ( ) * + , . / - : ; = ? [ ] _ { | } \>" onfocus="focusFunction()" onblur="blurFunction()">
					<br>
					<script>
					function focusFunction() {
				        // Mostra il messaggio
				        var message = "<h2>La password deve contenere:</h2>Lunghezza compresa tra 8 e 256 caratteri; <br>Almeno una lettera maiuscola ed una minuscola; <br>Almeno un numero; <br>Almeno un carattere speciale tra: ! # $ % & @ ( ) * + , . / - : ; = ? [ ] _ { | } \\";
				        document.getElementById("focusMessage").innerHTML = message;
				        document.getElementById("focusMessage").style.display = "block";
				    }
					function blurFunction() {
						document.getElementById("focusMessage").style.display = "none";
						}

					</script>
				</div>
				<div class="bottomRegister2">

					<button type="submit" class="registrati2">Conferma</button>
					<div class="linksLog2" style="padding-top: 4%;">
						<p>Sei già registrato? <a href="${pageContext.request.contextPath}/login.jsp"><b>Torna al login</b></a></p>
					</div>
					<%
						if(!ErrorManager.getErrorMessage((HttpServletRequest) request).isEmpty()){
					%>
					<div class="alert_alert-danger2" role="alert">
						<%= ErrorManager.getErrorMessage((HttpServletRequest) request)%>
					</div>
					<%
						};
					%>
				</div>
				<div class="formright2">

					<input class="input2" type="text" name="cognome" id="cognome" placeholder="Cognome"  required><br>
					<input class="input2" type="text" name="codice_fiscale" pattern="^[a-zA-Z]{6}[0-9]{2}[a-zA-Z][0-9]{2}[a-zA-Z][0-9]{3}[a-zA-Z]$" id="codice_fiscale" placeholder="Codice Fiscale"  required><br>
					<input class="input2" type="tel" name="telefono" id="telefono" pattern="[0-9]{10}" placeholder="Numero telefono"><br>
					<input class="input2" type="password" name="check_password" id="check_password" placeholder="Password" required>
					
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