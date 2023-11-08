package com.servlets.pw2.controller;

import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.interfaces.impl.UtenteIMPL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class DbOperations {
    private SQLServerConnection connection = new SQLServerConnection();
    private PreparedStatement result;

    public DbOperations() {
        connection.Connect();
    }


    public Utente Autenticazione(String email, String password){
        String[] ris= new String[3];
        Utente utente = new Utente();
        Integer id_utente = null;
        try{
            result = connection.getConnection().prepareStatement("SELECT * FROM Utente where email=? and password=?");
            result.setString(1,email);
            result.setString(2,password);
            ResultSet resultSet = result.executeQuery();

            if(resultSet.next()){
                ris[0]= resultSet.getString("ruolo_admin");
                ris[1]= resultSet.getString("nome");
                //ris[2]= resultSet.getString("id_user");
                id_utente = resultSet.getInt("id_user");
            }else {
                ris[0] = "";
                ris[1] = "";
                ris[2] = "";
                return utente;
            }
            System.out.println(id_utente);
            UtenteIMPL utenteIMPL = new UtenteIMPL();
            utente = utenteIMPL.findById(id_utente);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return utente;
    }



    public void Registrazione(String nome, String cognome, String email, String password, String telefono, String codice_fiscale, 
    String data_nascita) {
 try{
     result = connection.getConnection().prepareStatement("insert into Utente (nome, cognome, email, password, telefono, codice_fiscale, data_nascita)"
             + " values (?,?,?,?,?,?,cast(? as date))");
     result.setString(1,nome);
     result.setString(2,cognome);
     result.setString(3,email);
     result.setString(4,password);
     result.setString(5,telefono);
     result.setString(6,codice_fiscale);
     result.setString(7,data_nascita);
     result.executeQuery();          
 } catch (SQLException e) {
     System.out.println("dadadadadad");
     throw new RuntimeException(e);
 }
}
}
