<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.candidatoDB.pw2.entity.*"%>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.*"%>
<%@ page import="com.servlets.pw2.controller.ErrorManager"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page isELIgnored="false"%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    int idQuizParam = Integer.parseInt(request.getParameter("idQuiz"));

    QuizIMPL quizImpl = new QuizIMPL();
    Quiz quiz = quizImpl.getQuizById(idQuizParam);

    ArrayList<Domanda> domande = new QuizDomandaIMPL().getDomandeByIdQuiz(quiz.getId_quiz());
    RisposteDomandaIMPL risposteDomandaIMPL = new RisposteDomandaIMPL();

    HashMap<Domanda,ArrayList<RisposteDomande>> risposte = new HashMap<>();

    for(Domanda d : domande){
        risposte.put(d,risposteDomandaIMPL.getRisposteDomandaByIdDomanda(d.getId_domanda()));
    }

%>

<html>
<head>

    <title>Modifica Quiz</title>
    <link rel="icon" type="image/x-icon"
          href="${pageContext.request.contextPath}/img/logoPag.png"
          style="border-radius: 10px">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
</head>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/homeuser.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/modificaPosizione.css">

<body style="background-color: #d4d4d4;">




<main style="margin: 50px; padding: 0;">

    <div class="container mt-5">

        <div class="row flex-lg-nowrap">
            <div class="col">
                <div class="row">
                    <div class="col mb-3">
                        <div class="card mt-4" style="border: 2px solid blue;">
                            <div class="card-body">
                                <%
                                    if (!ErrorManager.getSUccessMessage((HttpServletRequest) request).isEmpty()) {
                                %>
                                <div class="alert alert-success">
                                    <%=ErrorManager.getSUccessMessage((HttpServletRequest) request)%>
                                </div>
                                <%
                                    }
                                    ;
                                %>
                                <%
                                    if (!ErrorManager.getErrorMessage((HttpServletRequest) request).isEmpty()) {
                                %>
                                <div class="alert alert-danger">
                                    <%=ErrorManager.getErrorMessage((HttpServletRequest) request)%>
                                </div>
                                <%
                                    }
                                    ;
                                %>
                                <%
                                    if (!ErrorManager.getOtherMessage((HttpServletRequest) request).isEmpty()) {
                                %>
                                <div class="alert alert-warning">
                                    <%=ErrorManager.getOtherMessage((HttpServletRequest) request)%>
                                </div>
                                <%
                                    }
                                    ;
                                %>

                                <div class="e-profile">
                                    <div class="tab-content pt-3">
                                        <div class="tab-pane active">
                                            <form method="post" action="${pageContext.request.contextPath}/modificaQuiz">
                                                <input type="hidden" name="id_quiz" value="<%=quiz.getId_quiz()%>">
                                                <div class="mb-3">
                                                    <label for="nome" class="form-label">Nome</label>
                                                    <input type="text" class="form-control " name="nome" id="nome" value="<%=quiz.getDescrizione()%>" required>
                                                </div>

                                                <div class="container">
                                                    <div class="row clearfix">
                                                        <div class="col-md-12 column">
                                                            <table class="table table-bordered table-hover" id="tab_logic">
                                                                <thead>
                                                                <tr >
                                                                    <th class="text-center">
                                                                        #
                                                                    </th>
                                                                    <th class="text-center">
                                                                        Domanda
                                                                    </th>
                                                                    <th class="text-center">
                                                                        Scelta 1
                                                                    </th>
                                                                    <th class="text-center">
                                                                        Scelta 2
                                                                    </th>
                                                                    <th class="text-center">
                                                                        Scelta 3
                                                                    </th>
                                                                    <th class="text-center">
                                                                        Scelta 4
                                                                    </th>
                                                                    <th class="text-center">
                                                                        Scelta Corretta
                                                                    </th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <%
                                                                    int i=1;
                                                                    for(Map.Entry<Domanda,ArrayList<RisposteDomande>> entry : risposte.entrySet()){
                                                                %>
                                                                <tr id='addr<%=i%>'>
                                                                    <td>
                                                                        <%=i%>
                                                                    </td>
                                                                    <td>
                                                                        <div class="mb-3">
                                                                            <textarea class="form-control mb-1" name="domanda" rows="3" required><%=entry.getKey().getTesto()%></textarea>
                                                                            <input type="number" name='punteggio' class='form-control' min='1' max='10' value="<%=entry.getKey().getPunteggio()%>" required/>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div class="mb-3">
                                                                            <textarea class="form-control" name="scelta1"   rows="3" required><%=entry.getValue().get(0).getScelta1()%></textarea>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div class="mb-3">
                                                                            <textarea class="form-control" name="scelta2" placeholder="Scelta 2" rows="3" required><%=entry.getValue().get(0).getScelta2()%></textarea>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div class="mb-3">
                                                                            <textarea class="form-control" name="scelta3" placeholder="Scelta 3"  rows="3" required><%=entry.getValue().get(0).getScelta3()%></textarea>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div class="mb-3">
                                                                            <textarea class="form-control" name="scelta4" placeholder="Scelta 4"  rows="3" required><%=entry.getValue().get(0).getScelta4()%></textarea>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div class="mb-3">
                                                                            <select class="form-select" aria-label="Default select example" name="sceltacorretta" required>
                                                                                <option disabled>Scelta corretta</option>
                                                                                                <%
                                                                                                if(entry.getValue().get(0).getScelta_corretta().equals("scelta1")){
                                                                                                %>
                                                                                                        <option value="scelta1" selected>1</option>
                                                                                                        <option value="scelta2">2</option>
                                                                                                        <option value="scelta3">3</option>
                                                                                                        <option value="scelta4">4</option>
                                                                                                <%
                                                                                                    }else if(entry.getValue().get(0).getScelta_corretta().equals("scelta2")){
                                                                                                %>
                                                                                                        <option value="scelta1">1</option>
                                                                                                        <option value="scelta2" selected>2</option>
                                                                                                        <option value="scelta3">3</option>
                                                                                                        <option value="scelta4">4</option>
                                                                                                <%
                                                                                                }else if(entry.getValue().get(0).getScelta_corretta().equals("scelta3")){
                                                                                                %>

                                                                                                        <option value="scelta1">1</option>
                                                                                                        <option value="scelta2">2</option>
                                                                                                        <option value="scelta3" selected>3</option>
                                                                                                        <option value="scelta4">4</option>
                                                                                                        <%
                                                                                                        }else if(entry.getValue().get(0).getScelta_corretta().equals("scelta4")){
                                                                                                        %>
                                                                                                        <option value="scelta1">1</option>
                                                                                                        <option value="scelta2">2</option>
                                                                                                        <option value="scelta3">3</option>
                                                                                                        <option value="scelta4" selected>4</option>
                                                                                                        <%
                                                                                                        }
                                                                                                        %>
                                                                            </select>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <%
                                                                        i++;
                                                                    };
                                                                %>
                                                                <tr id='addr1'></tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <a id="add_row" class="btn btn-default pull-left mb-2">Aggiungi Domanda</a><a id='delete_row' class="pull-right btn btn-default mb-2">Rimuovi Domanda</a>
                                                </div>



                                                <div class="bottomRegister">
                                                    <button type="submit" class="btn btn-primary">Conferma</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</main>


<script>
    $(document).ready(function(){
        var i=1;
        $("#add_row").click(function(){
            $('#addr'+i).html("<td>"+ (i+1) +"</td><td> <div class='mb-3'> <textarea class='form-control' name='domanda' placeholder='Domanda' rows='3' required></textarea> <input type='number' name='punteggio' class='form-control' min='1' max='10' placeholder='Punteggio' required /> </div> </td> <td> <div class='mb-3'> <textarea class='form-control' name='scelta1' placeholder='Scelta 1'  rows='3' required></textarea> </div> </td> <td> <div class='mb-3'> <textarea class='form-control' name='scelta2' placeholder='Scelta 2' rows='3' required></textarea> </div> </td> <td> <div class='mb-3'> <textarea class='form-control' name='scelta3' placeholder='Scelta 3'  rows='3' required></textarea> </div> </td> <td> <div class='mb-3'> <textarea class='form-control' name='scelta4' placeholder='Scelta 4'  rows='3' required></textarea> </div> </td> <td> <div class='mb-3'> <select class='form-select' aria-label='Default select example' name='sceltacorretta' required> <option disabled>Scelta corretta</option> <option value='scelta1'>1</option> <option value='scelta2'>2</option> <option value='scelta3'>3</option> <option value='scelta4'>4</option></select>");

            $('#tab_logic').append('<tr id="addr'+(i+1)+'"></tr>');
            i++;
        });
        $("#delete_row").click(function(){
            if(i>1){
                $("#addr"+(i-1)).html('');
                i--;
            }
        });

    });

</script>

</body>
</html>
