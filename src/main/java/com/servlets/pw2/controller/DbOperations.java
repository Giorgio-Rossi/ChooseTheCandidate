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


    public String[] Autenticazione(String email, String password){
        String[] ris= new String[3];
        try{
            result = connection.getConnection().prepareStatement("SELECT * FROM Utente where email=? and password=?");
            result.setString(1,email);
            result.setString(2,password);
            ResultSet resultSet = result.executeQuery();

            if(resultSet.next()){
                ris[0]= resultSet.getString("ruolo_admin");
                ris[1]= resultSet.getString("nome");
                ris[2]= resultSet.getString("id_user");
            }else {
                ris[0] = "";
                ris[1] = "";
                ris[2] = "";
                return ris;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return ris;
    }
}
