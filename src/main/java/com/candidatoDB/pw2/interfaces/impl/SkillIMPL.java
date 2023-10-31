package com.candidatoDB.pw2.interfaces.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.candidatoDB.pw2.entity.Skill;
import com.candidatoDB.pw2.interfaces.SkillDAO;
import com.servlets.pw2.controller.DbOperations;


import com.servlets.pw2.controller.DBUtil;
import com.servlets.pw2.controller.SQLServerConnection;

public class SkillIMPL implements SkillDAO {

	private SQLServerConnection connection = new SQLServerConnection();

	public SkillIMPL(){
		connection.Connect();
	}

	@Override
	public void save(Skill skill) {
		String sql = "INSERT INTO Skill(id_skill,nome,tipo_skill) VALUES(?,?,?)";
		//Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			statement = connection.getConnection().prepareStatement(sql, new String[] { "id" });
			statement.setInt(1, skill.getId_skill());
			statement.setString(2, skill.getNome());
			statement.setString(3, skill.getTipo_skill());
			statement.executeUpdate();
			resultSet = statement.getGeneratedKeys();
			if (resultSet.next())
				skill.setId_skill(resultSet.getInt(1));
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
			DBUtil.close((Connection) connection);
		}

	}

	@Override
	public void update(Skill skill) {
		String sql = "UPDATE Skill SET id_skill=?,nome=?,tipo_skill=? WHERE id_skill=?";
		//Connection connection = null;
		PreparedStatement statement = null;
		try {
			//connection = DbOperations.getConnection();
			statement =  connection.getConnection().prepareStatement(sql);
			statement.setInt(1, skill.getId_skill());
			statement.setString(2, skill.getNome());
			statement.setString(3, skill.getTipo_skill());
			statement.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(statement);
			DBUtil.close((Connection) connection);
		}

	}

	@Override
	public void delete(Skill skill) {
		String sql = "DELETE FROM Skill WHERE id_skill=?";
		//Connection connection = null;
		PreparedStatement statement = null;
		try {
			//connection = DbOperations.getInstance().getConnection();
			statement = connection.getConnection().prepareStatement(sql);
			statement.setInt(1, skill.getId_skill());
			statement.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(statement);
			DBUtil.close((Connection) connection);
		}

	}

	@Override
	public List<Skill> findAll() {
		List<Skill> skills = new ArrayList<Skill>();
		String sql = "SELECT * FROM Skill";
		//Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			//connection = DbOperations.getInstance().getConnection();
			statement =  connection.getConnection().prepareStatement(sql);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Skill skill = new Skill();
				skill.setId_skill(resultSet.getInt(1));

				skill.setNome(resultSet.getString(2));

				skill.setTipo_skill(resultSet.getString(3));

				skills.add(skill);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
			DBUtil.close((Connection) connection);
		}
		return skills;
	}

	@Override
	public Skill findById(int id_skill) {
		Skill skill = null;
		String sql = "SELECT * FROM Skill WHERE id_skill=?";
		//Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			//connection = DbOperations.getInstance().getConnection();
			statement =  connection.getConnection().prepareStatement(sql);
			statement.setInt(1, id_skill);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				skill = new Skill();
				skill.setId_skill(resultSet.getInt(1));
				skill.setNome(resultSet.getString(2));

				skill.setTipo_skill(resultSet.getString(3));

			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
			DBUtil.close((Connection) connection);
		}
		return skill;
	}

}
