package com.servlets.pw2.controller;

import com.candidatoDB.pw2.entity.Citta;
import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.interfaces.impl.UtenteIMPL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;


@WebServlet("/profiloUtente")
@MultipartConfig
public class ProfiloServlet extends HttpServlet {

    String profilo = "/profilo/profilo.jsp";


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //todo fare il check dei parametri nulli
        HttpSession session = req.getSession();
        Utente utenteInSessione = (Utente) session.getAttribute("utente");


        //indirizzo citta cap fotoprofilo genere

        Utente utenteModificato = new Utente();

        utenteModificato.setId_user(utenteInSessione.getId_user());
        utenteModificato.setRuolo_admin(utenteInSessione.getRuolo_admin());

        String oldpsw = req.getParameter("oldpsw");
        String newpasw = req.getParameter("newpsw");
        String confirmpsw = req.getParameter("confirmpsw");

        System.out.println(oldpsw + newpasw + confirmpsw);


        if (!utenteInSessione.getNome().equals(req.getParameter("nome"))) {
            utenteModificato.setNome(req.getParameter("nome"));
        } else {
            utenteModificato.setNome(utenteInSessione.getNome());
        }


        if (!utenteInSessione.getCognome().equals(req.getParameter("cognome"))) {
            utenteModificato.setCognome(req.getParameter("cognome"));
        } else {
            utenteModificato.setCognome(utenteInSessione.getCognome());
        }


        if (!utenteInSessione.getCodice_fiscale().equals(req.getParameter("codice_fiscale"))) {
            utenteModificato.setCodice_fiscale(req.getParameter("codice_fiscale"));
        } else {
            utenteModificato.setCodice_fiscale(utenteInSessione.getCodice_fiscale());
        }


        if (!utenteInSessione.getEmail().equals(req.getParameter("email"))) {
            utenteModificato.setEmail(req.getParameter("email"));
        } else {
            utenteModificato.setEmail(utenteInSessione.getEmail());
        }



        SimpleDateFormat in = new SimpleDateFormat("yyyy-MM-dd");
        String param = req.getParameter("data_nascita");
        Date data_nascita;
        try {
            data_nascita = in.parse(param);
        } catch (ParseException e) {
            ErrorManager.setErrorMessage("Qualcosa è andato storto",req);
            throw new RuntimeException(e);
        }

        //TODO IMPLEMENTARE LE  VALIDAZIONI
        if (!(utenteInSessione.getData_nascita().compareTo(data_nascita) == 0)) {
            utenteModificato.setData_nascita(new java.sql.Date(data_nascita.getTime()));
        } else {
            utenteModificato.setData_nascita(utenteInSessione.getData_nascita());
        }


        if (!req.getParameter("indirizzo").isEmpty()) {
            utenteModificato.setIndirizzo(req.getParameter("indirizzo"));
        } else {
            utenteModificato.setIndirizzo(utenteInSessione.getIndirizzo());
        }


        if (!req.getParameter("cap").isEmpty()) {
            utenteModificato.setCap(req.getParameter("cap"));
        } else {
            System.out.println("si non esiste");
            utenteModificato.setCap(utenteInSessione.getCap());
        }


        //TODO GESTIRE LE CITTA con tendina
        /*
        if(!utenteInSessione.getId_citta().getNome().equals(req.getParameter("id_citta"))){
            utenteModificato.setNome(req.getParameter("id_citta"));
        }else{
            utenteModificato.setId_citta(utenteInSessione.getId_citta());
        }*/



        if (!utenteInSessione.getTelefono().equals(req.getParameter("telefono"))) {
            utenteModificato.setTelefono(req.getParameter("telefono"));
        } else {
            utenteModificato.setTelefono(utenteInSessione.getTelefono());
        }


        if (!Objects.equals(newpasw, "")) {
            System.out.println("Not null");
            if (oldpsw.equals(utenteInSessione.getPassword())) {
                if (newpasw.equals(confirmpsw)) {
                    utenteModificato.setPassword(newpasw);
                }
            } else {
                System.out.println("error");
            }
        } else {
            utenteModificato.setPassword(utenteInSessione.getPassword());
        }

        if (req.getParameter("genere")!=null) {
            utenteModificato.setGenere(req.getParameter("genere"));
        } else {
            utenteModificato.setGenere(utenteInSessione.getGenere());
        }


        Part part = req.getPart("foto_profilo");
        String fileName = part.getSubmittedFileName();

        if (!fileName.isEmpty()) {
            String path = getServletContext().getRealPath("/" + "/img/fotoprofili" + File.separator + fileName);

            try {
                part.write(path);
                System.out.println("File caricato correttamente" + path);
                utenteModificato.setFoto_profilo("/"+ fileName);
            } catch (Exception e) {
                ErrorManager.setErrorMessage("Qualcosa è andato storto",req);
                e.printStackTrace();
            }

        }else {
            utenteModificato.setFoto_profilo(utenteInSessione.getFoto_profilo());
        }

            UtenteIMPL utenteIMPL = new UtenteIMPL();
            utenteIMPL.update(utenteModificato);
            session.removeAttribute("utente");
            session.setAttribute("utente", utenteModificato);
            ErrorManager.setSuccessMessage("Modifiche effettuate correttamente!",req);
            req.getRequestDispatcher("/profilo/profilo.jsp").forward(req, resp);
        }

    }

