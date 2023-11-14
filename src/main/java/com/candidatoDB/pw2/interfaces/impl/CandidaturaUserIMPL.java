package com.candidatoDB.pw2.interfaces.impl;

import com.candidatoDB.pw2.entity.CandidaturaUser;
import com.candidatoDB.pw2.entity.Domanda;
import com.candidatoDB.pw2.interfaces.CandidaturaUserDAO;
import com.servlets.pw2.controller.DBUtil;
import com.servlets.pw2.controller.SQLServerConnection;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

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

    @Override
    public CandidaturaUser getCandidaturaUserById(int id_posizione, int id_user) {
        CandidaturaUser candidaturaUser = null;
        String sql = "SELECT * from CandidaturaUser where id_posizione=? and id_user=?";

        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.getConnection().prepareStatement(sql);
            statement.setInt(1, id_posizione);
            statement.setInt(2, id_user);


            resultSet = statement.executeQuery();

            if(!resultSet.isBeforeFirst()){
                return null;
            }else {
                candidaturaUser = new CandidaturaUser();

                while (resultSet.next()) {
                    candidaturaUser.setId_candidatura(resultSet.getInt(1));
                    candidaturaUser.setId_posizione(resultSet.getInt(2));
                    candidaturaUser.setData_candidatura(resultSet.getDate(3));
                }
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            DBUtil.close(resultSet);
            DBUtil.close(statement);
            //DBUtil.close(connection.getConnection());
        }
        return candidaturaUser;
    }
}

