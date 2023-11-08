<%@ page import="com.candidatoDB.pw2.entity.Posizione" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="com.candidatoDB.pw2.entity.Citta"%>
<%@page import="com.candidatoDB.pw2.entity.CategoriaPosizione"%>
<%@page import="com.candidatoDB.pw2.entity.Quiz"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>

<html>
<head>
    <title>Ricerca Posizioni</title>
    
   <link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/homeuser.css">
</head>
<body>




<div class="container">
    <h1>Ricerca Posizioni</h1>

    <form action="RicercaPosizioniServlet" method="post">
        <div class="form-group">
            <label for="ruolo">Ruolo:</label>
            <select name="ruolo" id="ruolo">
                <option value="">Tutti</option>
               
                <option value="ruolo1">Ruolo 1</option>
                <option value="ruolo2">Ruolo 2</option>
             
            </select>
        </div>

        <div class="form-group">
            <label for="citta">Città:</label>
            <select name="citta" id="citta">
                <option value="">Tutte</option>
                <option value="citta1">Città 1</option>
                <option value="citta2">Città 2</option>
           
            </select>
        </div>

        <div class="form-group">
            <label for="categoria">Categoria Posizione:</label>
            <select name="categoria" id="categoria">
                <option value="">Tutte</option>
           
                <option value="categoria1">Categoria 1</option>
                <option value="categoria2">Categoria 2</option>
                
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Cerca</button>
    </form>

    <h2>Risultati Ricerca:</h2>

    <div class="results">
        <%
       
            List<Posizione> risultatiRicerca = (List<Posizione>) request.getAttribute("risultatiRicerca");

          
            for (Posizione posizione : risultatiRicerca) {
        %>
            <div class="result-item">
                <h3><%= posizione.getDescrizione() %></h3>
                <p>Ruolo: <%= posizione.getRuolo() %></p>
                <p>Categoria: <%= posizione.getCategoria().getDescrizione() %></p>
                <p>Città: <%= posizione.getCitta().getNome() %></p>
              
            </div>
        <%
            }
        %>
    </div>
</div>

</body>
</html>
