<%@ page import="com.candidatoDB.pw2.entity.Posizione" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.candidatoDB.pw2.entity.Citta" %>
<%@ page import="com.candidatoDB.pw2.entity.CategoriaPosizione" %>
<%@ page import="com.candidatoDB.pw2.entity.Quiz" %>

<html>
<head>
    <title>Risultati Ricerca Posizioni</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homeuser.css">
</head>
<body>
<div class="container">
    <h1>Risultati della Ricerca delle Posizioni</h1>

    <%
        List<Posizione> risultatiRicerca = (List<Posizione>) request.getAttribute("risultatiRicerca");

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

</body>
</html>
