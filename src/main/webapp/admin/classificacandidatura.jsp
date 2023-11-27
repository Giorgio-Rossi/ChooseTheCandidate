<%@ page import="com.candidatoDB.pw2.entity.Utente" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.candidatoDB.pw2.entity.UtenteQuiz" %>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.*" %>
<%@ page import="com.candidatoDB.pw2.entity.Skill" %>
<%@ page import="com.candidatoDB.pw2.entity.UsersSkills" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Classifica Candidatura</title>

    <link rel="icon" type="image/x-icon"
          href="${pageContext.request.contextPath}/img/logoPag.png"
          style="border-radius: 10px">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous" />
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" />


    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/homeuser.css" />

    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/classificacandidatura.css" />


</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>


<%

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    Utente utente_loggato_admin = (Utente) request.getSession().getAttribute("admin");

    UtenteIMPL utenteIMPL = new UtenteIMPL();

    String id_posizione = request.getParameter("id_posizione");

    ArrayList<Utente> all_user_posizione = utenteIMPL.getAllUserByIdCandidatura(Integer.parseInt(id_posizione));

    ArrayList<Utente> top_3 = utenteIMPL.getTop3UserByIdCandidatura(Integer.parseInt(id_posizione));


%>

<body style="background-color: #d4d4d4">

<script>
    $(document).ready(function(){
        $('[data-bs-toggle="tooltip"]').tooltip();
    });
</script>

<jsp:include page="jspA/navbarHeaderAdmin.jsp" />


<main style="margin-top: 150px">

    <div class="container">
        <h1><%=new PosizioneIMPL().getPosizioneById(Integer.parseInt(id_posizione)).getRuolo()%> <%=new PosizioneIMPL().getPosizioneById(Integer.parseInt(id_posizione)).getCitta().getNome()%></h1>
        <%
            if(top_3.isEmpty() && all_user_posizione.isEmpty()){
        %>
        <div class="alert alert-primary d-flex justify-content-center" role="alert">
           Non sono presenti candidati per questa posizione
        </div>

        <%
            };
        %>


            <div class="row">

                <%
                    int i=1;
                    for(Utente utente: top_3){
                %>

                <div class="col mb-4">
                    <div class="bg-white rounded-lg p-5 shadow">

                        <div class="row">
                            <div class="col border-right">
                                <div class="h4 font-weight-bold mb-0"><i class="bi bi-<%=i%>-circle-fill"></i></div>
                            </div>

                            <div class="col-sm border-right">
                                <a href="${pageContext.request.contextPath}/img/cv<%=utente.getCV()%>" target="_blank" class="file-upload btn btn-success  rounded-pill shadow"><i class="bi bi-file-earmark-arrow-down-fill"></i>Curriculum</a>
                            </div>

                        </div>

                        <div class="d-flex justify-content-center">
                            <h5>
                               <%=utente.getNome()%> <%=utente.getCognome()%>
                            </h5>
                        </div>

                        <div class="col-auto d-flex justify-content-center">
                            <div class="candidate-list-images">
                                <%if(utente.getFoto_profilo()!=null){
                                %>
                                <img src=<%=request.getContextPath()+"/img/fotoprofili"+utente.getFoto_profilo()%> alt="" class="avatar-md img-thumbnail rounded-circle" />
                                <%}else {
                                %>
                                <i class="bi bi-person-circle avatar-md img-thumbnail rounded-circle"></i>
                                <%
                                    }
                                %>
                            </div>
                        </div>


                        <div class="row text-center mt-4 justify-content-center">
                            <%
                                ArrayList<String> skills = new ArrayList<>();
                                ArrayList<UsersSkills> usersSkills = new UtenteSkillsIMPL().getAllUserSkillVerified(utente);
                                for(UsersSkills us : usersSkills){
                                    skills.add(new SkillIMPL().findById(us.getId_skills()).getNome());
                                }
                            %>
                            <div class="col-6 border-right"  data-bs-custom-class="custom-tooltip"  data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Skills verificate: <%=skills.toString().replace("[","").replace("]","")%>">
                                <div class="h4 font-weight-bold mb-0"><i class="bi bi-award-fill"></i></div><strong class="h3"><%= new UtenteSkillsIMPL().getAllUserSkillVerified(utente).size()%></strong>
                            </div>
                            <div class="col-6 border-right">
                                <div class="h4 font-weight-bold mb-0"><i class="bi bi-card-checklist"></i></div><strong class="h3"><%=new UtenteQuizIMPL().getUtenteQuizById(new PosizioneIMPL().getPosizioneById(Integer.parseInt(id_posizione)).getQuiz().getId_quiz(),utente).getPunteggio()%></strong>
                            </div>
                        </div>

                    </div>
                </div>


                <%
                        i++;
                    };
                %>


            </div>
    </div>




    <div class="container">

                    <%
                        for(int j = 3;j<all_user_posizione.size();j++){
                    %>

                    <div class="candidate-list-box card mt-4">
                        <div class="py-0 card-body">
                            <div class="align-items-center row">
                                <div class="col-auto">
                                    <div class="candidate-list-images">
                                        <%if(all_user_posizione.get(j).getFoto_profilo()!=null){
                                        %>
                                        <img src=<%=request.getContextPath()+"/img/fotoprofili"+all_user_posizione.get(j).getFoto_profilo()%> alt="" class="avatar-md img-thumbnail rounded-circle" />
                                        <%}else {
                                        %>
                                        <i class="bi bi-person-circle avatar-md img-thumbnail rounded-circle"></i>
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="col-lg-5">
                                    <div class="candidate-list-content mt-3 mt-lg-0">
                                        <h5 class="fs-19 mb-0">
                                           <%=all_user_posizione.get(j).getNome()%> <%=all_user_posizione.get(j).getCognome()%>
                                        </h5>
                                        <p class="text-muted mb-2"><i class="bi bi-calendar-check-fill m-1"></i> <%=all_user_posizione.get(j).getData_nascita()%></p>
                                        <ul class="list-inline mb-0 text-muted">
                                            <%
                                                if(all_user_posizione.get(j).getId_citta()!=null){
                                            %>
                                            <li class="list-inline-item"><i class="bi bi-geo-alt-fill m-1"></i><%=all_user_posizione.get(j).getId_citta().getNome()%></li>
                                            <%
                                                };
                                            %>
                                            <li class="list-inline-item"><i class="bi bi-envelope-fill m-1"></i><%=all_user_posizione.get(j).getEmail()%></li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="col border-right">
                                    <%
                                        ArrayList<String> skills = new ArrayList<>();
                                        ArrayList<UsersSkills> usersSkills = new UtenteSkillsIMPL().getAllUserSkillVerified(all_user_posizione.get(j));
                                        for(UsersSkills us : usersSkills){
                                            skills.add(new SkillIMPL().findById(us.getId_skills()).getNome());
                                        }
                                    %>
                                    <div class="h4 font-weight-bold mb-0"><i class="bi bi-award-fill"  data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Skills verificate: <%=skills.toString().replace("[","").replace("]","")%>"></i></div><strong class="h3"><%= new UtenteSkillsIMPL().getAllUserSkillVerified(all_user_posizione.get(j)).size()%></strong>
                                </div>
                                <div class="col border-right">
                                    <div class="h4 font-weight-bold mb-0"><i class="bi bi-card-checklist"></i></div><strong class="h3"><%=new UtenteQuizIMPL().getUtenteQuizById(new PosizioneIMPL().getPosizioneById(Integer.parseInt(id_posizione)).getQuiz().getId_quiz(),all_user_posizione.get(j)).getPunteggio()%>%</strong>
                                </div>

                                <div class="col">
                                    <div class="mt-2 mt-lg-0 d-flex flex-wrap align-items-start gap-1">
                                        <a href="${pageContext.request.contextPath}/img/cv<%=all_user_posizione.get(j).getCV()%>" target="_blank" class="file-upload btn btn-success  rounded-pill shadow"><i class="bi bi-file-earmark-arrow-down-fill"></i>Curriculum</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%
                        };
                    %>


    </div>
</main>




</body>
</html>
