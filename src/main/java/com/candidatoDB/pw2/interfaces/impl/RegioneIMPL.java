package com.candidatoDB.pw2.interfaces.impl;

import com.candidatoDB.pw2.entity.Citta;
import com.candidatoDB.pw2.entity.Regione;
import com.candidatoDB.pw2.interfaces.RegioneDAO;
import com.servlets.pw2.controller.DBUtil;
import com.servlets.pw2.controller.SQLServerConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RegioneIMPL implements RegioneDAO {

    private SQLServerConnection connection = new SQLServerConnection();

    public RegioneIMPL() {
        connection.Connect();
    }

    @Override
    public ArrayList<Regione> getAllRegioni() {
        ArrayList<Regione> regioni = new ArrayList<>();
        String sql = "SELECT Regione.id_regione, Regione.nome from Regione";

        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.getConnection().prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Regione regione = new Regione();
                regione.setId_regione(resultSet.getInt(1));
                regione.setNome(resultSet.getString(2));
                regioni.add(regione);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            DBUtil.close(resultSet);
            DBUtil.close(statement);
            //DBUtil.close(connection.getConnection());
        }
        return regioni;
    }
}
