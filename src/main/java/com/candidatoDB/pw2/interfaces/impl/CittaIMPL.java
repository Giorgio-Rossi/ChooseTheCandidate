package com.candidatoDB.pw2.interfaces.impl;

import com.candidatoDB.pw2.entity.Citta;
import com.candidatoDB.pw2.interfaces.CittaDAO;
import com.servlets.pw2.controller.DBUtil;
import com.servlets.pw2.controller.SQLServerConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CittaIMPL implements CittaDAO {

    private SQLServerConnection connection = new SQLServerConnection();

    public CittaIMPL() {
        connection.Connect();
    }
    @Override
    public ArrayList<Citta> getAllCitta() {
        ArrayList<Citta> cities = new ArrayList<>();
        String sql = "SELECT Citta.id_citta, Citta.regione, Citta.nome from Citta order by Citta.regione";

        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.getConnection().prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
               Citta citta = new Citta();
               citta.setId_citta(resultSet.getInt(1));
               citta.setRegione(resultSet.getString(2));
               citta.setNome(resultSet.getString(3));
               cities.add(citta);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            DBUtil.close(resultSet);
            DBUtil.close(statement);
            //DBUtil.close(connection.getConnection());
        }
        return cities;
    }
}
