<%@ page contentType="text/html;charset=UTF-8" language="java"

%>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body class="container2">
	
		<div class="left">
			<div class="top">
				<img src="img/logoPag.png" alt ="Immagine HP">
				</div>
				<div class="bottom">
					<div class="formleft">
					<!-- <form method="get" id="form1" action="something.php">
					</form>
					<button type="submit" form="form1">Click me!</button> -->
					<form method="post" id="form1"  action="${pageContext.request.contextPath}/registrazione.jsp">
						
			  			 <input type="text"  name="nome" placeholder="Nome"  required><br>
			  			 <!--  <input type="date" id="dataNascitaReg" value="2018-07-22" min="1900-01-01" max="2023-12-31" ><br>-->
			  			 <input type="text"  name="data_nascita" placeholder="Data Nascita" onfocus="(this.type='date')" min="1900-01-01" max="2023-12-31" style="width:70%;" required><br>
			  			 <input type="text"  name="email" placeholder="Email"  required><br>
			  			 <input type="text"  name="password" placeholder="Password"  required><br>
			
					</form>
					</div>
					<div class="formright">
					<form method="post" id="form1" action="${pageContext.request.contextPath}/registrazione.jsp">
						 
			  			 <input type="text"  name="cognome" placeholder="Cognome"  required><br>
			  			 <input type="text" name="codice_fiscale" placeholder="Codice Fiscale"  required><br>
			  			 <input type="tel" name="telefono" pattern="\+39 \(0\)[0-9]{3} [0-9]{7}" placeholder="Numero telefono"><br>
			  			 <input type="text" name="check_password" placeholder="Password"  required><br>
			  			
					</form>
					
					
		  		
		  		</div>
		  		
	  		</div>
	  		<div >
	  			<button type="submit" class="registrati"  form="form1">Conferma</button>
	  			<div class="linksLog" style="padding-top: 4%;">
					<p>Sei già registrato? <a href="${pageContext.request.contextPath}/login.jsp"><b>Torna al login</b></a></p>
				</div>
	  		</div>
		</div>
		<div class="right">
	
				<!-- <img src="img/copertina.jpg" alt ="Immagine HP" >-->
			
			<div  id="img" class="subtitleImg">
				<h1>CAMBIARE IL MONDO,<br> UN POSSO ALLA VOLTA</h1>
			</div>

			
		</div>
	
</body>
</html>