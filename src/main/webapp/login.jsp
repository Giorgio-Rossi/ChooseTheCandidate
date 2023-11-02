<%@ page import="com.servlets.pw2.controller.ErrorManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"

%>
<html>
<head>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  
   <link rel="stylesheet" href="css/style.css">
</head>


<body class="container2">
   <div class="left">
       <div class="top">
            <img src="img/logoPag.png" alt ="Immagine HP">
		</div>
		<div class="center">
	
			<h3>Log in</h3>
<<<<<<< HEAD
			<form  method="post" id="form1"  action="${pageContext.request.contextPath}/login">
=======
			<form  method="post" id="form1" action="${pageContext.request.contextPath}/login">
>>>>>>> b8fa5dc4bc4a84fdae0c0d241cb60e42540b3400
				<div class="email">
					<input type="email" name="email" required placeholder="Email"/><br>
				</div>
				
				<div class="passw">
				<input type="password" name="password" required placeholder="Password"/><br>
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
<<<<<<< HEAD
				<button form="form1"  type="submit">Login</button>
				<div class="linksLog">
					<p><a href="#!">Password dimenticata?</a></p>
					<p>Non hai un account? <a href="${pageContext.request.contextPath}/registrazione.jsp"><b>Registrati qui</b></a></p>
				</div>
=======
					<button form="form1"  type="submit">Login</button>
					<div class="linksLog">
						<p><a href="#!">Password dimenticata?</a></p>
						<p>Non hai un account? <a href="${pageContext.request.contextPath}/registrazione.jsp"><b>Registrati qui</b></a></p>
					</div>
>>>>>>> b8fa5dc4bc4a84fdae0c0d241cb60e42540b3400
				</div>
				
	        </form>
	    </div>
	</div>
     <div class="right">
		<div  id="img" class="subtitleImg">
			<h1>CAMBIARE IL MONDO<br> UN PASSO ALLA VOLTA</h1>
		</div>

	</div>
        
</body>
</html>
