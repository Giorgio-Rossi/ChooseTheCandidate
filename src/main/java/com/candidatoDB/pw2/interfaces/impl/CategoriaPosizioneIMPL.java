package com.candidatoDB.pw2.interfaces.impl;

import com.candidatoDB.pw2.entity.CategoriaPosizione;
import com.candidatoDB.pw2.interfaces.CategoriaPosizioneDAO;
import com.servlets.pw2.controller.DBUtil;
import com.servlets.pw2.controller.SQLServerConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CategoriaPosizioneIMPL implements CategoriaPosizioneDAO {

    private SQLServerConnection connection = new SQLServerConnection();

    public CategoriaPosizioneIMPL() {
        connection.Connect();
    }
    @Override
    public CategoriaPosizione getCategoriaPosizioneById(int id_categoria) {
        CategoriaPosizione categoriaPosizione = new CategoriaPosizione();
        String sql = "SELECT * from CategoriaPosizione where id_Categoria=?";

        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.getConnection().prepareStatement(sql);
            statement.setInt(1, id_categoria);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                categoriaPosizione.setId_categoria(resultSet.getInt(1));
                categoriaPosizione.setNome_categoria(resultSet.getString(2));
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            DBUtil.close(resultSet);
            DBUtil.close(statement);
            //DBUtil.close(connection.getConnection());
        }
        return categoriaPosizione;
        }
    }

