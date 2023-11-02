<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homeuser.css">

<body>
<h1>Ciao <%=request.getSession().getAttribute("email")%> sei un <%=request.getSession().getAttribute("ruolo")%></h1>

<header>
    <nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white">
        <div class="position-sticky">
            <div class="list-group list-group-flush mx-3 mt-4">
                <a href="#" class="list-group-item list-group-item-action py-2 ripple" aria-current="true"><i class="fas fa-tachometer-alt fa-fw me-3"></i><span>Home</span></a>
                <a href="#" class="list-group-item list-group-item-action py-2 ripple active"><i class="fas fa-chart-area fa-fw me-3"></i><span>Profilo</span></a>
                <a href="#" class="list-group-item list-group-item-action py-2 ripple"><i class="fas fa-lock fa-fw me-3"></i><span>Curriculum</span></a>
                <a href="#" class="list-group-item list-group-item-action py-2 ripple"><i class="fas fa-chart-line fa-fw me-3"></i><span>Ricerca Posizioni</span></a>
                <a href="#" class="list-group-item list-group-item-action py-2 ripple"><i class="fas fa-chart-pie fa-fw me-3"></i><span>Candidature Effettuate</span></a>
                <a href="#" class="list-group-item list-group-item-action py-2 ripple"><i class="fas fa-chart-bar fa-fw me-3"></i><span>Logout</span></a>
            </div>
        </div>
    </nav>
    <nav id="main-navbar" class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
        <div class="container-fluid">
            <button
                    class="navbar-toggler"
                    type="button"
                    data-bs-toggle="offcanvas"
                    data-bs-target="#sidebarMenu"
                    aria-controls="sidebarMenu"
                    aria-expanded="false"
                    aria-label="offcanvasScrolling"
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
    <div class="container pt-4">
    </div>
</main>
</body>
</html>
