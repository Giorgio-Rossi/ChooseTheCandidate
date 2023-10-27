package com.example.pw2.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SQLServerConnection {
    public static void main(String[] args) {
    	
    	// Da modificare in base al nome del vostro DB e alla porta utilizzata per Server 
        String jdbcUrl = "jdbc:sqlserver://localhost:1433;databaseName=YourDatabase";
        
        // Vostro Username
        String user = "YourUsername";
        
        // Vostra Pass
        String password = "YourPassword";

        try {
            Connection connection = DriverManager.getConnection(jdbcUrl, user, password);
            if (connection != null) {
                System.out.println("Connessione al database riuscita!");
              
            }
        } catch (SQLException e) {
            System.err.println("Errore durante la connessione al database: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
