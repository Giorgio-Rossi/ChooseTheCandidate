<%@ page import="com.servlets.pw2.controller.ErrorManager" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.candidatoDB.pw2.entity.Utente" %>
<%@ page import="com.candidatoDB.pw2.entity.Citta" %>
<%@ page import="com.candidatoDB.pw2.entity.Regione" %>
<%@ page import="com.candidatoDB.pw2.entity.Esperienza" %>
<%@ page import="com.candidatoDB.pw2.entity.Istruzione" %>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.RegioneIMPL" %>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.IstruzioneIMPL" %>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.EsperienzaIMPL" %>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.UtenteIMPL" %>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.CittaIMPL" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% 
UtenteIMPL utenteIMPL = new UtenteIMPL();
Utente utente = (Utente) session.getAttribute("utente");
Esperienza esperienza = (Esperienza) session.getAttribute("esperienza");


	ArrayList<Esperienza> esperienzeUtente = new EsperienzaIMPL().getAllExperience();
  
	ArrayList<Istruzione> istruzioneUtente = new IstruzioneIMPL().getAllInstruction();
   

    System.out.println(utente.toString());

   
    //ArrayList<Regione> regioni = new RegioneIMPL().getAllRegioni();

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>


<html>

<head>
<title>Curriculum</title>
<!--  <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logoPag.png" style="border-radius: 10px"> -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homeuser.css">

<body style="background-color:#d4d4d4">

<jsp:include page="jsp/navbarHeader.jsp" />



<main style="margin-top: 58px">

    <div class="container mt-5">

        <div class="row flex-lg-nowrap">
            <div class="col">
                <div class="row">
                    <div class="col mb-3">
                        <div class="card mt-4">
                            <div class="card-body">
                                                         <%
                                    if(!ErrorManager.getSUccessMessage((HttpServletRequest) request).isEmpty()){
                                %>
                                <div class="alert alert-success">
                                    <%= ErrorManager.getSUccessMessage((HttpServletRequest) request)%>
                                </div>
                                <%
                                    };
                                %>
                                <%
                                    if(!ErrorManager.getErrorMessage((HttpServletRequest) request).isEmpty()){
                                %>
                                <div class="alert alert-danger">
                                    <%= ErrorManager.getErrorMessage((HttpServletRequest) request)%>
                                </div>
                                <%
                                    };
                                %>
                                <%
                                    if(!ErrorManager.getOtherMessage((HttpServletRequest) request).isEmpty()){
                                %>
                                <div class="alert alert-warning">
                                    <%= ErrorManager.getOtherMessage((HttpServletRequest) request)%>
                                </div>
                                <%
                                    };
                                %>
                                
                                
                                <div class="e-experience">
                                    <div class="row justify-content-center">
                                        <div class="col-12 col-sm-auto mb-3">
                                            <%if(utente.getCV()!=null){
                                            %>
                                            <img src=<%=request.getContextPath()+"/img/cv"+utente.getCV()%> alt="" height="150" class="rounded-3">
                                            <%}else {
                                             %>
                                            <i class="bi bi-person-circle" style="margin-right: 5px;font-size: 150px"></i>
                                            <%
                                                }
                                            %>
                                        </div>
                                         </div>
                                        
								<div class="d-flex justify-content-center">
                                       <label for="fileUpload" class="file-upload btn btn-primary  rounded-pill shadow"><i class="bi bi-upload"></i> Cambia il Cv
                                            <input id="fileUpload" type="file" accept="image/*" name="cv" form="modifica_curriculum" style="display: none">
                                        </label>
                                        </div>
                                        
                             
                                                   
							    <div class="tab-content pt-3">
                                        <div class="tab-pane active">
                                            <form class="form" method="post" action="${pageContext.request.contextPath}/curriculumUtente" id="modifica_curriculum"  enctype='multipart/form-data'>
                                                <div class="row">
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>Posizione lavorativa</label>
                                                                    
                                                                	<%
																		if(esperienza!=null){
																	%>
																	<span class="badge rounded-pill bg-success float-md-end mb-3 mb-sm-0"><%=esperienza.getPosizione_lavorativa()%></span>
																	<%
																	}else{

																		%>
																		<span class="badge rounded-pill bg-danger float-md-end mb-3 mb-sm-0"><%=esperienza.getPosizione_lavorativa()%></span>
																		<input class="form-control" type="text" name="esperienza" placeholder=<%= esperienza.getPosizione_lavorativa() %> value=<%= esperienza.getPosizione_lavorativa()%> >>
																		<%
																			};
																		%>
																		
																		
                                                                </div>
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
            
</html>