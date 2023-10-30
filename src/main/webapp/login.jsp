
<%@ page contentType="text/html;charset=UTF-8" language="java"

%>
<html>
<head>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<body>


<form method="post" action="${pageContext.request.contextPath}/login">
    <div class="container">
        <div class="row">
            <h3 class="title">
                Login
            </h3>
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <label>Email</label>
                    <input type="text" class="form-control" placeholder="Email" name="email"/>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" placeholder="Password" name="password" />
                </div>
            </div>
            <div class="col d-flex justify-content-center">
                <img class="img-fluid mx-auto d-block" src="" style="background-color: black" />
            </div>
            <input type="submit" value="Login">
        </div>
    </div>
</form>
</body>
</html>
