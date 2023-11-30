<%@ page import="com.candidatoDB.pw2.interfaces.impl.QuizIMPL" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.candidatoDB.pw2.entity.Quiz" %>
<%@ page import="com.candidatoDB.pw2.entity.Posizione" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    QuizIMPL quizIMPL = new QuizIMPL();
    ArrayList<Quiz> all_quizzes = quizIMPL.getAllQuiz();

%>


<html>
<head>
    <title>Gestione Quiz</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logoPag.png" style="border-radius: 10px" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homeuser.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/ricerca_posizioni.css" />
</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

<body style="background-color: #d4d4d4;">

<jsp:include page="jspA/navbarHeaderAdmin.jsp" />


<main style="margin-top: 200px;display:flex; flex-direction:column;align-items:center">
    <div class="container">

        <%
            for (Quiz quiz : all_quizzes) {
        %>

        <div class="card mb-3 shadow-lg">
            <div class="card-body">
                <div class="d-flex flex-column flex-lg-row">
                    <%
                        String initials = "";
                        for (String s : quiz.getDescrizione().split(" ")) {
                            initials += s.charAt(0);
                        }
                    %>
                    <span class="avatar avatar-text rounded-3 me-4 mb-2"><%=initials%></span>
                    <div class="row flex-fill">
                        <div class="col-sm-5">
                            <h4 class="h5"><%=quiz.getDescrizione()%></h4>
                        </div>
                        <div class="col-sm-4 py-2">
                            <span class="badge bg-info">Domande: <%=quiz.getN_domande()%></span>
                        </div>
                        <div class="col-sm-3 text-lg-end">

                            <a href="<%=request.getContextPath()%>/admin/modificaQuiz.jsp?idQuiz=<%=quiz.getId_quiz()%>" class="btn btn-primary me-2">Modifica</a>

                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#warningModal<%=quiz.getId_quiz()%>">
                                Elimina
                            </button>

                            <div class="modal fade" id="warningModal<%=quiz.getId_quiz()%>" tabindex="-1" role="dialog" data-bs-backdrop="static" data-bs-keyboard="false">
                                <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
                                    <div class="modal-content">
                                        <div class="modal-body text-center p-lg-4">
                                            <i class="bi bi-exclamation-triangle-fill" style="font-size: 5rem"></i>
                                            <h4 class="text-warning mt-3">Sei sicuro di voler eliminare il Quiz?</h4>
                                            <p class="mt-3">Una volta eliminato verranno perse le statistiche degli utenti e le domande associate</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chiudi</button>
                                            <a href="<%=request.getContextPath()%>/eliminaQuiz?idQuiz=<%=quiz.getId_quiz()%>" class="btn btn-danger me-2">Elimina</a>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>



        <%
            }
        %>

    </div>
    <div style="display:flex;margin-bottom:1%;" >
        <a href="<%=request.getContextPath()%>/admin/aggiungiQuiz.jsp" class=" btn btn-success" style="width:170px!important" >Aggiungi</a>
    </div>
</main>

<div class="modal fade" id="statusSuccessModal" tabindex="-1" role="dialog" data-bs-backdrop="static" data-bs-keyboard="false">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-body text-center p-lg-4">
                <i class="bi bi-check-circle-fill" style="font-size: 5rem"></i>
                <h4 class="text-success mt-3">Quiz creato correttamente!</h4>
                <p class="mt-3">Adesso è possibile modificarlo o eliminarlo</p>
                <button type="button" class="btn btn-sm mt-3 btn-success" data-bs-dismiss="modal">Ok</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="errorModal" tabindex="-1" role="dialog" data-bs-backdrop="static" data-bs-keyboard="false">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-body text-center p-lg-4">
                <i class="bi bi-check-circle-fill" style="font-size: 5rem"></i>
                <h4 class="text-success mt-3">Hai eliminato correttamente il Quiz!</h4>
                <p class="mt-3">Ricordati di assegnare un nuovo quiz alle posizioni che avevano il quiz eliminato:

                    <%
                        ArrayList<Posizione> posizioni =  session.getAttribute("posizioni_modificare") == null ?  null : (ArrayList<Posizione>) session.getAttribute("posizioni_modificare");
                        if(posizioni!=null){
                    for(Posizione posizione:posizioni){
                    %>
                    <%=posizione.getRuolo()%> <%=posizione.getCitta().getNome()%>
                    <%
                            }
                        };
                    %>
                </p>
                <button type="button" class="btn btn-sm mt-3 btn-success" data-bs-dismiss="modal">Ok</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="errorModal2" tabindex="-1" role="dialog" data-bs-backdrop="static" data-bs-keyboard="false">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-body text-center p-lg-4">
                <i class="bi bi-check-circle-fill" style="font-size: 5rem"></i>
                <h4 class="text-success mt-3">Hai modificato correttamente il Quiz!</h4>
                <button type="button" class="btn btn-sm mt-3 btn-success" data-bs-dismiss="modal">Ok</button>
            </div>
        </div>
    </div>
</div>

<%
    String success =  session.getAttribute("quiz_creato") == null ?  null : session.getAttribute("quiz_creato").toString();
    String delete =  session.getAttribute("quiz_eliminato") == null ?  null : session.getAttribute("quiz_eliminato").toString();
    String other =  session.getAttribute("quiz_modificato") == null ?  null : session.getAttribute("quiz_modificato").toString();


    if(success != null && Boolean.parseBoolean(success)){
%>
<script>
    var myModal = new bootstrap.Modal(document.getElementById('statusSuccessModal'))
    myModal.show()
    <% session.removeAttribute("quiz_creato");%>
</script>
<%
    }
%>

<%
    if(delete != null && Boolean.parseBoolean(delete)){
%>
<script>
    var myModal = new bootstrap.Modal(document.getElementById('errorModal'))
    myModal.show()
    <% session.removeAttribute("quiz_eliminato");%>
</script>
<%
    }
%>
<%
    if(other != null && Boolean.parseBoolean(other)){
%>
<script>
    var myModal = new bootstrap.Modal(document.getElementById('errorModal2'))
    myModal.show()
    <% session.removeAttribute("quiz_modificato");%>
</script>
<%
    }
%>


</body>
</html>
