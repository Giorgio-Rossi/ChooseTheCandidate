package com.candidatoDB.pw2.interfaces.impl;

import com.candidatoDB.pw2.entity.CategoriaPosizione;
import com.candidatoDB.pw2.entity.Citta;
import com.candidatoDB.pw2.entity.Posizione;
import com.candidatoDB.pw2.entity.Regione;
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
        String sql = "SELECT Citta.id_citta, Citta.id_regione, Citta.nome from Citta";

        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.getConnection().prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
               Citta citta = new Citta();
               citta.setId_citta(resultSet.getInt(1));
               citta.setRegione(getRegione(resultSet.getInt(2)));
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

    public Regione getRegione(int id_regione){
        Regione regione = new Regione();
        String sql = "SELECT Regione.id_regione, Regione.nome  from Regione inner join Citta on Regione.id_regione = ? ";

        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.getConnection().prepareStatement(sql);
            statement.setInt(1,id_regione);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                regione.setId_regione(resultSet.getInt(1));
                regione.setNome(resultSet.getString(2));
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            DBUtil.close(resultSet);
            DBUtil.close(statement);
            //DBUtil.close(connection.getConnection());
        }
        return regione;
    }

    public Citta getCittaById(int id_citta) {
        String sql = "SELECT * from Citta where id_citta=?";
        Citta citta = new Citta();

        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.getConnection().prepareStatement(sql);
            statement.setInt(1, id_citta);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                citta.setId_citta(resultSet.getInt(1));
                citta.setNome(resultSet.getString(2));
                citta.setRegione(getRegione(resultSet.getInt(3)));
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            DBUtil.close(resultSet);
            DBUtil.close(statement);
            //DBUtil.close(connection.getConnection());
        }
        return citta;
    }
	@Override
	public Citta findByNome(String nome) {
		Citta citta = new Citta();
		String sql = "SELECT * from Citta where nome = ?";

		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			statement = connection.getConnection().prepareStatement(sql);
			statement.setString(1, nome);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {

				citta.setId_citta(resultSet.getInt("id_citta"));
				RegioneIMPL regioneIMPL = new RegioneIMPL();
						citta.setRegione(regioneIMPL.FindByID(resultSet.getInt("id_regione")));
				citta.setNome(resultSet.getString("nome"));

				
System.out.println(citta);
				System.out.println("Funziono");
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
			// DBUtil.close(connection.getConnection());
		}
		return citta;


}
	
}
