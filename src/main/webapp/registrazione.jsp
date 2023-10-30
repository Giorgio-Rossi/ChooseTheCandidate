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
	
		<div class="totReg">
			<img src="img/logo.png" alt ="Immagine HP">
			<div class="registrazione">
				<img>
				<div class="regLeft">
				
				<form>
					
		  			 <input type="text" id="nomeReg" name="nomeReg" placeholder="Nome"><br>
		  			 <label for="dataNascitaReg" style="font-size:15px">Data nascita</label><br>
		  			 <!--  <input type="date" id="dataNascitaReg" value="2018-07-22" min="1900-01-01" max="2023-12-31" ><br>-->
		  			 <input type="text" placeholder="MM/DD/YYYY" onfocus="(this.type='date')" style="width:200px;">
		  			 <input type="text" id="emailReg" name="emailReg" placeholder="Email"><br>
		  			 <input type="text" id="passwordReg" name="passwordReg" placeholder="Password"><br>
		
				</form>
				</div>
				<div class="regRight">
				<form>
					 
		  			 <input type="text" id="cognomeReg" name="cognomeReg" placeholder="Cognome"><br>
		  			 <input type="text" id="codiceFiscaleReg" name="codiceFiscaleReg" placeholder="Codice Fiscale"><br>
		  			 <input type="tel" id="Telefono" name="Telefono" pattern="\+39 \(0\)[0-9]{3} [0-9]{7}" placeholder="Numero telefono"><br>
		  			 <input type="text" id="checkPassword" name="checkPassword" placeholder="Password"><br>
		  			
				</form>
				
				</div>
			</div>
	  		<input type="submit" value="Registrati" id="registrazione">
		</div>
		
		<div class="immagineHP">
		<img src="img/fotohp.jpg" alt ="Immagine HP">
		</div>
		
	
</body>
</html>