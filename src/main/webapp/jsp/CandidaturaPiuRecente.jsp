<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.candidatoDB.pw2.entity.CandidaturaUser" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Candidatura più recente</title>
</head>
<body>
    <h1>Candidatura più recente</h1>
    <%
        List<CandidaturaUser> candidaturaUsers = (List<CandidaturaUser>) request.getAttribute("candidaturaPiuRecente");
        CandidaturaUser candidatura = null;
        
        if (candidaturaUsers != null && !candidaturaUsers.isEmpty()) {
        
            candidatura = candidaturaUsers.get(0); 
        }
    %>
    
        <p>Data di candidatura: <%= candidatura.getData_candidatura()%></p>
        <p>Posizione: <%= candidatura.getId_posizione()%></p>
  
</body>
</html>
