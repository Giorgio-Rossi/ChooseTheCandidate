package com.servlets.pw2.controller;
 
import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.interfaces.impl.UtenteIMPL;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

public class DbOperations {
    private SQLServerConnection connection = new SQLServerConnection();
    private PreparedStatement result;
 
    public DbOperations() {
        connection.Connect();
    }
 
 
    public Utente Autenticazione(String email, String password){
        Utente utente = new Utente();
        Integer id_utente = null;
        try{
            result = connection.getConnection().prepareStatement("SELECT * FROM Utente where email=? and password=?");
            result.setString(1,email);
            result.setString(2,password);
            ResultSet resultSet = result.executeQuery();
 
            if(resultSet.next()){
                id_utente = resultSet.getInt("id_user");
            }else {
                return utente;
            }
            UtenteIMPL utenteIMPL = new UtenteIMPL();
            utente = utenteIMPL.findById(id_utente);
 
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return utente;
    }
 
 
    public boolean ChechUserAll(Utente utente){
        boolean exists = false;
        try{
            result = connection.getConnection().prepareStatement("SELECT * FROM Utente where email=? or codice_fiscale=? or telefono=?");
            result.setString(1,utente.getEmail());
            result.setString(2,utente.getCodice_fiscale());
            result.setString(3,utente.getTelefono());
            ResultSet resultSet = result.executeQuery();
 
            if(resultSet.next()){
               exists = true;
            }else {
                return exists;
            }
 
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return exists;
    }
    public boolean ChechUserAll1(Utente utente){
        boolean exists = false;
        try{
            result = connection.getConnection().prepareStatement("SELECT * FROM Utente where email=? or codice_fiscale=? or telefono=?");
            result.setString(1,utente.getEmail());
            result.setString(2,utente.getCodice_fiscale());
            result.setString(3,utente.getTelefono());
            ResultSet resultSet = result.executeQuery();
 
            if(resultSet.next()){
               exists = true;
            }else {
                return exists;
            }
 
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return exists;
    }
    public boolean ChechUserMail(Utente utente){
        boolean exists = false;
        try{
            result = connection.getConnection().prepareStatement("SELECT * FROM Utente where email=?");
            result.setString(1,utente.getEmail());
            ResultSet resultSet = result.executeQuery();
 
            if(resultSet.next()){
               exists = true;
            }else {
                return exists;
            }
 
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return exists;
    }
    public boolean ChechUserTel(Utente utente){
        boolean exists = false;
        try{
            result = connection.getConnection().prepareStatement("SELECT * FROM Utente where telefono=?");
            result.setString(1,utente.getTelefono());
            ResultSet resultSet = result.executeQuery();
 
            if(resultSet.next()){
               exists = true;
            }else {
                return exists;
            }
 
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return exists;
    }
    public boolean ChechUserCodF(Utente utente){
        boolean exists = false;
        try{
            result = connection.getConnection().prepareStatement("SELECT * FROM Utente where codice_fiscale=?");
            result.setString(1,utente.getCodice_fiscale());
            ResultSet resultSet = result.executeQuery();
 
            if(resultSet.next()){
               exists = true;
            }else {
                return exists;
            }
 
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return exists;
    }
    public boolean ChechUserMailAndTel(Utente utente){
        boolean exists = false;
        try{
            result = connection.getConnection().prepareStatement("SELECT * FROM Utente where email=? and telefono=?");
            result.setString(1,utente.getEmail());
            result.setString(2,utente.getTelefono());
            ResultSet resultSet = result.executeQuery();
 
            if(resultSet.next()){
               exists = true;
            }else {
                return exists;
            }
 
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return exists;
    }
    public boolean ChechUserMailAndCodF(Utente utente){
        boolean exists = false;
        try{
            result = connection.getConnection().prepareStatement("SELECT * FROM Utente where email=? and codice_fiscale=?");
            result.setString(1,utente.getEmail());
            result.setString(2,utente.getCodice_fiscale());
            ResultSet resultSet = result.executeQuery();
 
            if(resultSet.next()){
               exists = true;
            }else {
                return exists;
            }
 
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return exists;
    }
    
    public boolean ChechUserTelAndCodF(Utente utente){
        boolean exists = false;
        try{
            result = connection.getConnection().prepareStatement("SELECT * FROM Utente where telefono=? and codice_fiscale=?");
            result.setString(1,utente.getTelefono());
            result.setString(2,utente.getCodice_fiscale());
            ResultSet resultSet = result.executeQuery();
 
            if(resultSet.next()){
               exists = true;
            }else {
                return exists;
            }
 
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return exists;
    }
    
    /*
    public Utente CheckChiaveSicurezza(String chiaveSicurezza, String email){
        Utente utente = new Utente();
        Integer id_utente = null;

        try{
            result = connection.getConnection().prepareStatement("SELECT * FROM Utente where chiaveSicurezza=? and email=?");
            result.setString(1, utente.getChiaveSicurezza());
            result.setString(2, utente.getEmail());
            ResultSet resultSet = result.executeQuery();

            if(resultSet.next()){
                id_utente = resultSet.getInt("id_user");
            	System.out.println(id_utente);
            	

            }else {
            
                return utente;

            }
 
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return utente;
    }
    */
    
    public boolean CheckChiaveSicurezza(String chiaveSicurezza) {
        boolean CheckChiaveSicurezza = false;
        Utente utente = new Utente();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
        	
        
        String sql = "SELECT * FROM Utente WHERE chiaveSicurezza = ?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, chiaveSicurezza);
        
        resultSet = preparedStatement.executeQuery();

        CheckChiaveSicurezza = resultSet.next();
    } catch (SQLException e) {
        e.printStackTrace();
        
    } finally {
        // Close the resources
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions according to your application's needs
        }
    }

    return CheckChiaveSicurezza;
}

    
    /*
     * 
     * import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/your_database";
    private static final String JDBC_USER = "your_username";
    private static final String JDBC_PASSWORD = "your_password";

    public static boolean emailExists(String email) {
        boolean exists = false;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the database connection
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // Prepare the SQL statement
            String sql = "SELECT * FROM users WHERE email = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);

            // Execute the query
            resultSet = preparedStatement.executeQuery();

            // Check if the email exists
            exists = resultSet.next();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Handle exceptions according to your application's needs
        } finally {
            // Close the resources
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Handle exceptions according to your application's needs
            }
        }

        return exists;
    }

    public static void main(String[] args) {
        String emailToCheck = "user@example.com";
        boolean emailExists = emailExists(emailToCheck);
        System.out.println("Email exists: " + emailExists);
    }
}

     * */
    
    
    
    
    /*
     * 
     * import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PasswordResetServlet")
public class PasswordResetServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/your_database";
    private static final String JDBC_USER = "your_username";
    private static final String JDBC_PASSWORD = "your_password";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        if (emailExists(email)) {
            // Redirect to the password reset page
            response.sendRedirect("password_reset.jsp"); // Change "password_reset.jsp" to your actual reset page
        } else {
            // Redirect to an error page or display an error message
            response.sendRedirect("error.jsp"); // Change "error.jsp" to your actual error page
        }
    }

    private boolean emailExists(String email) {
        boolean exists = false;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the database connection
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // Prepare the SQL statement
            String sql = "SELECT * FROM users WHERE email = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);

            // Execute the query
            resultSet = preparedStatement.executeQuery();

            // Check if the email exists
            exists = resultSet.next();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Handle exceptions according to your application's needs
        } finally {
            // Close the resources
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Handle exceptions according to your application's needs
            }
        }

        return exists;
    }
}
*/
}