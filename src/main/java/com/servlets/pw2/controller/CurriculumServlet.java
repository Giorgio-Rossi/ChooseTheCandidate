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
        //Utente utenteModificato = new Utente();
        Utente utenteInSessione = (Utente) session.getAttribute("utente");
        IstruzioneIMPL istruzioneIMPL = new IstruzioneIMPL();
        ArrayList<Istruzione> istruzioni_utente_loggato = (ArrayList<Istruzione>) istruzioneIMPL.getAllInstruction(utenteInSessione.getId_user());
        boolean isModified = false;


        // TODO GESTIRE IL CAMBIO INFORMAZIONI DI ISTRUZIONI GIA PRESENTI
        for (Istruzione istruzione : istruzioni_utente_loggato){

            Istruzione update_istruzione = new Istruzione();

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


            if (istruzione.getData_inizio().compareTo(data_inizio) == 0) {
                update_istruzione.setData_inizio(new java.sql.Date(data_inizio.getTime()));
                isModified = true;
            } else {
                update_istruzione.setData_inizio(istruzione.getData_inizio());
            }

            if (istruzione.getData_fine().compareTo(data_fine) == 0) {
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

            //System.out.println(update_istruzione);

            //TODO NON SALVA LE MODIFICHE
            istruzioneIMPL.update(update_istruzione);

            if(isModified){
                ErrorManager.setSuccessMessage("Modifiche effettuate correttamente!",req);
            } else {
                ErrorManager.setOtherMessage("Non hai modificato nulla!",req);
            }
            req.getRequestDispatcher("/home/curriculum.jsp").forward(req, resp);
         }


        String[] id_istruzioni = req.getParameterValues("id_istruzione");

        //TODO GESTISCI AGGIUNTA NUOVE ISTRUZIONE
        if(Arrays.asList(id_istruzioni).contains("")){
            //System.out.println("SI ");
        }



        /*
        Esperienza utenteInSessioneEsperienza = (Esperienza) session.getAttribute("esperienza");

        //  ESPERIENZA LAVORATIVA

        Esperienza EsperienzaModificata = new Esperienza();

        boolean isModified = false;

        // Posizione lavorativa
        if (!utenteInSessioneEsperienza.getPosizione_lavorativa().equals(req.getParameter("posizione"))) {
            utenteInSessioneEsperienza.setPosizione_lavorativa(req.getParameter("posizione"));
            isModified = true;
        } else {
            EsperienzaModificata.setPosizione_lavorativa(utenteInSessioneEsperienza.getPosizione_lavorativa());
        }
        

        if (!req.getParameter("posizione").isEmpty()) {
            EsperienzaModificata.setPosizione_lavorativa(req.getParameter("posizione"));
        } else {
            EsperienzaModificata.setPosizione_lavorativa(utenteInSessioneEsperienza.getPosizione_lavorativa());
        }
        // Azienda
        if (!utenteInSessioneEsperienza.getAzienda().equals(req.getParameter("azienda"))) {
            utenteInSessioneEsperienza.setAzienda(req.getParameter("azienda"));
            isModified = true;
        } else {
            EsperienzaModificata.setPosizione_lavorativa(utenteInSessioneEsperienza.getAzienda());
        }

        // DATE
        SimpleDateFormat in = new SimpleDateFormat("yyyy-MM-dd");
        String param1 = req.getParameter("data_inizio");
        Date data_inizio;
        Date data_fine;
        
        // Data inizio
        try {
            data_inizio = in.parse(param1);
        } catch (ParseException e) {
            ErrorManager.setErrorMessage("Qualcosa è andato storto",req);
            throw new RuntimeException(e);
        }

        if (!(utenteInSessioneEsperienza.getData_inizio().compareTo(data_inizio) == 0)){
            utenteInSessioneEsperienza.setData_inizio(new java.sql.Date(data_inizio.getTime()));
            isModified = true;
        } else {
            EsperienzaModificata.setData_inizio(utenteInSessioneEsperienza.getData_inizio());
        }

        // Data Fine
        String param2 = req.getParameter("data_fine");
        try {
            data_fine = in.parse(param2);
        } catch (ParseException e) {
            ErrorManager.setErrorMessage("Qualcosa è andato storto",req);
            throw new RuntimeException(e);
        }

         if (!(utenteInSessioneEsperienza.getData_fine().compareTo(data_fine) == 0)){
            utenteInSessioneEsperienza.setData_fine(new java.sql.Date(data_fine.getTime()));
            isModified = true;
        } else {
            EsperienzaModificata.setData_fine(utenteInSessioneEsperienza.getData_fine());
        }
         
         // RAL
         if(!req.getParameter("ral").isEmpty()){
             Integer ral = Integer.valueOf(req.getParameter("ral").split(" ", 3)[0]);
             EsperienzaModificata.setRal(ral);
             isModified = true;
            }else {
                EsperienzaModificata.setRal(EsperienzaModificata.getRal());
            }   
    
         // Tipo contratto
        if (!utenteInSessioneEsperienza.getTipo_contratto().equals(req.getParameter("tipo_contratto"))) {
            utenteInSessioneEsperienza.setTipo_contratto(req.getParameter("tipo_contratto"));
            isModified = true;
        } else {
            EsperienzaModificata.setTipo_contratto(utenteInSessioneEsperienza.getTipo_contratto());
        }

        // Settore
       if (!utenteInSessioneEsperienza.getSettore().equals(req.getParameter("settore"))) {
            utenteInSessioneEsperienza.setSettore(req.getParameter("settore"));
            isModified = true;
        } else {
            EsperienzaModificata.setSettore(utenteInSessioneEsperienza.getSettore());
        }
       		// Descrizione attività
        if (!utenteInSessioneEsperienza.getDescrizione_attivita().equals(req.getParameter("descrizione_attivita"))) {
            utenteInSessioneEsperienza.setDescrizione_attivita(req.getParameter("descrizione_attivita"));
            isModified = true;
        } else {
            EsperienzaModificata.setDescrizione_attivita(utenteInSessioneEsperienza.getDescrizione_attivita());
        }




        //      ISTRUZIONE
        
        Istruzione utenteInSessioneIstruzione = (Istruzione) session.getAttribute("istruzione");

        Istruzione IstruzioneModificata = new Istruzione();
        // Grado
        if (!utenteInSessioneIstruzione.getGrado().equals(req.getParameter("grado"))) {
            utenteInSessioneIstruzione.setGrado(req.getParameter("grado"));
            isModified = true;
        } else {
            IstruzioneModificata.setGrado(utenteInSessioneIstruzione.getGrado());
        }

        // ID citta
         Integer id_citta = Integer.valueOf(req.getParameter("citta").split(" ", 3)[0]);
            Integer id_regione = Integer.valueOf(req.getParameter("citta").split(" ", 3)[1]);
            String nome_citta = req.getParameter("citta").split(" ", 3)[2];

            Citta citta_utente_sessione = utenteInSessione.getId_citta();

            IstruzioneIMPL IstruzioneIMPL = new IstruzioneIMPL();
            Regione regione = new Regione();
            Citta citta = new Citta(id_citta, regione, nome_citta);
            IstruzioneModificata.setId_citta(id_citta);
            isModified = true;

            // Descrizione
        if (!utenteInSessioneIstruzione.getDescrizione_istruzione().equals(req.getParameter("descrizione_istruzione"))) {
            utenteInSessioneIstruzione.setDescrizione_istruzione(req.getParameter("descrizione_istruzione"));
            isModified = true;
        } else {
            IstruzioneModificata.setGrado(utenteInSessioneIstruzione.getDescrizione_istruzione());
        }
        
     // Data inizio
        String param3 = req.getParameter("data_inizio");
        try {
            data_inizio = in.parse(param3);
        } catch (ParseException e) {
            ErrorManager.setErrorMessage("Qualcosa è andato storto",req);
            throw new RuntimeException(e);
        }

        if (!(utenteInSessioneIstruzione.getData_inizio().compareTo(data_inizio) == 0)){
            utenteInSessioneIstruzione.setData_inizio(new java.sql.Date(data_inizio.getTime()));
            isModified = true;
        } else {
            IstruzioneModificata.setData_inizio(utenteInSessioneIstruzione.getData_inizio());
        }

     // Data fine
        String param4 = req.getParameter("data_fine");
         try {
            data_fine = in.parse(param4);
        } catch (ParseException e) {
            ErrorManager.setErrorMessage("Qualcosa è andato storto",req);
            throw new RuntimeException(e);
        }

         if (!(utenteInSessioneIstruzione.getData_fine().compareTo(data_fine) == 0)){
            utenteInSessioneIstruzione.setData_fine(new java.sql.Date(data_fine.getTime()));
            isModified = true;
        } else {
            IstruzioneModificata.setData_fine(utenteInSessioneIstruzione.getData_fine());
        }
           


        // ID USER
         if(!req.getParameter("id_user").isEmpty()){
         Integer id_user = Integer.valueOf(req.getParameter("id_user").split(" ", 3)[0]);
  
         utenteModificato.getId_user();
         IstruzioneModificata.setId_user(id_user);
         isModified = true;
         }else {
             IstruzioneModificata.setId_user(IstruzioneModificata.getId_user());
         }

      // 	Valutazione
         if(!req.getParameter("valutazione").isEmpty()){
          Integer valutazione = Integer.valueOf(req.getParameter("valutazione").split(" ", 3)[0]);
          IstruzioneModificata.setValutazione(valutazione);
          isModified = true;
         }else {
             IstruzioneModificata.setValutazione(IstruzioneModificata.getId_citta());
         }
      

       // CV
 
        Part part = req.getPart("cv");
        String fileName = part.getSubmittedFileName();

        if (!fileName.isEmpty()) {
            String path = getServletContext().getRealPath("/" + "/img/cv" + File.separator + fileName);

            try {
                part.write(path);
                System.out.println("File caricato correttamente" + path);
                utenteModificato.setCV("/"+ fileName);
                isModified = true;
            } catch (Exception e) {
                ErrorManager.setErrorMessage("Qualcosa è andato storto",req);
                e.printStackTrace();
            }

        }else {
            utenteModificato.setCV(utenteInSessione.getCV());
        }
    


        IstruzioneIMPL istruzioneIMPL = new IstruzioneIMPL();
        EsperienzaIMPL esperienzaIMPL = new EsperienzaIMPL();

        istruzioneIMPL.update(IstruzioneModificata);
        esperienzaIMPL.update(EsperienzaModificata);

        session.removeAttribute("esperienza");
        session.removeAttribute("istruzione");
        session.setAttribute("esperienza", EsperienzaModificata);
        session.setAttribute("istruzione", IstruzioneModificata);
        if(isModified){
           ErrorManager.setSuccessMessage("Modifiche effettuate correttamente!",req);
           } else {
                ErrorManager.setOtherMessage("Non hai modificato nulla!",req);
            }
            req.getRequestDispatcher("/home/curriculum.jsp").forward(req, resp);
        }
        */

    }
}
