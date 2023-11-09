<%@ page import="com.candidatoDB.pw2.entity.Posizione"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.candidatoDB.pw2.entity.Citta"%>
<%@ page import="com.candidatoDB.pw2.entity.CategoriaPosizione"%>
<%@ page import="com.candidatoDB.pw2.entity.Quiz"%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<html>
<head>
<title>Risultati Ricerca Posizioni</title>
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/img/logoPag.png"
	style="border-radius: 10px" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/homeuser.css" />
</head>
<body>

	<jsp:include page="jsp/navbarHeader.jsp" />

<<<<<<< HEAD
        if (risultatiRicerca != null && !risultatiRicerca.isEmpty()) {
    %>
    <div class="results">
        <%
        for (Posizione posizione : risultatiRicerca) {
        %>
        <div class="result-item">
            <h3><%= posizione.getDescrizione() %></h3>
            <p>Ruolo: <%= posizione.getRuolo() %></p>
            <p>Categoria: <%= posizione.getCategoria().getNome_categoria() %></p>
            <p>Città: <%= posizione.getCitta().getNome() %></p>
        </div>
        <%
        }
        %>
    </div>
    <%
        } else {
    %>
    <p>Nessun risultato trovato.</p>
    <%
        }
    %>
</div>
=======
	<div
		style="display: flex; justify-content: center; align-items: center; padding-top: 10%">
		<h1>Risultati della Ricerca delle Posizioni</h1>
>>>>>>> branch 'master' of https://github.com/Lollof00/PW2.git

		<%
		List<Posizione> risultatiRicerca = (List<Posizione>) request.getAttribute("risultatiRicerca");

		if (risultatiRicerca != null && !risultatiRicerca.isEmpty()) {
		%>
		<div class="results">
			<%
			for (Posizione posizione : risultatiRicerca) {
			%>
			<div class="result-item">
				<h3><%=posizione.getDescrizione()%></h3>
				<p>
					Ruolo:
					<%=posizione.getRuolo()%></p>
				<p>
					Categoria:
					<%=posizione.getCategoria().getDescrizione()%></p>
				<p>
					Città:
					<%=posizione.getCitta().getNome()%></p>
			</div>
			<%
			}
			%>
		</div>
		<%
		} else {
		%>
		<p>Nessun risultato trovato.</p>
		<%
		}
		%>
	</div>
</body>
</html>
