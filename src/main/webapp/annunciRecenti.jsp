<%@page import="com.candidatoDB.pw2.interfaces.impl.CandidaturaIMPL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.candidatoDB.pw2.entity.CandidaturaUser"%>
<%@ page import="com.candidatoDB.pw2.entity.Utente"%>

<%
Utente utenteLoggato = (Utente) request.getSession().getAttribute("utente");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Annunci recenti</title>
</head>
<body>
	<h1>Annunci recenti</h1>

	<table border="1">
        <tr>
			<!---	id 
					Numero ammissioni
					Descrizione
							Citta
							Categoria
					Stato 
					Data inserimento
					Ruolo
			-->
			<th>ID</th>
			<th>Numero ammissioni</th>
			<th>Descrizione</th>
			<th>Stato</th>
			<th>Data inserimento</th>
			<th>Ruolo</th>
			<!--- MANCANO CITTA E CATEGORIA-->
        </tr>

        <% List<Posizione> Annunci = (List<Posizione>) request.getAttribute("posizioniPiuRecenti");
            for(Posizione posizione: Annunci){
        %>
            <tr>
                <td><%=posizione.getId_posizione()%></td>
            	<td><%=candidatura.getN_ammissioni()%></td>
				 <!---
                <td><%=candidatura.getData_candidatura()%></td>
				<td><%=posizione.getPosizi></td>
				<td>>%=posizione.getAnnunci</td>-->
            </tr>
	
        <%
	}
        %>
    </table>
</body>
</html>
