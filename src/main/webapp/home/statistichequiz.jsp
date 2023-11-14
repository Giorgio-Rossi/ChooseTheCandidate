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
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<body style="background-color: #d4d4d4">


    <jsp:include page="jsp/navbarHeader.jsp" />

<main style="margin-top: 58px">
    <div class="container pt-3">
        <div class="container">
            <div class="row">

            <div class="col-lg-4 d-flex align-items-stretch">
                <div class="bg-white rounded-lg p-5 shadow">
                    <h2 class="h6 font-weight-bold text-center mb-4">Overall progress</h2>

                    <!-- Progress bar 1 -->
                    <div class="progress mx-auto" data-value='80'>
          <span class="progress-left">
                        <span class="progress-bar border-primary"></span>
          </span>
                        <span class="progress-right">
                        <span class="progress-bar border-primary"></span>
          </span>
                        <div class="progress-value w-100 h-100 rounded-circle d-flex align-items-center justify-content-center">
                            <div class="h2 font-weight-bold">80<sup class="small">%</sup></div>
                        </div>
                    </div>
                    <!-- END -->

                    <!-- Demo info -->
                    <div class="row text-center mt-4">
                        <div class="col-6 border-right">
                            <div class="h4 font-weight-bold mb-0">28%</div><span class="small text-gray">Last week</span>
                        </div>
                        <div class="col-6">
                            <div class="h4 font-weight-bold mb-0">60%</div><span class="small text-gray">Last month</span>
                        </div>
                    </div>
                    <!-- END -->
                </div>
            </div>

            <div class="col-lg-4 d-flex align-items-stretch">
                <div class="bg-white rounded-lg p-5 shadow">
                    <h2 class="h6 font-weight-bold text-center mb-4">Work hours</h2>

                    <!-- Progress bar 2 -->
                    <div class="progress mx-auto" data-value='25'>
          <span class="progress-left">
                        <span class="progress-bar border-danger"></span>
          </span>
                        <span class="progress-right">
                        <span class="progress-bar border-danger"></span>
          </span>
                        <div class="progress-value w-100 h-100 rounded-circle d-flex align-items-center justify-content-center">
                            <div class="h2 font-weight-bold">25<sup class="small">%</sup></div>
                        </div>
                    </div>
                    <!-- END -->

                    <!-- Demo info-->
                    <div class="row text-center mt-4">
                        <div class="col-6 border-right">
                            <div class="h4 font-weight-bold mb-0">28%</div><span class="small text-gray">Last week</span>
                        </div>
                        <div class="col-6">
                            <div class="h4 font-weight-bold mb-0">60%</div><span class="small text-gray">Last month</span>
                        </div>
                    </div>
                    <!-- END -->
                </div>
            </div>

            <div class="col-lg-4 d-flex align-items-stretch">
                <div class="bg-white rounded-lg p-5 shadow">
                    <h2 class="h6 font-weight-bold text-center mb-4">Server time</h2>

                    <!-- Progress bar 3 -->
                    <div class="progress mx-auto" data-value='76'>
          <span class="progress-left">
                        <span class="progress-bar border-success"></span>
          </span>
                        <span class="progress-right">
                        <span class="progress-bar border-success"></span>
          </span>
                        <div class="progress-value w-100 h-100 rounded-circle d-flex align-items-center justify-content-center">
                            <div class="h2 font-weight-bold">76<sup class="small">%</sup></div>
                        </div>
                    </div>
                    <!-- END -->

                    <!-- Demo info -->
                    <div class="row text-center mt-4">
                        <div class="col-6 border-right">
                            <div class="h4 font-weight-bold mb-0">28%</div><span class="small text-gray">Last week</span>
                        </div>
                        <div class="col-6">
                            <div class="h4 font-weight-bold mb-0">60%</div><span class="small text-gray">Last month</span>
                        </div>
                    </div>
                    <!-- END -->
                </div>
            </div>

            </div>
        </div>
    </div>
</main>

</body>
</html>
