package com.candidatoDB.pw2.interfaces.impl;

import com.candidatoDB.pw2.entity.Quiz;
import com.candidatoDB.pw2.entity.Skill;
import com.candidatoDB.pw2.entity.UsersSkills;
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
    public ArrayList<UsersSkills> getAllUserSkillVerifiedOrNot(Utente utente) {
        ArrayList<UsersSkills> allUserSkills = new ArrayList<>();
        String sql = "SELECT * from UserSkills us where us.id_user = ?";

        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.getConnection().prepareStatement(sql);
            statement.setInt(1, utente.getId_user());

            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                UsersSkills usersSkills = new UsersSkills();

                usersSkills.setId_user_skills(resultSet.getInt("id_user_skills"));
                usersSkills.setId_user(resultSet.getInt("id_user"));
                usersSkills.setId_skill(resultSet.getInt("id_skill"));
                usersSkills.setVerificata(resultSet.getBoolean("verificata"));

                allUserSkills.add(usersSkills);

                //allUserSkills.add(new SkillIMPL().findById(resultSet.getInt("id_skill")));

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

    @Override
    public void update(UsersSkills usersSkills) {
            String sql = "UPDATE UserSkills SET id_user=?,id_skill=?, verificata=? WHERE id_user_skills=?";
            //Connection connection = null;
            PreparedStatement statement = null;
            try {
                statement =  connection.getConnection().prepareStatement(sql);
                statement.setInt(1, usersSkills.getId_user());
                statement.setInt(2, usersSkills.getId_skills());
                statement.setBoolean(3, usersSkills.isVerificata());
                statement.setInt(4, usersSkills.getId_user_skills());
                statement.executeUpdate();
            } catch (SQLException e) {
                System.err.println(e.getMessage());
            } finally {
                DBUtil.close(statement);
                //DBUtil.close((Connection) connection);
            }
        }

    @Override
    public void save(UsersSkills usersSkills) {
        String sql = "INSERT INTO UserSkills(id_user,id_skill,verificata) VALUES(?,?,?)";
        //Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.getConnection().prepareStatement(sql);
            statement.setInt(1, usersSkills.getId_user());
            statement.setInt(2, usersSkills.getId_skills());
            statement.setBoolean(3, usersSkills.isVerificata());
            statement.executeUpdate();


        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            //DBUtil.close(resultSet);
            DBUtil.close(statement);
            //DBUtil.close((Connection) connection);
        }
    }

    @Override
    public UsersSkills getById(int id_skill, int id_user) {
        UsersSkills usersSkills = null;
        String sql = "SELECT * FROM UserSkills WHERE id_skill=? and id_user=?";
        //Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            //connection = DbOperations.getInstance().getConnection();
            statement =  connection.getConnection().prepareStatement(sql);
            statement.setInt(1, id_skill);
            statement.setInt(2, id_user);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                usersSkills = new UsersSkills();

                usersSkills.setId_user_skills(resultSet.getInt("id_user_skills"));
                usersSkills.setId_user(resultSet.getInt("id_user"));

                usersSkills.setId_skill(resultSet.getInt("id_skill"));

                usersSkills.setVerificata(resultSet.getBoolean("verificata"));

            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            //DBUtil.close(resultSet);
            DBUtil.close(statement);
            //DBUtil.close((Connection) connection);
        }
        return usersSkills;
    }
}

