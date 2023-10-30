package com.servlets.pw2.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SQLServerConnection {
        static Connection connection =  null;
        String dburl = "jdbc:sqlserver://127.0.0.1;databaseName=ProjectWork2;encrypt=false;";
        String user = "sa";
        String password = "zucchetti";
        public void Connect(){
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                connection = DriverManager.getConnection(dburl, user, password);
                if (connection != null) {
                    System.out.println("Connessione al database riuscita!");
                }
            } catch (SQLException e) {
                System.err.println("Errore durante la connessione al database: " + e.getMessage());
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }

    public  Connection getConnection() {
        return connection;
    }

}

