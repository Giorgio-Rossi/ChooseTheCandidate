<%@ page import="com.candidatoDB.pw2.entity.Utente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Classifica Candidatura</title>

    <link rel="icon" type="image/x-icon"
          href="${pageContext.request.contextPath}/img/logoPag.png"
          style="border-radius: 10px">

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
%>

<body style="background-color: #d4d4d4">

<jsp:include page="/home/jsp/navbarHeaderAdmin.jsp" />


<main style="margin-top: 150px">

    <div class="container">
            <div class="row">

                <div class="col mb-4">
                    <div class="bg-white rounded-lg p-5 shadow">

                        <div class="row">
                            <div class="col border-right">
                                <div class="h4 font-weight-bold mb-0"><i class="bi bi-1-circle-fill"></i></div>
                            </div>
                        </div>

                        <div class="d-flex justify-content-center">
                            <h5>
                               Charles Dickens
                            </h5>
                        </div>

                        <div class="col-auto d-flex justify-content-center">
                            <div class="candidate-list-images">
                                <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="avatar-md img-thumbnail rounded-circle" />
                            </div>
                        </div>


                        <div class="row text-center mt-4 justify-content-center">
                            <div class="col-6 border-right">
                                <div class="h4 font-weight-bold mb-0"><i class="bi bi-award-fill"></i></div><strong class="h3">5</strong>
                            </div>
                            <div class="col-6 border-right">
                                <div class="h4 font-weight-bold mb-0"><i class="bi bi-card-checklist"></i></div><strong class="h3">85</strong>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col mb-4">
                    <div class="bg-white rounded-lg p-5 shadow">

                        <div class="row">
                            <div class="col border-right">
                                <div class="h4 font-weight-bold mb-0"><i class="bi bi-1-circle-fill"></i></div>
                            </div>
                        </div>

                        <div class="d-flex justify-content-center">
                            <h5>
                                Charles Dickens
                            </h5>
                        </div>

                        <div class="col-auto d-flex justify-content-center">
                            <div class="candidate-list-images">
                                <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="avatar-md img-thumbnail rounded-circle" />
                            </div>
                        </div>


                        <div class="row text-center mt-4 justify-content-center">
                            <div class="col-6 border-right">
                                <div class="h4 font-weight-bold mb-0"><i class="bi bi-award-fill"></i></div><strong class="h3">5</strong>
                            </div>
                            <div class="col-6 border-right">
                                <div class="h4 font-weight-bold mb-0"><i class="bi bi-card-checklist"></i></div><strong class="h3">85</strong>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col mb-4">
                    <div class="bg-white rounded-lg p-5 shadow">

                        <div class="row">
                            <div class="col border-right">
                                <div class="h4 font-weight-bold mb-0"><i class="bi bi-1-circle-fill"></i></div>
                            </div>
                        </div>

                        <div class="d-flex justify-content-center">
                            <h5>
                                Charles Dickens
                            </h5>
                        </div>

                        <div class="col-auto d-flex justify-content-center">
                            <div class="candidate-list-images">
                                <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="avatar-md img-thumbnail rounded-circle" />
                            </div>
                        </div>


                        <div class="row text-center mt-4 justify-content-center">
                            <div class="col-6 border-right">
                                <div class="h4 font-weight-bold mb-0"><i class="bi bi-award-fill"></i></div><strong class="h3">5</strong>
                            </div>
                            <div class="col-6 border-right">
                                <div class="h4 font-weight-bold mb-0"><i class="bi bi-card-checklist"></i></div><strong class="h3">85</strong>
                            </div>
                        </div>

                    </div>
                </div>


            </div>
    </div>




    <div class="container">


                    <div class="candidate-list-box card mt-4">
                        <div class="py-0 card-body">
                            <div class="align-items-center row">
                                <div class="col-auto">
                                    <div class="candidate-list-images">
                                        <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="avatar-md img-thumbnail rounded-circle" />
                                    </div>
                                </div>
                                <div class="col-lg-5">
                                    <div class="candidate-list-content mt-3 mt-lg-0">
                                        <h5 class="fs-19 mb-0">
                                            Charles Dickens
                                        </h5>
                                        <p class="text-muted mb-2">Project Manager</p>
                                        <ul class="list-inline mb-0 text-muted">
                                            <li class="list-inline-item"><i class="mdi mdi-map-marker"></i> Oakridge Lane Richardson</li>
                                            <li class="list-inline-item"><i class="mdi mdi-wallet"></i> $650 / hours</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mt-2 mt-lg-0 d-flex flex-wrap align-items-start gap-1">
                                        <span class="badge bg-soft-secondary fs-14 mt-1">Leader</span><span class="badge bg-soft-secondary fs-14 mt-1">Manager</span><span class="badge bg-soft-secondary fs-14 mt-1">Developer</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="candidate-list-box card mt-4">
                                    <div class="py-0 card-body">
                                        <div class="align-items-center row">
                                            <div class="col-auto">
                                                <div class="candidate-list-images">
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="avatar-md img-thumbnail rounded-circle" />
                                                </div>
                                            </div>
                                            <div class="col-lg-5">
                                                <div class="candidate-list-content mt-3 mt-lg-0">
                                                    <h5 class="fs-19 mb-0">
                                                        Charles Dickens
                                                    </h5>
                                                    <p class="text-muted mb-2">Project Manager</p>
                                                    <ul class="list-inline mb-0 text-muted">
                                                        <li class="list-inline-item"><i class="mdi mdi-map-marker"></i> Oakridge Lane Richardson</li>
                                                        <li class="list-inline-item"><i class="mdi mdi-wallet"></i> $650 / hours</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="mt-2 mt-lg-0 d-flex flex-wrap align-items-start gap-1">
                                                    <span class="badge bg-soft-secondary fs-14 mt-1">Leader</span><span class="badge bg-soft-secondary fs-14 mt-1">Manager</span><span class="badge bg-soft-secondary fs-14 mt-1">Developer</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                    <div class="candidate-list-box card mt-4">
                                    <div class="py-0 card-body">
                                        <div class="align-items-center row">
                                            <div class="col-auto">
                                                <div class="candidate-list-images">
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="avatar-md img-thumbnail rounded-circle" />
                                                </div>
                                            </div>
                                            <div class="col-lg-5">
                                                <div class="candidate-list-content mt-3 mt-lg-0">
                                                    <h5 class="fs-19 mb-0">
                                                        Charles Dickens
                                                    </h5>
                                                    <p class="text-muted mb-2">Project Manager</p>
                                                    <ul class="list-inline mb-0 text-muted">
                                                        <li class="list-inline-item"><i class="mdi mdi-map-marker"></i> Oakridge Lane Richardson</li>
                                                        <li class="list-inline-item"><i class="mdi mdi-wallet"></i> $650 / hours</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="mt-2 mt-lg-0 d-flex flex-wrap align-items-start gap-1">
                                                    <span class="badge bg-soft-secondary fs-14 mt-1">Leader</span><span class="badge bg-soft-secondary fs-14 mt-1">Manager</span><span class="badge bg-soft-secondary fs-14 mt-1">Developer</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                    </div>

    </div>
</main>




</body>
</html>
