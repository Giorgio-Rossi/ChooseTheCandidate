<%@ page import="com.candidatoDB.pw2.entity.Utente" %>
<%@ page import="com.servlets.pw2.controller.ErrorManager" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.candidatoDB.pw2.entity.Citta" %>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.CittaIMPL" %>
<%@ page import="com.candidatoDB.pw2.entity.Regione" %>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.RegioneIMPL" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
Utente utente = (Utente) session.getAttribute("utente");

ArrayList<Regione> regioni = new RegioneIMPL().getAllRegioni();

ArrayList<Citta> cities = new CittaIMPL().getAllCitta();

%>

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

                                <div class="e-profile">
                                    <div class="row justify-content-center">
                                        <div class="col-12 col-sm-auto mb-3">
                                            <%if(utente.getFoto_profilo()!=null){
                                            %>
                                            <img src=<%=request.getContextPath()+"/img/fotoprofili"+utente.getFoto_profilo()%> alt="" height="150" class="rounded-3">
                                            <%}else {
                                             %>
                                            <i class="bi bi-person-circle" style="margin-right: 5px;font-size: 150px"></i>
                                            <%
                                                }
                                            %>
                                        </div>
                                        <div class="d-flex justify-content-center">
                                        <label for="fileUpload" class="file-upload btn btn-primary  rounded-pill shadow"><i class="bi bi-upload"></i> Cambia la foto profilo
                                            <input id="fileUpload" type="file" accept="image/*" name="foto_profilo" form="modifica_profilo" style="display: none">
                                        </label>
                                        </div>
                                            <div class="text-center text-sm-right">
                                                <div class="text-muted"><small>Registrato il 09 Dec 2017</small></div>
                                            </div>
                                    </div>
                                    <div class="tab-content pt-3">
                                        <div class="tab-pane active">
                                            <form class="form" method="post" action="${pageContext.request.contextPath}/profiloUtente" id="modifica_profilo"  enctype='multipart/form-data'>
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>Nome</label>
                                                                    <input class="form-control" type="text" name="nome" placeholder=<%=utente.getNome()%> value=<%=utente.getNome()%> required>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>Cognome</label>
                                                                    <input class="form-control" type="text" name="cognome" placeholder=<%=utente.getCognome()%> value=<%=utente.getCognome()%> required>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col">
                                                                <div class="form-group">
                                                                    <label>Genere</label>
                                                                    <select class="form-select" aria-label="Default select example" name="genere">
                                                                        <%String genere = (utente.getGenere()!=null)?utente.getGenere():"";%>
                                                                        <option value="" disabled selected><%=genere%></option>
                                                                        <option value="uomo">Uomo</option>
                                                                        <option value="donna">Donna</option>
                                                                        <option value="non specificare">Preferisco non specificarlo</option>
                                                                    </select>
                                                                </div>
                                                                </div>
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Data di nascita</label>
                                                                        <%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ"); %>
                                                                        <input class="form-control" type="date" name="data_nascita"  value=<%=utente.getData_nascita()%>>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>Indirizzo di residenza</label>
                                                                    <%String indirizzo = (utente.getIndirizzo()!=null)?utente.getIndirizzo(): " ";%>
                                                                    <input class="form-control" type="text" placeholder="<%=indirizzo%>" value="<%=indirizzo%>" name="indirizzo">
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>Cap</label>
                                                                    <%String cap = (utente.getCap()!=null)?utente.getCap():"";%>
                                                                    <input class="form-control" type="text" pattern="[0-9]{5}" placeholder="<%=cap%>" value="<%=cap%>" name="cap">
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>Telefono</label>
                                                                    <input class="form-control" type="tel"  placeholder=<%=utente.getTelefono()%> value=<%=utente.getTelefono()%> name="telefono">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>Codice Fiscale</label>
                                                                    <input class="form-control" type="text"  placeholder="<%=utente.getCodice_fiscale()%>" value="<%=utente.getCodice_fiscale()%>" name="codice_fiscale">
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <%Citta citta = (utente.getId_citta() !=null)?utente.getId_citta() : null;

                                                                    %>
                                                                    <label>Città di nascita</label>
                                                                    <select class="form-select" aria-label="Default select example" name="citta">

                                                                        <%
                                                                            if(citta!=null){

                                                                        %>
                                                                        <option value="<%=citta.getId_citta()+" "+citta.getRegione().getId_regione()+" "+citta.getNome()%>" selected><%=utente.getId_citta().getNome()%></option>
                                                                        <%
                                                                            }else{
                                                                        %>
                                                                             <option selected style="display: none" value="">Seleziona una città</option>
                                                                        <%
                                                                            };
                                                                        %>
                                                                        <%
                                                                            for(Regione r : regioni) {
                                                                            %>
                                                                            <optgroup label="<%=r.getNome()%>">
                                                                            <%
                                                                                    for(Citta c : cities){
                                                                                     if(c.getRegione().getNome().equals(r.getNome())){
                                                                                         %>
                                                                                        <option value="<%=c.getId_citta()+" "+r.getId_regione()+" "+c.getNome()%>"><%=c.getNome()%></option>
                                                                            <%
                                                                                     }
                                                                                    }
                                                                            }
                                                                        %>


                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12 col-sm-6 mt-4">
                                                        <div class="mb-2"><b>Informazioni d'accesso</b></div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>Email</label>
                                                                    <input class="form-control" type="email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" placeholder=<%=utente.getEmail()%> value=<%=utente.getEmail()%> name="email" required>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>Vecchia Password</label>
                                                                    <input class="form-control" type="password"  name="oldpsw" id="oldpsw">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>Nuova Password</label>
                                                                    <input class="form-control" type="password"  name="newpsw" id="newpsw">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>Conferma <span class="d-none d-xl-inline">Password</span></label>
                                                                    <input class="form-control" type="password"  name="confirmpsw" id="confirmpsw"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col d-flex justify-content-end">
                                                        <button class="btn btn-primary" type="submit">Salva</button>
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
