package com.servlets.pw2.controller;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

import com.candidatoDB.pw2.entity.Citta;
import com.candidatoDB.pw2.entity.Esperienza;
import com.candidatoDB.pw2.entity.Istruzione;
import com.candidatoDB.pw2.entity.Regione;
import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.interfaces.impl.CittaIMPL;
import com.candidatoDB.pw2.interfaces.impl.EsperienzaIMPL;
import com.candidatoDB.pw2.interfaces.impl.IstruzioneIMPL;
import com.candidatoDB.pw2.interfaces.impl.RegioneIMPL;
import com.candidatoDB.pw2.interfaces.impl.UtenteIMPL;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/curriculumUtente")
@MultipartConfig
public class CurriculumServlet extends HttpServlet {
    String curriclum = "/profilo/curriculum.jsp";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        Utente utenteInSessione = (Utente) session.getAttribute("utente");

        IstruzioneIMPL istruzioneIMPL = new IstruzioneIMPL();
        EsperienzaIMPL esperienzaIMPL = new EsperienzaIMPL();
        UtenteIMPL utenteIMPL = new UtenteIMPL();

        ArrayList<Istruzione> istruzioni_utente_loggato = (ArrayList<Istruzione>) istruzioneIMPL.getAllInstruction(utenteInSessione.getId_user());
        ArrayList<Esperienza> esperienze_utente_loggato = (ArrayList<Esperienza>) esperienzaIMPL.getAllExperience(utenteInSessione.getId_user());


        boolean isModified = false;

        //ISTRUZIONI

        // TODO GESTIRE VALIDAZIONI
        for (Istruzione istruzione : istruzioni_utente_loggato){

            Istruzione update_istruzione = new Istruzione();

            update_istruzione.setId_istruzione(istruzione.getId_istruzione());
            update_istruzione.setId_user(utenteInSessione.getId_user());


            String string_descrizione_parameter = "descrizione_istruzione" + " " + istruzione.getId_istruzione();
            String string_grado_parameter = "grado_istruzione" + " " + istruzione.getId_istruzione();
            String string_valutazione_parameter = "valutazione_istruzione" + " " + istruzione.getId_istruzione();
            String string_inizio_parameter = "inizio_istruzione" + " " + istruzione.getId_istruzione();
            String string_fine_parameter = "fine_istruzione" + " " + istruzione.getId_istruzione();
            String string_sede_parameter = "sede_istruzione" + " " + istruzione.getId_istruzione();


            String descrizione_istruzione = req.getParameter(string_descrizione_parameter);
            String grado_istruzione = req.getParameter(string_grado_parameter);
            String valutazione_istruzione = req.getParameter(string_valutazione_parameter);
            String inizo_istruzione = req.getParameter(string_inizio_parameter);
            String fine_istruzione = req.getParameter(string_fine_parameter);
            String sede_istruzione = req.getParameter(string_sede_parameter);


            if (!istruzione.getDescrizione_istruzione().equals(descrizione_istruzione)) {
                update_istruzione.setDescrizione_istruzione(descrizione_istruzione);
                isModified = true;
            } else {
                update_istruzione.setDescrizione_istruzione(istruzione.getDescrizione_istruzione());
            }

            if (!istruzione.getGrado().equals(grado_istruzione)) {
                update_istruzione.setGrado(grado_istruzione);
                isModified = true;
            } else {
                update_istruzione.setGrado(istruzione.getGrado());
            }

            if (istruzione.getValutazione() != Integer.parseInt(valutazione_istruzione)) {
                update_istruzione.setValutazione(Integer.parseInt(valutazione_istruzione));
                isModified = true;
            } else {
                update_istruzione.setValutazione(istruzione.getValutazione());
            }


            SimpleDateFormat in = new SimpleDateFormat("yyyy-MM-dd");
            Date data_inizio;
            Date data_fine;
            try {
                data_inizio = in.parse(inizo_istruzione);
                data_fine = in.parse(fine_istruzione);
            } catch (ParseException e) {
                ErrorManager.setErrorMessage("Qualcosa è andato storto",req);
                throw new RuntimeException(e);
            }


            if (istruzione.getData_inizio().compareTo(data_inizio) != 0) {
                update_istruzione.setData_inizio(new java.sql.Date(data_inizio.getTime()));
                isModified = true;
            } else {
                update_istruzione.setData_inizio(istruzione.getData_inizio());
            }

            if (istruzione.getData_fine().compareTo(data_fine) != 0) {
                update_istruzione.setData_fine(new java.sql.Date(data_fine.getTime()));
                isModified = true;
            } else {
                update_istruzione.setData_fine(istruzione.getData_fine());
            }

            Integer id_citta_istruzione = Integer.valueOf(sede_istruzione.split(" ", 4)[0]);
            Integer id_regione_istruzione = Integer.valueOf(sede_istruzione.split(" ", 4)[1]);
            String nome_citta_istruzione = sede_istruzione.split(" ", 4)[2];


            if (istruzione.getId_citta() != id_citta_istruzione) {
                update_istruzione.setId_citta(id_citta_istruzione);
                isModified = true;
            } else {
                update_istruzione.setId_citta(istruzione.getId_citta());
            }

            istruzioneIMPL.update(update_istruzione);

         }


        String[] id_istruzioni = req.getParameterValues("id_istruzione");

        //TODO GESTIRE VALIDAZIONI
        if(Arrays.asList(id_istruzioni).contains(" ")){
            Istruzione nuova_istruzione = new Istruzione();

            nuova_istruzione.setId_user(utenteInSessione.getId_user());


            String string_descrizione_parameter = "descrizione_istruzione nuova";
            String string_grado_parameter = "grado_istruzione nuova";
            String string_valutazione_parameter = "valutazione_istruzione nuova";
            String string_inizio_parameter = "inizio_istruzione nuova";
            String string_fine_parameter = "fine_istruzione nuova";
            String string_sede_parameter = "sede_istruzione nuova";


            String descrizione_istruzione_nuova = req.getParameter(string_descrizione_parameter);
            String grado_istruzione_nuova = req.getParameter(string_grado_parameter);
            String valutazione_istruzione_nuova = req.getParameter(string_valutazione_parameter);
            String inizo_istruzione_nuova = req.getParameter(string_inizio_parameter);
            String fine_istruzione_nuova = req.getParameter(string_fine_parameter);
            String sede_istruzione_nuova = req.getParameter(string_sede_parameter);


            if(!descrizione_istruzione_nuova.isEmpty()){
                nuova_istruzione.setDescrizione_istruzione(descrizione_istruzione_nuova);
            }

            if(!grado_istruzione_nuova.isEmpty()){
                nuova_istruzione.setGrado(grado_istruzione_nuova);
            }


            if(!valutazione_istruzione_nuova.isEmpty()){
                nuova_istruzione.setValutazione(Integer.parseInt(valutazione_istruzione_nuova));
            }

            if(!inizo_istruzione_nuova.isEmpty()) {

                SimpleDateFormat in = new SimpleDateFormat("yyyy-MM-dd");
                Date data_inizio_nuova;
                try {
                    data_inizio_nuova = in.parse(inizo_istruzione_nuova);
                } catch (ParseException e) {
                    ErrorManager.setErrorMessage("Qualcosa è andato storto", req);
                    throw new RuntimeException(e);
                }
                nuova_istruzione.setData_inizio(new java.sql.Date(data_inizio_nuova.getTime()));
            }

            if(!fine_istruzione_nuova.isEmpty()) {

                SimpleDateFormat in = new SimpleDateFormat("yyyy-MM-dd");
                Date data_fine_nuova;
                try {
                    data_fine_nuova = in.parse(fine_istruzione_nuova);
                } catch (ParseException e) {
                    ErrorManager.setErrorMessage("Qualcosa è andato storto", req);
                    throw new RuntimeException(e);
                }
                nuova_istruzione.setData_fine(new java.sql.Date(data_fine_nuova.getTime()));
            }

            if(sede_istruzione_nuova != null) {

                Integer id_citta_istruzione = Integer.valueOf(sede_istruzione_nuova.split(" ", 4)[0]);
                Integer id_regione_istruzione = Integer.valueOf(sede_istruzione_nuova.split(" ", 4)[1]);
                String nome_citta_istruzione = sede_istruzione_nuova.split(" ", 4)[2];

                nuova_istruzione.setId_citta(id_citta_istruzione);
            }

            System.out.println(nuova_istruzione);

            istruzioneIMPL.save(nuova_istruzione);


            ErrorManager.setSuccessMessage("Modifiche effettuate correttamente!",req);


        }


        //ESPERIENZE



        if(isModified){
            ErrorManager.setSuccessMessage("Modifiche effettuate correttamente!",req);
        } else {
            ErrorManager.setOtherMessage("Non hai modificato nulla!",req);
        }
        req.getRequestDispatcher("/home/curriculum.jsp").forward(req, resp);







       // CV
 
        Part part = req.getPart("cv");
        String fileName = part.getSubmittedFileName();

        if (!fileName.isEmpty()) {
            String path = getServletContext().getRealPath("/" + "/img/cv" + File.separator + fileName);

            try {
                part.write(path);
                System.out.println("CV caricato correttamente" + path);
                utenteInSessione.setCV("/"+ fileName);
                utenteIMPL.update(utenteInSessione);
                isModified = true;
            } catch (Exception e) {
                ErrorManager.setErrorMessage("Qualcosa è andato storto",req);
                e.printStackTrace();
            }

        }else {
            //utenteModificato.setCV(utenteInSessione.getCV());
        }
    

    }
}
