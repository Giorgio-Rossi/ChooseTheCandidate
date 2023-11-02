<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homeuser.css">

<body>
<h1>Ciao <%=request.getSession().getAttribute("email")%> sei un <%=request.getSession().getAttribute("ruolo")%></h1>

<header>
    <nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white">
        <div class="position-sticky">
            <div class="list-group list-group-flush mx-3 mt-4" style="gap: 3rem">
                <a href="#" class="list-group-item list-group-item-action py-2 ripple active" aria-current="true"><i class="bi bi-person-circle" style="margin-right: 5px;font-size: 20px"></i><span>Profilo</span></a>
                <a href="#" class="list-group-item list-group-item-action py-2 ripple"><i class="bi bi-file-earmark-person" style="margin-right: 5px;font-size: 20px"></i><span>Curriculum</span></a>
                <a href="#" class="list-group-item list-group-item-action py-2 ripple"><i class="bi bi-search" style="margin-right: 5px;font-size: 20px"></i><span>Ricerca Posizioni</span></a>
                <a href="#" class="list-group-item list-group-item-action py-2 ripple"><i class="bi bi-check2-circle" style="margin-right: 5px;font-size: 20px"></i><span>Candidature Effettuate</span></a>
                <a href="${pageContext.request.contextPath}/logout" class="list-group-item list-group-item-action py-2 ripple"><i class="bi bi-box-arrow-right" style="margin-right: 5px;font-size: 20px"></i><span>Logout</span></a>
            </div>
        </div>
    </nav>
    <nav id="main-navbar" class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
        <div class="container-fluid">
            <button
                    class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#sidebarMenu"
                    aria-controls="sidebarMenu"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
            >
                <span class="navbar-toggler-icon"></span>
            </button>

            <a class="navbar-brand" href="homeuser.jsp">
                <img
                        src="${pageContext.request.contextPath}/img/logoPagina.png"
                        height="50"
                        alt=""
                        loading="lazy"
                />
            </a>
        </div>
    </nav>

</header>


<main style="margin-top: 58px">
    <div class="container pt-3">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 d-flex align-items-stretch " style="padding-top: 50px;">
                    <div class="card shadow-lg p-3 mb-5 bg-body rounded" style="width: 18rem;">
                        <i class="bi bi-card-list" style="font-size: 10rem;text-align: center"></i>
                        <div class="card-body">
                            <h5 class="card-title" style="text-align: center"><a class="btn btn-info" href="../login.jsp">Statistiche Quiz</a></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 d-flex align-items-stretch" style="padding-top: 50px">
                    <div class="card shadow-lg p-3 mb-5 bg-body rounded" style="width: 18rem;">
                        <i class="bi bi-clipboard-data" style="font-size: 10rem;text-align: center"></i>
                        <div class="card-body">
                            <h5 class="card-title" style="text-align: center"><a class="btn btn-info" href="../login.jsp">Skills Verificate</a></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 d-flex align-items-stretch" style="padding-top: 50px">
                    <div class="card shadow-lg p-3 mb-5 bg-body rounded" style="width: 18rem;">
                        <i class="bi bi-person" style="font-size: 10rem;text-align: center"></i>
                        <div class="card-body">
                            <h5 class="card-title" style="text-align: center"><a class="btn btn-info" href="../login.jsp">Completa il profiloo</a></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 d-flex align-items-stretch" style="padding-top: 50px">
                    <div class="card shadow-lg p-3 mb-5 bg-body rounded" style="width: 18rem;">
                        <i class="bi bi-award" style="font-size: 10rem;text-align: center"></i>
                        <div class="card-body">
                            <h5 class="card-title" style="text-align: center"><a class="btn btn-info" href="../login.jsp">Miglior Candidatura</a></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 d-flex align-items-stretch" style="padding-top: 50px">
                    <div class="card shadow-lg p-3 mb-5 bg-body rounded" style="width: 18rem;">
                        <i class="bi bi-receipt-cutoff" style="font-size: 10rem;text-align: center"></i>
                        <div class="card-body">
                            <h5 class="card-title" style="text-align: center"><a class="btn btn-info" href="../login.jsp">Candidatura più recente</a></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 d-flex align-items-stretch" style="padding-top: 50px">
                    <div class="card shadow-lg p-3 mb-5 bg-body rounded" style="width: 18rem;">
                        <i class="bi bi-calendar" style="font-size: 10rem;text-align: center"></i>
                        <div class="card-body">
                            <h5 class="card-title" style="text-align: center"><a class="btn btn-info" href="../login.jsp">Annunci Recenti</a></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>




</body>
</html>
