<%@ page import="com.candidatoDB.pw2.entity.Posizione"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@page import="com.candidatoDB.pw2.entity.Citta"%>
<%@page import="com.candidatoDB.pw2.entity.CategoriaPosizione"%>
<%@page import="com.candidatoDB.pw2.entity.Quiz"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<html>
<head>
<title>Risultati Ricerca Posizioni</title>
</head>
<body>
	<h1>Risultati della Ricerca delle Posizioni</h1>

	<%
	List<Posizione> risultatiRicerca = (List<Posizione>) request.getAttribute("risultatiRicerca");
	if (risultatiRicerca != null && !risultatiRicerca.isEmpty()) {
	%>
	<table>
		<tr>
			<th>ID Posizione</th>
			<th>Descrizione</th>
			<!-- altre colonne  -->
		</tr>
		<%
		for (Posizione posizione : risultatiRicerca) {
		%>
		<tr>
			<td><%=posizione.getId_posizione()%></td>
			<td><%=posizione.getDescrizione()%></td>
		
		</tr>
		<%
		}
		%>
	</table>
	<%
	} else {
	%>
	<p>Nessun risultato trovato.</p>
	<%
	}
	%>
</body>
</html>
