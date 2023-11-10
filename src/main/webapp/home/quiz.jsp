<%@ page import="java.util.HashMap" %>
<%@ page import="com.candidatoDB.pw2.entity.Domanda" %>
<%@ page import="com.candidatoDB.pw2.entity.RisposteDomande" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quiz</title>


    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous" />
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />

</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>

<body>

<%
    HashMap<Domanda, ArrayList<RisposteDomande>> risposte = (HashMap<Domanda, ArrayList<RisposteDomande>>) request.getAttribute("quiz");
    System.out.println(risposte);
%>


<div class="container-fluid">

    <div class="jumbotron">
        <h3><%=request.getAttribute("nome_quiz")%></h3>
    </div>

    <form>

        <%
            int i=1;
            for(Map.Entry<Domanda,ArrayList<RisposteDomande>> entry : risposte.entrySet()){
        %>

                <div class="card border-info mb-4 ">

                    <div class="d-flex justify-content-between align-items-center card-header bg-info text-white" id="h1">
                        <span>Domanda <%=i%></span>
                        <button type="button" data-bs-toggle="collapse" data-bs-target="#n<%=i%>" aria-expanded="false" aria-controls="collapseExample" class="btn btn-outline-light">
                        </button>
                    </div>
                    <div id="n<%=i%>" class="collapse show" aria-labelledby="h1">
                        <div class="card-body">
                            <p><%=entry.getKey().getTesto()%></p>

                            <%
                                for(RisposteDomande risposteDomande : entry.getValue()){
                            %>

                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="q1" id="1" value="r1">
                                        <label class="form-check-label" for="1">
                                           <%=risposteDomande.getScelta1()%>
                                        </label>
                                    </div>

                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="q1" id="2" value="r1">
                                        <label class="form-check-label" for="2">
                                            <%=risposteDomande.getScelta2()%>
                                        </label>
                                    </div>

                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="q1" id="3" value="r1">
                                        <label class="form-check-label" for="3">
                                            <%=risposteDomande.getScelta3()%>
                                        </label>
                                    </div>

                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="q1" id="4" value="r1">
                                        <label class="form-check-label" for="4">
                                            <%=risposteDomande.getScelta4()%>
                                        </label>
                            </div>

                            <%
                                };
                            %>


                        </div>

                    </div>
                </div>

        <%
                i++;
            };
        %>


        <button type="submit" class="btn btn-primary">Submit</button>

    </form>






    <h3>Risultati</h3>

    <div class="card">
        <div class="card-body">
            <p id="result">Nessun risultato</p>

            <div class="progress mb-2">
                <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
            </div>

            <button type="button" class="btn btn-success">Update</button>
        </div>
    </div>

</div>


</body>
</html>
