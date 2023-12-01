<%@ page import="java.util.HashMap" %>
<%@ page import="com.candidatoDB.pw2.entity.Domanda" %>
<%@ page import="com.candidatoDB.pw2.entity.RisposteDomande" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;" language="java" %>

<html>
<head>
    <title>Quiz</title>


    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous" />
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />

</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>


<body>

<%
    HashMap<Domanda, ArrayList<RisposteDomande>> risposte = (HashMap<Domanda, ArrayList<RisposteDomande>>) session.getAttribute("quiz");
    System.out.println(risposte);
%>


<div class="container-fluid" style="background-color:#d4d4d4;display:flex;justify-content:center;flex-direction:column;padding:0;">
	<div >
    <div  style="align-items:center;justify-content:center;padding-bottom:2%;height:100%">
        <h3 style="font-size:5em;background-color:white;display:flex;align-items:center;justify-content:center;"><%=session.getAttribute("nome_quiz")%></h3>
    </div>

    <form method="post" action="${pageContext.request.contextPath}/RisulatatoQuiz" >

        <%
            int ndomanda = 0;
            int i=1;
            for(Map.Entry<Domanda,ArrayList<RisposteDomande>> entry : risposte.entrySet()){
        %>

                <div class="card mb-4  " style="width:80%;margin-left:10%" >

                    <div class="d-flex justify-content-between align-items-center  center card-header text-white" id="h1" style="--bs-bg-opacity: 1;background-color:#0072BC;" >
                        <span>Domanda <%=i%></span>
                        <button type="button" data-bs-toggle="collapse" data-bs-target="#n<%=i%>" aria-expanded="false" aria-controls="collapseExample" class="btn btn-outline-light">
                        </button>
                    </div>
                    <div id="n<%=i%>" class="collapse show" aria-labelledby="h1" >
                        <div class="card-body">
                            <p><%=entry.getKey().getTesto()%></p>

                            <%
                                int value = 1;
                                for(RisposteDomande risposteDomande : entry.getValue()){
                            %>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="<%=ndomanda%>" id="<%=entry.getKey().getTesto()%>" value="<%=value++%>">
                                        <label class="form-check-label" for="<%=risposteDomande.getScelta1()%>">
                                           <%=risposteDomande.getScelta1()%>
                                        </label>
                                    </div>

                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="<%=ndomanda%>" id="<%=entry.getKey().getTesto()%>" value="<%=value++%>">
                                        <label class="form-check-label" for="<%=risposteDomande.getScelta2()%>">
                                            <%=risposteDomande.getScelta2()%>
                                        </label>
                                    </div>

                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="<%=ndomanda%>" id="<%=entry.getKey().getTesto()%>" value="<%=value++%>">
                                        <label class="form-check-label" for="<%=risposteDomande.getScelta3()%>">
                                            <%=risposteDomande.getScelta3()%>
                                        </label>
                                    </div>

                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="<%=ndomanda%>" id="<%=entry.getKey().getTesto()%>" value="<%=value++%>">
                                        <label class="form-check-label" for="<%=risposteDomande.getScelta4()%>">
                                            <%=risposteDomande.getScelta4()%>
                                        </label>
                            </div>

                            <%
                                };
                            %>


                        </div>

                    </div>
                </div>

        <%
                    ndomanda++;
                i++;
            };
        %>

		<div style="display:flex;align-items:center;justify-content:center;">
        	<button style="width:25%;"type="submit" class="btn btn-success">Invia</button>
		</div>
    </form>

</div>
</div>


</body>
</html>
