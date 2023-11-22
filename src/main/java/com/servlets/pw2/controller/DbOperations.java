    package com.servlets.pw2.controller;
 
import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.interfaces.impl.UtenteIMPL;
 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
 
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
}