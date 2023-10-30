package com.candidatoDB.pw2.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SQLServerConnection {
    public static void main(String[] args) throws ClassNotFoundException {
        try{
            String dburl = "jdbc:sqlserver://FRALON-NB;integratedSecurity=true;databaseName=JOBHUNTER;trustServerCertificate=true";
            Connection connection = DriverManager.getConnection(dburl);
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM Utente");
            while (resultSet.next()) {
                System.out.print("Nome: " + resultSet.getString("nome")+"\n");
                System.out.print("Cognome: " + resultSet.getString("cognome")+"\n");
                System.out.print("CodiceFiscale: " + resultSet.getString("codice_fiscale")+"\n");
                System.out.print("Password: " + resultSet.getString("password")+"\n");
                System.out.print("Ruolo: " + resultSet.getString("ruolo_admin")+"\n");
                System.out.print("Data di nascita: " + resultSet.getDate("data_nascita")+"\n");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}