<%@ page import="com.candidatoDB.pw2.entity.UtenteQuiz" %>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.UtenteQuizIMPL" %>
<%@ page import="com.candidatoDB.pw2.entity.Utente" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.QuizIMPL" %>
<%@ page import="com.candidatoDB.pw2.entity.Quiz" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Statistiche Quiz</title>
    <link rel="icon" type="image/x-icon"
          href="${pageContext.request.contextPath}/img/logoPag.png"
          style="border-radius: 10px" />

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous" />
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/homeuser.css" />

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/statistichequiz.css" />


    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/ricerca_posizioni.css" />

</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>



<body style="background-color: #d4d4d4">

<%
    Utente utenteLoggato = (Utente) request.getSession().getAttribute("utente");

    UtenteQuizIMPL utenteQuizIMPL = new UtenteQuizIMPL();
    QuizIMPL quizIMPL = new QuizIMPL();
    ArrayList<UtenteQuiz> allUserQuizzes = utenteQuizIMPL.getAllUtenteQuizByUser(utenteLoggato.getId_user());

    System.out.println(allUserQuizzes);

%>


    <jsp:include page="jsp/navbarHeader.jsp" />

<main style="margin-top: 70px">
    <div class="container pt-3">
        <div class="container">
            <div class="row">

                <%
                    for(UtenteQuiz utenteQuiz: allUserQuizzes){
                       Quiz quiz = new QuizIMPL().getQuizById(utenteQuiz.getId_quiz());
                %>
                <div class="col-xl-3 col-lg-6 mb-4">
                <div class="bg-white rounded-lg p-5 shadow">
                    <h1 class="h6 font-weight-bold text-center mb-4"><%=quiz.getDescrizione()%></h1>

                    <div class="progress mx-auto" data-value='<%=utenteQuiz.getPunteggio()%>'>
          <span class="progress-left">
                        <span class="progress-bar border-success"></span>
          </span>
                        <span class="progress-right">
                        <span class="progress-bar border-success"></span>
          </span>
                        <div class="progress-value w-100 h-100 rounded-circle d-flex align-items-center justify-content-center">
                            <div class="h2 font-weight-bold"><%=utenteQuiz.getPunteggio()%><sup class="small">%</sup></div>
                        </div>
                    </div>


                    <div class="row text-center mt-4 justify-content-center">
                        <div class="col-6 border-right ">
                            <div class="h4 font-weight-bold mb-0"><i class="bi bi-calendar-check-fill mt-1"></i></div><span class="small text-gray"><%=utenteQuiz.getData_inserimento()%></span>
                        </div>
                    </div>

                </div>
            </div>

                <%
                    };
                %>

            </div>
        </div>
    </div>
</main>

<script>
    $(function() {

        $(".progress").each(function() {

            var value = $(this).attr('data-value');
            var left = $(this).find('.progress-left .progress-bar');
            var right = $(this).find('.progress-right .progress-bar');

            if (value > 0) {
                if (value <= 50) {
                    right.css('transform', 'rotate(' + percentageToDegrees(value) + 'deg)')
                } else {
                    right.css('transform', 'rotate(180deg)')
                    left.css('transform', 'rotate(' + percentageToDegrees(value - 50) + 'deg)')
                }
            }

        })

        function percentageToDegrees(percentage) {

            return percentage / 100 * 360

        }

    });

</script>

</body>
</html>
