<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.candidatoDB.pw2.entity.*" %>
<%@ page import="com.candidatoDB.pw2.interfaces.impl.*" %>
<%@ page import="com.servlets.pw2.controller.ErrorManager" %>
<%@ page isELIgnored="false"%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    PosizioneIMPL posizioneIMPL = new PosizioneIMPL();
    ArrayList<Posizione> posizioni;

    ArrayList<Citta> cities = new CittaIMPL().getAllCitta();
    ArrayList<Regione> regioni = new RegioneIMPL().getAllRegioni();

    if (request.getAttribute("VisPosAdmin") == null) {
        posizioni = posizioneIMPL.getAllPosizioni();
    } else {
        posizioni = (ArrayList<Posizione>) request.getAttribute("VisPosAdmin");
    }

    ArrayList<String> ruoli = posizioneIMPL.getAllRuoli();

    CategoriaPosizioneIMPL categoriaPosizioneIMPL = new CategoriaPosizioneIMPL();
    ArrayList<CategoriaPosizione> categorie_posizioni = categoriaPosizioneIMPL.getAllCategoriePosizioni();
%>

<html>
<head>
    <title>Gestione Posizioni</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logoPag.png" style="border-radius: 10px" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homeuser.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/ricerca_posizioni.css" />
</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

<body style="background-color: #d4d4d4;">

    <jsp:include page="jspA/navbarHeaderAdmin.jsp" />

    <nav class="navbar navbar-expand-lg bg-light" style="position: fixed; align-items:center; display:flex; top:85px; left:21.25%; height:10%; width: 70%; z-index:2; border-radius:20px; justify-content:space-around; border:3px solid #0072bc;">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/gestioneposizioni.jsp">Gestione Posizioni</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <form class="form-inline " action="${pageContext.request.contextPath}/VisualizzazionePosizioniAdmin" method="post">
            <div class="collapse navbar-collapse  mt-4 p-2 " id="navbarSupportedContent">
                <div class="form-group " aria-labelledby="navbarDropdown" style="margin-right:10px">
                    <select class="form-select" name="ruolo" aria-label="Default select example">
                        <option disabled selected>Ruolo</option>
                        <option value="">Tutti</option>
                        <%
                            for (String r : ruoli) {
                        %>
                            <option value="<%=r%>"><%=r%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="form-group " aria-labelledby="navbarDropdown" style="margin-right:10px">
                    <select class="form-select" name="citta" aria-label="Default select example">
                        <option disabled selected>Città</option>
                        <option value="">Tutte</option>
                        <%
                            for (Regione r : regioni) {
                        %>
                            <optgroup label="<%=r.getNome()%>">
                                <%
                                    for (Citta c : cities) {
                                        if (c.getRegione().getNome().equals(r.getNome())) {
                                %>
                                            <option value="<%=c.getId_citta()%>"><%=c.getNome()%></option>
                                <%
                                        }
                                    }
                                %>
                            </optgroup>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="form-group " aria-labelledby="navbarDropdown" style="margin-right:10px">
                    <select class="form-select" name="categoria" aria-label="Default select example">
                        <option disabled selected>Categoria</option>
                        <option value="">Tutte</option>
                        <%
                            for (CategoriaPosizione cat : categorie_posizioni) {
                        %>
                            <option value="<%=cat.getId_categoria()%>"><%=cat.getNome_categoria()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Cerca</button>
            </div>
        </form>
    </nav>

    <main style="margin-top: 200px;display:flex; flex-direction:column;align-items:center">
        <div class="container">

            <%
                for (Posizione posizione : posizioni) {
            %>

            <div class="card mb-3 shadow-lg">
                <div class="card-body">
                    <div class="d-flex flex-column flex-lg-row">
                        <%
                            String initials = "";
                            for (String s : posizione.getRuolo().split(" ")) {
                                initials += s.charAt(0);
                            }
                        %>
                        <span class="avatar avatar-text rounded-3 me-4 mb-2"><%=initials%></span>
                        <div class="row flex-fill">
                            <div class="col-sm-5">
                                <h4 class="h5"><%=posizione.getRuolo()%></h4>
                                <span class="badge bg-primary m-1"><%=posizione.getCitta().getNome()%></span><span class="badge bg-success"><i class="bi bi-calendar-check-fill mt-2"> <%=posizione.getData_inserimento()%></i></span>
                            </div>
                            <div class="col-sm-4 py-2">
                                <span class="badge bg-info"><%=posizione.getCategoria().getNome_categoria()%></span>
                                <span class="badge bg-info">Ammissioni massime: <%=posizione.getN_ammissioni()%></span>
                            </div>
                            <div class="col-sm-3 text-lg-end">
                                <%
                                    if(posizione.getStato().equals("aperta")){
                                %>
                                <span class="badge bg-success"><%=posizione.getStato()%></span>
                                <%
                                    }else {
                                %>

                                <span class="badge bg-danger"><%=posizione.getStato()%></span>

                                <%
                                    };
                                %>
                               
                               <a href="<%=request.getContextPath()%>/admin/modificaPosizione.jsp?idPosizione=<%=posizione.getId_posizione()%>" class="btn btn-primary me-2">Modifica</a>

                                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#warningModal<%=posizione.getId_posizione()%>">
                                    Elimina
                                </button>

                                <div class="modal fade" id="warningModal<%=posizione.getId_posizione()%>" tabindex="-1" role="dialog" data-bs-backdrop="static" data-bs-keyboard="false">
                                    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
                                        <div class="modal-content">
                                            <div class="modal-body text-center p-lg-4">
                                                <i class="bi bi-exclamation-triangle-fill" style="font-size: 5rem"></i>
                                                <h4 class="text-warning mt-3">Sei sicuro di voler eliminare la posizione?</h4>
                                                <p class="mt-3">Una volta eliminata non sarà più possibile visualizzare eventuali candidati</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chiudi</button>
                                                <a href="<%=request.getContextPath()%>/eliminaPosizione?idPosizione=<%=posizione.getId_posizione()%>" class="btn btn-danger me-2">Elimina</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>

         

            <%
                }
            %>

        </div>
        <div style="display:flex;margin-bottom:1%;" >
       	 	<a href="<%=request.getContextPath()%>/admin/aggiungiPosizione.jsp" class=" btn btn-success" style="width:170px!important" >Aggiungi</a>
        </div>
    </main>


    <div class="modal fade" id="statusSuccessModal" tabindex="-1" role="dialog" data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-body text-center p-lg-4">
                    <i class="bi bi-check-circle-fill" style="font-size: 5rem"></i>
                    <h4 class="text-success mt-3">Posizione creata correttamente!</h4>
                    <p class="mt-3">Adesso è possibile modificarla e visualizzarne i candidati</p>
                    <button type="button" class="btn btn-sm mt-3 btn-success" data-bs-dismiss="modal">Ok</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="errorModal" tabindex="-1" role="dialog" data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-body text-center p-lg-4">
                    <i class="bi bi-check-circle-fill" style="font-size: 5rem"></i>
                    <h4 class="text-success mt-3">Hai eliminato correttamente la candidatura!</h4>
                    <button type="button" class="btn btn-sm mt-3 btn-success" data-bs-dismiss="modal">Ok</button>
                </div>
            </div>
        </div>
    </div>



    
</body>

<%
    String success =  session.getAttribute("posizione_creata") == null ?  null : session.getAttribute("posizione_creata").toString();
    String delete =  session.getAttribute("posizione_eliminata") == null ?  null : session.getAttribute("posizione_eliminata").toString();


    if(success != null && Boolean.parseBoolean(success)){
%>
<script>
    var myModal = new bootstrap.Modal(document.getElementById('statusSuccessModal'))
    myModal.show()
    <% session.removeAttribute("posizione_creata");%>
</script>
<%
    }
%>
<%
    if(delete != null && Boolean.parseBoolean(delete)){
%>
<script>
    var myModal = new bootstrap.Modal(document.getElementById('errorModal'))
    myModal.show()
    <% session.removeAttribute("posizione_eliminata");%>
</script>
<%
    }
%>

</html>