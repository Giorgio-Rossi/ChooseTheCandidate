package com.candidatoDB.pw2.interfaces.impl;

import com.candidatoDB.pw2.entity.CategoriaPosizione;
import com.candidatoDB.pw2.entity.Domanda;
import com.candidatoDB.pw2.interfaces.DomandaDAO;
import com.servlets.pw2.controller.DBUtil;
import com.servlets.pw2.controller.SQLServerConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DomandaIMPL implements DomandaDAO {

    private SQLServerConnection connection = new SQLServerConnection();

    public DomandaIMPL() {
        connection.Connect();
    }

    @Override
    public Domanda getDomandaById(int id_domanda) {
        Domanda domanda = new Domanda();
        String sql = "SELECT * from Domanda where id_domanda=?";

        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.getConnection().prepareStatement(sql);
            statement.setInt(1, id_domanda);

            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                domanda.setId_domanda(resultSet.getInt(1));
                domanda.setTesto(resultSet.getString(2));
                domanda.setPunteggio(resultSet.getInt(3));
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            DBUtil.close(resultSet);
            DBUtil.close(statement);
            //DBUtil.close(connection.getConnection());
        }
        return domanda;
    }
}
