package com.candidatoDB.pw2.interfaces.impl;

import com.candidatoDB.pw2.entity.Quiz;
import com.candidatoDB.pw2.entity.Skill;
import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.interfaces.UtenteSkillsDAO;
import com.servlets.pw2.controller.DBUtil;
import com.servlets.pw2.controller.SQLServerConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UtenteSkillsIMPL implements UtenteSkillsDAO {

    private SQLServerConnection connection = new SQLServerConnection();

    public UtenteSkillsIMPL() {
        connection.Connect();
    }
    @Override
    public ArrayList<Skill> getAllUserSkillVerifiedOrNot(Utente utente, boolean verificata) {
        ArrayList<Skill> allUserSkills = new ArrayList<>();
        String sql = "SELECT * from UserSkills us where us.id_user = ? and us.verificata =?";

        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.getConnection().prepareStatement(sql);
            statement.setInt(1, utente.getId_user());
            statement.setBoolean(2,verificata);

            resultSet = statement.executeQuery();

            while (resultSet.next()) {

                allUserSkills.add(new SkillIMPL().findById(resultSet.getInt("id_skill")));

            }

        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            DBUtil.close(resultSet);
            DBUtil.close(statement);
            //DBUtil.close(connection.getConnection());
        }
        return allUserSkills;
    }
}
