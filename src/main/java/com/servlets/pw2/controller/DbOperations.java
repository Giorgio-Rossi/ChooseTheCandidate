package com.servlets.pw2.controller;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbOperations {
    private SQLServerConnection connection = new SQLServerConnection();
    private PreparedStatement result;

    public DbOperations() {
        connection.Connect();
    }


    public String Autenticazione(String email, String password){
        String ruolo = "";
        try{
            result = connection.getConnection().prepareStatement("SELECT * FROM Utente where email=? and password=?");
            result.setString(1,email);
            result.setString(2,password);
            ResultSet resultSet = result.executeQuery();

            if(resultSet.next()){
                ruolo = resultSet.getString("ruolo_admin");

            }else {
                return "Utente non trovato";
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return ruolo;
    }
}
