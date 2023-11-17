<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.candidatoDB.pw2.entity.*" %>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.*" %>
<%@ page import="com.servlets.pw2.controller.ErrorManager" %>
<%@ page isELIgnored="false"%>
<%  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
<% 
    ArrayList<Citta> cities = new CittaIMPL().getAllCitta();
    ArrayList<Regione> regioni = new RegioneIMPL().getAllRegioni();
    QuizIMPL quizImpl=new QuizIMPL();
    ArrayList<Quiz> quiz=quizImpl.getAllQuiz();
 %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<title>Nuova Posizione</title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logoPag.png" style="border-radius: 10px">

</head>
<body class="container2">

<div class="left">
	<div class="top">
		<img src="img/logoPag.png" alt ="Immagine HP">
	</div>
	<div class="bottom">
		<div class="formRegistra">
			<form method="post" action="${pageContext.request.contextPath}/gestionePosizioni" >

				<div class="formleft">
					<%
						if(!ErrorManager.getErrorMessage((HttpServletRequest) request).isEmpty()){
					%>
					<div class="alert_alert-danger" role="alert">
						<%= ErrorManager.getErrorMessage((HttpServletRequest) request)%>
					</div>
					<%
						};
					%><br>
					<input type="text"  name="categoria" id="categoria" placeholder="Categoria" required><br>
					<input type="text"  name="ruolo" id="ruolo" placeholder="Ruolo" required><br>			
                    <input type="text"  name="n_ammissioni" id="n_ammissioni" placeholder="Numero Ammissioni" required><br>
                    <div class="form-group " aria-labelledby="navbarDropdown" style="margin-right:10px">
                    <select class="form-select" name="categoria" aria-label="Default select example">
                        <option disabled selected>Quiz</option>
                        <%
                            for (Quiz q : quiz) {
                        %>
                            <option value="<%=q.getId_quiz()%>"><%=q.getDescrizione()%></option>
                        <%
                            }
                        %>
                    </select>
                </div><br>
                    <div class="form-group " aria-labelledby="navbarDropdown" style="margin-right:10px">
                    <select class="form-select" name="citta" aria-label="Default select example">
                        <option disabled selected>Città</option>              
                        <%
                            for (Regione r : regioni) {
                        %>
                            <optgroup label="<%=r.getNome()%>">
                                <%
                                    for (Citta c : cities) {
                                        if (c.getRegione().getNome().equals(r.getNome())) {
                                %>
                                            <option value="<%=c.getId_citta()%>"><%=c.getNome()%></option>
                                <%
                                        }
                                    }
                                %>
                            </optgroup>
                        <%
                            }
                        %>
                    </select>
                </div><br>
                    <input type="text"  name="data_inserimento" id="data_inserimento" placeholder="Data Inserimento" onfocus="(this.type='date')" min="2023-01-01" max="2023-12-31" style="width:11%;" required><br>					                    
				</div>
				<div class="bottomRegister">

					<button type="submit" class="registrati">Conferma</button>
				</div>
				<div class="formright">

					<input type="text" name="descrizione" id="descrizione" placeholder="Descrizione"  required><br>
					<input type="text" name="stato" id="stato" placeholder="Stato"  required><br>

				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>