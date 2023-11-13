package com.candidatoDB.pw2.interfaces.impl;

import com.candidatoDB.pw2.entity.CandidaturaUser;
import com.candidatoDB.pw2.interfaces.CandidaturaUserDAO;
import com.servlets.pw2.controller.DBUtil;
import com.servlets.pw2.controller.SQLServerConnection;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CandidaturaUserIMPL implements CandidaturaUserDAO {

    private SQLServerConnection connection = new SQLServerConnection();

    public CandidaturaUserIMPL() {
        connection.Connect();
    }
    @Override
    public void Save(CandidaturaUser candidaturaUser) {
        String sql = "INSERT INTO CandidaturaUser(id_posizione, id_user, data_candidatura) VALUES(?,?,?)";
        PreparedStatement statement = null;
        try {
            statement = connection.getConnection().prepareStatement(sql);
            statement.setInt(1, candidaturaUser.getId_posizione());
            statement.setInt(2, candidaturaUser.getId_user());
            statement.setDate(3, (Date) candidaturaUser.getData_candidatura());

            statement.executeUpdate();
            //resultSet = statement.getGeneratedKeys();

        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            //DBUtil.close(resultSet);
            DBUtil.close(statement);
            //DBUtil.close((Connection) connection);
        }
    }
}
