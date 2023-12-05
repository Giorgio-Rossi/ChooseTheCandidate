//MOSTRA MESSAGGIO PER LA PSW
function focusFunction() {
	// Mostra il messaggio
	var message = "<h2>La password deve contenere:</h2>Lunghezza compresa tra 8 e 256 caratteri; <br>Almeno una lettera maiuscola ed una minuscola; <br>Almeno un numero; <br>Almeno un carattere speciale tra: ! # $ % & @ ( ) * + , . / - : ; = ? [ ] _ { | } \\";
	document.getElementById("focusMessage").innerHTML = message;
	document.getElementById("focusMessage").style.display = "block";
}
function blurFunction() {
	document.getElementById("focusMessage").style.display = "none";
}


//CONTROLLI JS 
// Funzione per validare il campo email

function ValidateNomeCognome(input) {
	var validRegex = 0;
	var validRegex = /^[a-zA-Z'`]+[a-zA-Z'`]+(.[a-zA-Z]+)*$/i;
	return validRegex.test(input);
}
function ValidateEmail(input){
	var validRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
	return validRegex.test(input);
}

function ValidatePassword(input){
	var validRegex =/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()-_+=]).{8,}$/;
	return validRegex.test(input);
}

function validateCodiceFiscale(input)
	{
	var validRegex =/^[A-Z]{6}\d{2}[A-Z]\d{2}[A-Z]\d{3}[A-Z]$/i;
	return validRegex.test(input);
	}
// Funzione per validare il campo telefono
function validatePhone(phone) {
	if (phone.length < 10) {
		return false;
	}
	for (var i = 0; i < phone.length; i++) {
		if (!isNaN(phone[i] || !number(phone[i]))) {
			continue;
		} else {
			return false;
		}
	}
	return true;
}

function moalchiudo(element) {
	setTimeout(() => {
		element.style.display = 'none';
		console.log("aspetto");
	}, 2000);
	return;
}
function invokeAlert(a) {
	const alertElement = document.createElement('div');
	alertElement.id = 'alert';
	alertElement.style.zIndex = "1000";
	const para = document.createElement("p");
	const node = document.createTextNode(a);
	para.appendChild(node);
	alertElement.appendChild(para);
	document.getElementById("divfinale").appendChild(alertElement);
	moalchiudo(alertElement);
	
}


    function validateAccesso() {

      // Validazione User
      var nome = document.getElementById('nome').value;
      if (!ValidateNomeCognome(nome)) {
        invokeAlert('Il nome non è valido');
        return false;
      }
      
      var cognome = document.getElementById('cognome').value;
      if (!ValidateNomeCognome(cognome)) {
        invokeAlert('Il cognome non è valido');
        return false;
      }
      var data = document.getElementById('data_nascita').value;
      if ((data)=='') {
        invokeAlert('Il campo data non è valido');
        return false;
      }
      var cod_fisc = document.getElementById('codice_fiscale').value;
      if (!validateCodiceFiscale(cod_fisc)){
        invokeAlert('Il campo codifce fiscale non è valido');
        return false;
      }

      var email = document.getElementById('email').value;
      if (!ValidateEmail(email)){
        invokeAlert('Il campo email non è valido');
        return false;
      }

      var tel = document.getElementById('telefono').value;
      if (!validatePhone(tel)) {
        invokeAlert('Il campo telefono non è valido');
        return false;
      }

      
      

      // Validazione Password
      var password = document.getElementById('password').value;
      if (!ValidatePassword(password)) {
        invokeAlert('Il campo password è obbligatorio.');
        return false;
      }
      var check_password = document.getElementById('check_password').value;
      if (!(password == check_password)){
        invokeAlert('Le password non sono uguali.');
        return false;
      }
      document.forms[0].submit();
      

    }
function validateCambioPass() {
	var newPassword = document.getElementById('npw').value;
      if (!ValidatePassword(newPassword)) {
        invokeAlertChgPsw('Il campo password non è valido.');
        return false;
      }
      var checkNew_password = document.getElementById('cpw').value;
      if (!(newPassword == checkNew_password)){
        invokeAlertChgPsw('Le password non sono uguali.');
        return false;
      }
	document.forms[0].submit();
	}
	
	function invokeAlertChgPsw(a) {
	const alertElement = document.createElement('div');
	alertElement.id = 'alert2';
	alertElement.style.zIndex = "1000";
	const para = document.createElement("p");
	const node = document.createTextNode(a);
	para.appendChild(node);
	alertElement.appendChild(para);
	document.getElementById("verify_psw").appendChild(alertElement);
	moalchiudo(alertElement);
}
