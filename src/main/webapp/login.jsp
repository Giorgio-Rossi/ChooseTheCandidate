<%@ page import="com.servlets.pw2.controller.ErrorManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"

%>
<html>
<head>
	<title>Login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logoPag.png" style="border-radius: 10px">
	<link rel="stylesheet" href="css/style.css">
	
</head>


<body class="container2">
<div class="left">
	<div class="top">
		<img src="img/logoPag.png" alt ="Immagine HP">
	</div>
	<div class="center">

		<h3>Log in</h3>
		<form  method="post" id="form1" action="${pageContext.request.contextPath}/login">
			<div class="formLogin">
				<input type="email" name="email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" required placeholder="Email"/><br>
				<input type="password" name="password" required placeholder="Password"/><br>
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
			<div class="alert_alert-danger" role="alert">
				<%= ErrorManager.getErrorMessage((HttpServletRequest) request)%>
			</div>
				<%
				};
				%>
	</div>

	<div class="bottomLogin">
		<button form="form1"  type="submit">Login</button>
		<div class="linksLog">
			<p><a href="${pageContext.request.contextPath}/passwordDimenticata.jsp">Password dimenticata?</a></p>
			<p>Non hai un account? <a href="${pageContext.request.contextPath}/registrazione.jsp"><b>Registrati qui</b></a></p>
		</div>
	</div>

	</form>
</div>
<div class="right">
	<div  id="img" class="subtitleImg">
		<h1>CAMBIARE IL MONDO<br> UN PASSO ALLA VOLTA</h1>
	</div>

</div>

</body>
</html>
