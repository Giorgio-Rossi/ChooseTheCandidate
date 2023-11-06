package com.servlets.pw2.controller;

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


@WebServlet("/profiloUtente")
@MultipartConfig
public class ProfiloServlet extends HttpServlet {

    String profilo  = "/profilo/profilo.jsp";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Utente utenteInSessione = (Utente) session.getAttribute("utente");

        Utente utenteModificato = new Utente();

        utenteModificato.setId_user(utenteInSessione.getId_user());
        utenteModificato.setRuolo_admin(utenteInSessione.getRuolo_admin());

        String oldpsw = req.getParameter("oldpsw");
        String newpasw = req.getParameter("newpsw");
        String confirmpsw = req.getParameter("confirmpsw");




        if(!utenteInSessione.getNome().equals(req.getParameter("nome"))){
            utenteModificato.setNome(req.getParameter("nome"));
        }else{
            utenteModificato.setNome(utenteInSessione.getNome());
        }


        if(!utenteInSessione.getCognome().equals(req.getParameter("cognome"))){
            utenteModificato.setCognome(req.getParameter("cognome"));
        }else{
            utenteModificato.setCognome(utenteInSessione.getCognome());
        }


        if(!utenteInSessione.getCodice_fiscale().equals(req.getParameter("codice_fiscale"))){
            utenteModificato.setCodice_fiscale(req.getParameter("codice_fiscale"));
        }else{
            utenteModificato.setCodice_fiscale(utenteInSessione.getCodice_fiscale());
        }


        if(!utenteInSessione.getEmail().equals(req.getParameter("email"))){
            utenteModificato.setEmail(req.getParameter("email"));
        }else{
            utenteModificato.setEmail(utenteInSessione.getEmail());
        }

        SimpleDateFormat in = new SimpleDateFormat("yyyy-MM-dd");
        String param = req.getParameter("data_nascita");
        Date data_nascita;
        try {
            data_nascita = in.parse(param);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        //TODO IMPLEMENTARE LE  VALIDAZIONI
        if(!(utenteInSessione.getData_nascita().compareTo(data_nascita) == 0)){
            utenteModificato.setData_nascita(data_nascita);
        }else{
            utenteModificato.setData_nascita(utenteInSessione.getData_nascita());
        }


        if(!utenteInSessione.getIndirizzo().equals(req.getParameter("indirizzo"))){
            utenteModificato.setIndirizzo(req.getParameter("indirizzo"));
        }else{
            utenteModificato.setIndirizzo(utenteInSessione.getIndirizzo());
        }

        //TODO GESTIRE LE CITTA con tendina
        /*
        if(!utenteInSessione.getId_citta().getNome().equals(req.getParameter("id_citta"))){
            utenteModificato.setNome(req.getParameter("id_citta"));
        }else{
            utenteModificato.setId_citta(utenteInSessione.getId_citta());
        }*/


        if(!utenteInSessione.getCap().equals(req.getParameter("cap"))){
            utenteModificato.setCap(req.getParameter("cap"));
        }else{
            utenteModificato.setCap(utenteInSessione.getCap());
        }


        if(!utenteInSessione.getTelefono().equals(req.getParameter("telefono"))){
            utenteModificato.setTelefono(req.getParameter("telefono"));
        }else{
            utenteModificato.setTelefono(utenteInSessione.getTelefono());
        }


        if(newpasw != null) {
            if (oldpsw.equals(utenteInSessione.getPassword())) {
                if(newpasw.equals(confirmpsw)){
                    utenteModificato.setPassword(newpasw);
                }
            } else{
                System.out.println("error");
            }
        } else{
            utenteModificato.setPassword(utenteInSessione.getPassword());
        }


        if(!utenteInSessione.getGenere().equals(req.getParameter("genere"))){
            utenteModificato.setGenere(req.getParameter("genere"));
        }else{
            utenteModificato.setGenere(utenteInSessione.getGenere());
        }


        if(req.getPart("foto_profilo")==null) {
            Part part = req.getPart("foto_profilo");
            String fileName = part.getSubmittedFileName();
            String path = getServletContext().getRealPath("/" + "img/fotoprofili" + File.separator + fileName);

            InputStream is = part.getInputStream();
            boolean success = uploadFile(is, path);
            if (success) {
                System.out.println("File caricato correttamente" + path);
                req.getRequestDispatcher("/profilo.jsp").forward(req, resp);
                utenteModificato.setFoto_profilo(path);
            }
        }else {
            utenteModificato.setFoto_profilo(utenteInSessione.getFoto_profilo());
        }

        UtenteIMPL utenteIMPL = new UtenteIMPL();
        utenteIMPL.update(utenteModificato);

    }

    public boolean uploadFile(InputStream is, String path){
        boolean test = false;

        try {
            byte[] bytes = new byte[is.available()];
            is.read();
            FileOutputStream fileOutputStream = new FileOutputStream(path);
            fileOutputStream.write(bytes);
            fileOutputStream.flush();
            fileOutputStream.close();

            test=true;
        }catch (Exception e){
            e.printStackTrace();
        }

        return test;
    }
}
