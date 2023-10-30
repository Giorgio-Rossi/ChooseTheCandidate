<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body class="container">
	
		<div class="left">
			<div class="top">
				<img src="img/logoPagina.png" alt ="Immagine HP">
				</div>
				<div class="bottom">
					<div class="formleft">
					<form>
						
			  			 <input type="text" class="placeCol" id="nomeReg" name="nomeReg" placeholder="Nome"><br>
			  			 <!--  <input type="date" id="dataNascitaReg" value="2018-07-22" min="1900-01-01" max="2023-12-31" ><br>-->
			  			 <input type="text" class="placeCol" placeholder="Data Nascita" onfocus="(this.type='date')" min="1900-01-01" max="2023-12-31" style="width:52%;"><br>
			  			 <input type="text" class="placeCol" id="emailReg" name="emailReg" placeholder="Email"><br>
			  			 <input type="text" class="placeCol" id="passwordReg" name="passwordReg" placeholder="Password"><br>
			
					</form>
					</div>
					<div class="formright">
					<form>
						 
			  			 <input type="text" class="placeCol" id="cognomeReg" name="cognomeReg" placeholder="Cognome"><br>
			  			 <input type="text" class="placeCol" id="codiceFiscaleReg" name="codiceFiscaleReg" placeholder="Codice Fiscale"><br>
			  			 <input type="tel" class="placeCol" id="Telefono" name="Telefono" pattern="\+39 \(0\)[0-9]{3} [0-9]{7}" placeholder="Numero telefono"><br>
			  			 <input type="text" class="placeCol" id="checkPassword" name="checkPassword" placeholder="Password"><br>
			  			
					</form>
					
					
		  		
		  		</div>
		  		
	  		</div>
	  		<div >
	  			<button type="submit" class="registrati">Conferma</button>
	  		</div>
		</div>
		<div class="right">
			<div class="img">
				<img src="img/copertina.jpg" alt ="Immagine HP" >
			</div>
		</div>
	
</body>
</html>