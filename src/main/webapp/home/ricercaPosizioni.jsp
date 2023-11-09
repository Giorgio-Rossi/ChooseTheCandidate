<%@ page import="com.candidatoDB.pw2.entity.Posizione" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.candidatoDB.pw2.entity.Citta" %>
<%@ page import="com.candidatoDB.pw2.entity.CategoriaPosizione" %>
<%@ page import="com.candidatoDB.pw2.entity.Quiz" %>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>

<html>
<head>
    <title>Ricerca Posizioni</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homeuser.css">
</head>
<body>
<div class="container">
    <h1>Ricerca Posizioni</h1>

    <form action="${pageContext.request.contextPath}/RicercaPosizioniServlet" method="post">
        <div class="form-group">
            <label for="ruolo">Ruolo:</label>
            <select name="ruolo" id="ruolo">
                <option value="">Tutti</option>
                <option value="Sistemista">Sistemista</option>
                <option value="Web Developer">Web Developer</option>
            </select>
        </div>

   <div class="form-group">
    <label for="citta">Città:</label>
    <select name="citta" id="citta">
        <option value="">Tutte</option>
        <option value="1">Genova</option>
        <option value="2">Milano</option>
        <option value="3">Roma</option>
        <option value="4">Napoli</option>
        <option value="5">Lodi</option>
        <option value="6">Torino</option>
        <option value="7">Venezia</option>
        <option value="8">Firenze</option>
        <option value="9">Bologna</option>
    </select>
</div>
   

      <div class="form-group">
    <label for="categoria">Categoria Posizione:</label>
    <select name="categoria" id="categoria">
        <option value="">Tutte</option>
        <option value="1">bella desc</option>
        <option value="2">desc 2</option>
    </select>
</div>
      

        <button type="submit" class="btn btn-primary">Cerca</button>
    </form>


</body>
</html>
