<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ci siamo</title>
</head>
<body>

	<!-- <form  method="post" id="form1" action="${pageContext.request.contextPath}/passwordDimenticata"> -->
	<form>
		<input type="text" name="newpsw" id="newpsw" placeholder="newpsw"
			required><br> <input type="text" name="confermapsw"
			id="confermapsw" placeholder="confermapsw" required><br>

		<button type="submit" class="passwordDimenticata">Conferma</button>

	</form>

</body>
</html>