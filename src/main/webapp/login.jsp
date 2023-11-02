<%@ page import="com.servlets.pw2.controller.ErrorManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
<!--hvbfdbveiubnvrunbriub-->
%>
<html>
<head>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="icon" href="${pageContext.request.contextPath}/img/logoPagina.png">
</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>


<body>
<section>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6 text-white" style="background-color: #1b1b1b">

                <div class="px-5 ms-xl-4">
                    <i class="fas fa-crow fa-2x me-3 pt-5 mt-xl-4 " style="color: #709085;"></i>
                    <span class="h1 fw-bold mb-0"> <img src="${pageContext.request.contextPath}/img/logoPagina.png"
                                                        style="width: 50%;" alt="logo"></span>
                </div>

                <div class="d-flex justify-content-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5">

                    <form style="width: 23rem;" class="align-items-center" method="post" action="${pageContext.request.contextPath}/login">

                        <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Log in</h3>

                        <div class="form-outline mb-4">
                            <input type="email" name="email" id="form2Example18" class="form-control form-control-lg" required/>
                            <label class="form-label" for="form2Example18">Indirizzo email</label>
                        </div>

                        <div class="form-outline mb-4">
                            <input type="password" name="password" id="form2Example28" class="form-control form-control-lg" required/>
                            <label class="form-label" for="form2Example28">Password</label>
                        </div>
                        <%
                            if(!ErrorManager.getErrorMessage((HttpServletRequest) request).isEmpty()){
                        %>
                            <div class="alert alert-danger" role="alert">
                            <%= ErrorManager.getErrorMessage((HttpServletRequest) request)%>
                            </div>
                        <%
                        };
                        %>

                        <div class="pt-1 mb-4">
                            <button class="btn btn-info btn-lg btn-block" type="submit">Login</button>
                        </div>

                        <p class="small mb-5 pb-lg-2"><a class="text-light" href="#!">Password dimenticata?</a></p>
                        <p class="text-light">Non hai un account? <a href="${pageContext.request.contextPath}/registrazione.jsp" class="link-info text-light">Registrati qui</a></p>

                    </form>

                </div>

            </div>
            <div class="col-lg-6 px-0 d-none d-sm-block">
                <img src="${pageContext.request.contextPath}/img/copertina.jpg"
                     alt="Login image" class="w-100 vh-100" style="object-fit: cover;">
            </div>
        </div>
    </div>
</section>
</body>
</html>
