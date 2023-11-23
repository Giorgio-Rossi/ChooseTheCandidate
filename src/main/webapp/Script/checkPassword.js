function checkPassword(){
	  var newpsw = document.getElementById('newpsw').value;
      var confirmpsw = document.getElementById('confirmpsw').value;
      var resultElement = document.getElementById('result');

      if (password1 === password2) {
        resultElement.style.color = 'green';
        resultElement.textContent = 'Le password corrispondono!';
        alert("ok");
      } else {
        resultElement.style.color = 'red';
        resultElement.textContent = 'Le password non corrispondono. Riprova.';
        alert("no ok");
      }
}