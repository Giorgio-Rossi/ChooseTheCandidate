package com.candidatoDB.pw2.interfaces.impl;

import com.candidatoDB.pw2.entity.Domanda;
import com.candidatoDB.pw2.entity.RisposteDomande;
import com.candidatoDB.pw2.interfaces.RisposteDomandaDAO;
import com.servlets.pw2.controller.DBUtil;
import com.servlets.pw2.controller.SQLServerConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RisposteDomandaIMPL implements RisposteDomandaDAO {

    private SQLServerConnection connection = new SQLServerConnection();

    public RisposteDomandaIMPL() {
        connection.Connect();
    }
    @Override
    public ArrayList<RisposteDomande> getRisposteDomandaByIdDomanda(int id_domanda) {
        ArrayList<RisposteDomande> risposte = new ArrayList<>();
        String sql = "SELECT * from RisposteDomanda where id_domanda=?";

        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.getConnection().prepareStatement(sql);
            statement.setInt(1, id_domanda);

            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                RisposteDomande risposteDomanda = new RisposteDomande();
                risposteDomanda.setId_risposta(resultSet.getInt(1));
                risposteDomanda.setScelta1(resultSet.getString(2));
                risposteDomanda.setScelta2(resultSet.getString(3));
                risposteDomanda.setScelta3(resultSet.getString(4));
                risposteDomanda.setScelta4(resultSet.getString(5));
                risposteDomanda.setScelta_corretta(resultSet.getString(6));
                risposteDomanda.setId_domanda(resultSet.getInt(7));

                risposte.add(risposteDomanda);

            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            DBUtil.close(resultSet);
            DBUtil.close(statement);
            //DBUtil.close(connection.getConnection());
        }
        return risposte;
    }
}
