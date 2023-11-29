<%@ page import="com.servlets.pw2.controller.ErrorManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"

%>
<html>
<head>
	<title>Login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logoPag.png" style="border-radius: 10px">
	<link rel="stylesheet" href="css/style.css">
	<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
			crossorigin="anonymous"/>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"
		  href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/card.css" />

</head>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js'></script>

<%

%>

<body class="container2">
<div id="left2">
	<div class="top2">
		<img src="img/logoPag.png" alt ="Immagine HP">
	</div>
	<div class="center2">

		<h3>Log in</h3>
		<form  method="post" id="form1" action="${pageContext.request.contextPath}/login">
			<div class="formLogin2">
				<input class="input2" type="email" name="email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" required placeholder="Email"/><br>
				<input class="input2" type="password" name="password" required placeholder="Password"/><br>
			</div>
			<!-- Alert Success -->
				<%
				if(!ErrorManager.getSUccessMessage((HttpServletRequest) request).isEmpty()){
				%>
				<div style="margin-top: 4%;
					 width: 100%;
					 height:1.5em;
					  font-size: 1.5em;
					  text-align: center;
					  color: green;
					  background: lightgreen;
					  border:3px solid darkgreen;;
					  transform: translateX(2%);
					   border-radius: 30px;">
					<%= ErrorManager.getSUccessMessage((HttpServletRequest) request)%>
				</div>
				<%
				};
				%>

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

	<div class="bottomLogin2">
		<button form="form1" id="button2"type="submit">Login</button>
		<div class="linksLog2">
			<button type="button" class="btn btn-link a" data-bs-toggle="modal" data-bs-target="#resetPassword" data-bs-whatever="@getbootstrap">Password dimenticata?</button>
			<!--<p><a href="#resetPassword">Password dimenticata?</a></p>-->
			<p>Non hai un account? <a href="${pageContext.request.contextPath}/registrazione.jsp"><b>Registrati qui</b></a></p>
		</div>
	</div>

	</form>
</div>
<div class="right2">
	<div  id="img2" class="subtitleImg2">
		<h1>CAMBIARE IL MONDO<br> UN PASSO ALLA VOLTA</h1>
	</div>


</div>


<div class="modal fade" id="resetPassword" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">Reimposta password</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form method="post" id="verify_token" action="${pageContext.request.contextPath}/passwordDimenticata">
					<div class="mb-3">
						<label for="email" class="col-form-label">Email:</label>
						<input class="input2" type="email" class="form-control" name="email" id="email" required>
					</div>
					<div class="mb-3">
						<label for="token" class="col-form-label">Token:</label>
						<input class="input2" type="text" name="token" class="form-control" id="token" required>
					</div>
					<button type="submit" form="verify_token" class="btn btn-primary">Verifica</button>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chiudi</button>

			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="resetPassword2" tabindex="-1"  data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5">Reimposta password</h1>
			</div>
			<div class="modal-body">
				<form method="post" id="verify_psw" action="${pageContext.request.contextPath}/cambiaPassword">
					<div class="mb-3">
						<label for="npw" class="col-form-label">Nuova password:</label>
						<input class="input2" type="password" class="form-control" name="nuova_password" id="npw" required>
					</div>
					<div class="mb-3">
						<label for="cpw" class="col-form-label">Conferma password:</label>
						<input class="input2" type="password" name="confirm_password" class="form-control" id="cpw" required>
					</div>
					<button type="submit" form="verify_psw"  class="btn btn-primary">Cambia password</button>
				</form>
			</div>
	</div>
</div>

<%
	String token_verificato =  session.getAttribute("token_giusto") == null ?  null : session.getAttribute("token_giusto").toString();

	if(token_verificato != null && Boolean.parseBoolean(token_verificato)){
%>
<script>
	var myModal = new bootstrap.Modal(document.getElementById('resetPassword2'))
	myModal.show()
	<% session.removeAttribute("token_giusto");%>
</script>
<%
}
%>

</body>
</html>
