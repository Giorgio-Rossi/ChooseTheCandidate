<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%   response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>


<html>
<head>
    <title>Profilo</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logoPag.png" style="border-radius: 10px">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homeuser.css">

<body style="background-color:#d4d4d4">

<header>
    <nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse " style="background-color:#0072BC">
        <div class="position-sticky">
            <div class="list-group list-group-flush mx-3 mt-5" style="gap: 3rem">
                <a href="${pageContext.request.contextPath}/profilo/profilo.jsp" class="list-group-item list-group-item-action py-2 ripple active" aria-current="true"><i class="bi bi-person-circle" style="margin-right: 5px;font-size: 20px"></i><span>Profilo</span></a>
                <a href="#" class="list-group-item list-group-item-action py-2 ripple"><i class="bi bi-file-earmark-person" style="margin-right: 5px;font-size: 20px"></i><span>Curriculum</span></a>
                <a href="#" class="list-group-item list-group-item-action py-2 ripple"><i class="bi bi-search" style="margin-right: 5px;font-size: 20px"></i><span>Ricerca Posizioni</span></a>
                <a href="#" class="list-group-item list-group-item-action py-2 ripple"><i class="bi bi-check2-circle" style="margin-right: 5px;font-size: 20px"></i><span>Candidature Effettuate</span></a>
                <a href="${pageContext.request.contextPath}/logout" class="list-group-item list-group-item-action py-2 ripple"><i class="bi bi-box-arrow-right" style="margin-right: 5px;font-size: 20px"></i><span>Logout</span></a>
            </div>
        </div>
    </nav>
    <nav id="main-navbar" class="navbar navbar-expand-lg navbar-light bg-white fixed-top" style="background-color:white;">
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

            <a class="navbar-brand" href="../home/homeuser.jsp">
                <img
                        src="${pageContext.request.contextPath}/img/logoPagina.png"
                        height="50"
                        alt=""
                        loading="lazy"
                />
            </a>
            <span>
                <a href="../home/homeuser.jsp"><h1><span style="float:right;font-family:Comic Sans MS">JOBHUNTER &thinsp;</span></h1></a>
            </span>
        </div>
    </nav>

</header>



<main style="margin-top: 58px">

    <div class="container mt-5">
        <div class="row flex-lg-nowrap">
            <div class="col">
                <div class="row">
                    <div class="col mb-3">
                        <div class="card mt-4">
                            <div class="card-body">
                                <div class="e-profile">
                                    <div class="row justify-content-center">
                                        <div class="col-12 col-sm-auto mb-3">
                                            <img src="../img/logoPag.png" alt="" height="150" class="rounded-3">
                                        </div>
                                        <div class="d-flex justify-content-center">
                                        <label for="fileUpload" class="file-upload btn btn-primary  rounded-pill shadow"><i class="bi bi-upload"></i> Cambia la foto profilo
                                            <input id="fileUpload" type="file" style="display: none">
                                        </label>
                                        </div>
                                            <div class="text-center text-sm-right">
                                                <div class="text-muted"><small>Joined 09 Dec 2017</small></div>
                                            </div>
                                    </div>
                                    <div class="tab-content pt-3">
                                        <div class="tab-pane active">
                                            <form class="form" novalidate="">
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>Full Name</label>
                                                                    <input class="form-control" type="text" name="name" placeholder="John Smith" value="John Smith">
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>Username</label>
                                                                    <input class="form-control" type="text" name="username" placeholder="johnny.s" value="johnny.s">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>Email</label>
                                                                    <input class="form-control" type="text" placeholder="user@example.com">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col mb-3">
                                                                <div class="form-group">
                                                                    <label>About</label>
                                                                    <textarea class="form-control" rows="5" placeholder="My Bio"></textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12 col-sm-6 mb-3">
                                                        <div class="mb-2"><b>Change Password</b></div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>Current Password</label>
                                                                    <input class="form-control" type="password" placeholder="••••••">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>New Password</label>
                                                                    <input class="form-control" type="password" placeholder="••••••">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>Confirm <span class="d-none d-xl-inline">Password</span></label>
                                                                    <input class="form-control" type="password" placeholder="••••••"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col d-flex justify-content-end">
                                                        <button class="btn btn-primary" type="submit">Save Changes</button>
                                                    </div>
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





</body>
</html>
