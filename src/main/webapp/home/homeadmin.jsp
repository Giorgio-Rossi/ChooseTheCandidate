<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logoPag.png" style="border-radius: 10px">
</head>
<body>
<h1>Ciao <%=request.getSession().getAttribute("email")%> sei un <%=request.getSession().getAttribute("ruolo")%></h1>


</body>
</html>
