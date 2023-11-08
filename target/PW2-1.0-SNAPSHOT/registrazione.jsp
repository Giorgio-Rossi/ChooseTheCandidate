<%@ page import="com.servlets.pw2.controller.ErrorManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"

%>

<%   response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<title>Registrazione</title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logoPag.png" style="border-radius: 10px">

</head>
<body class="container2">

<div class="left">
	<div class="top">
		<img src="img/logoPag.png" alt ="Immagine HP">
	</div>
	<div class="bottom">
		<div class="formRegistra">
			<form method="post" action="${pageContext.request.contextPath}/registrazione" >

				<!-- <form method="get" id="form1" action="something.php">
                </form>
                <button type="submit" form="form1">Click me!</button> -->
				<div class="formleft">
					<%
						if(!ErrorManager.getErrorMessage((HttpServletRequest) request).isEmpty()){
					%>
					<div class="alert_alert-danger" role="alert">
						<%= ErrorManager.getErrorMessage((HttpServletRequest) request)%>
					</div>
					<%
						};
					%>

					<input type="text"  name="nome" id="nome" placeholder="Nome"  required><br>
					<input type="text"  name="data_nascita" id="data_nascita" placeholder="Data Nascita" onfocus="(this.type='date')" min="1930-01-01" max="2023-12-31" style="width:105%;" required><br>	
					<!--<input type="text"  name="data_nascita" placeholder="Data Nascita" pattern="[1920-2023]{4}[1-12]{2}[1-31]{2}" 
					style="width:105%;" required><br>-->
					<input type="email"  name="email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" id="email" placeholder="Email"  required><br>
					<input type="password"  name="password" id="password" placeholder="Password"  required><br>

				</div>
				<div class="bottomRegister">

					<button type="submit" class="registrati">Conferma</button>
					<div class="linksLog" style="padding-top: 4%;">
						<p>Sei già registrato? <a href="${pageContext.request.contextPath}/login.jsp"><b>Torna al login</b></a></p>
					</div>
				</div>
				<div class="formright">

					<input type="text" name="cognome" id="cognome" placeholder="Cognome"  required><br>
					<input type="text" name="codice_fiscale" pattern="^[a-zA-Z]{6}[0-9]{2}[a-zA-Z][0-9]{2}[a-zA-Z][0-9]{3}[a-zA-Z]$" id="codice_fiscale" placeholder="Codice Fiscale"  required><br>
					<input type="tel" name="telefono" id="telefono" pattern="[0-9]{10}" placeholder="Numero telefono"><br>
					<input type="password" name="check_password" id="check_password" placeholder="Password"  required><br>

				</div>
			</form>
		</div>
	</div>
</div>
<div class="right">

	<!-- <img src="img/copertina.jpg" alt ="Immagine HP" >-->

	<div  id="img" class="subtitleImg">
		<h1>CAMBIARE IL MONDO<br> UN PASSO ALLA VOLTA</h1>
	</div>


</div>

</body>
</html>