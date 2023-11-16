package com.candidatoDB.pw2.interfaces.impl;

import com.candidatoDB.pw2.entity.Esperienza;
import com.candidatoDB.pw2.entity.Posizione;
import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.interfaces.impl.UtenteIMPL;
import com.candidatoDB.pw2.interfaces.EsperienzaDAO;
import com.servlets.pw2.controller.DBUtil;
import com.servlets.pw2.controller.SQLServerConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;



public class EsperienzaIMPL implements EsperienzaDAO {

	private SQLServerConnection connection = new SQLServerConnection();

	public EsperienzaIMPL(){
		connection.Connect();
	}

	@Override
	public void save(Esperienza esperienze) {
		String sql = "INSERT INTO Esperienza(id_esperienza,anni,descrizione_attivita,id_user,azienda,data_inizio,data_fine,ral,tipo_contratto,settore,posizione_lavorativa,id_citta) VALUES(?,?,?,?,?,?,?,?,?,?,?,?))";
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			statement = connection.getConnection().prepareStatement(sql, new String[] { "id" });
			statement.setInt(1, esperienze.getId_esperienza());
			statement.setInt(2, esperienze.getAnni());
			statement.setString(3, esperienze.getDescrizione_attivita());
			statement.setInt(4, esperienze.getId_esperienza());
			statement.setString(5, esperienze.getAzienda());
			statement.setDate(6, new java.sql.Date(esperienze.getData_inizio().getTime()));
			statement.setDate(6, new java.sql.Date(esperienze.getData_fine().getTime()));
			statement.setInt(8, esperienze.getRal());
			statement.setString(9, esperienze.getTipo_contratto());
			statement.setString(10, esperienze.getSettore());
			statement.setString(11, esperienze.getPosizione_lavorativa());
			statement.setInt(12,esperienze.getId_citta().getId_citta());

			statement.executeUpdate();
			resultSet = statement.getGeneratedKeys();
			if (resultSet.next())
				esperienze.setId_esperienza(resultSet.getInt(1));
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
			//DBUtil.close((Connection) connection);
		}
	}


	@Override
	public void update(Esperienza esperienze) {
		String sql = "UPDATE Esperienza SET id_esperienza=?,anni=?,descrizione_attivita=?,id_user=?,azienda=?,data_inizio=?,data_fine=?,ral=?,tipo_contratto=?,settore=?,posizione_lavorativa=?, id_citta=?";
		PreparedStatement statement = null;

		try {
			statement = connection.getConnection().prepareStatement(sql, new String[] { "id" });
			statement.setInt(1, esperienze.getId_esperienza());
			statement.setInt(2, esperienze.getAnni());
			statement.setString(3, esperienze.getDescrizione_attivita());
			statement.setInt(4, esperienze.getId_esperienza());
			statement.setString(5, esperienze.getAzienda());
			statement.setDate(6, new java.sql.Date(esperienze.getData_inizio().getTime()));
			statement.setDate(6, new java.sql.Date(esperienze.getData_fine().getTime()));
			statement.setInt(8, esperienze.getRal());
			statement.setString(9, esperienze.getTipo_contratto());
			statement.setString(10, esperienze.getSettore());
			statement.setString(11, esperienze.getPosizione_lavorativa());
			statement.setInt(12, esperienze.getId_citta().getId_citta());
			statement.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(statement);
			//DBUtil.close(connection.getConnection());
	}	
		
	}
	
	public List<Esperienza> getAllExperience(int id_user) {
		ArrayList<Esperienza> esperienze1 = new ArrayList<Esperienza>();
		String sql = "SELECT * FROM Esperienza where id_user=?";
				
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		
		try {
			statement = connection.getConnection().prepareStatement(sql);
			statement.setInt(1, id_user);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Esperienza esperienza = new Esperienza();

				esperienza.setId_esperienza(resultSet.getInt(1));
				esperienza.setAnni(resultSet.getInt(2));
				esperienza.setDescrizione_attivita(resultSet.getString(3));
				
				UtenteIMPL utenteIMPL = new UtenteIMPL();
				esperienza.setUtente(utenteIMPL.findById(resultSet.getInt(4)));
				esperienza.setAzienda(resultSet.getString(5));
				
				esperienza.setData_inizio(new java.sql.Date(resultSet.getDate(6).getTime()));
				esperienza.setData_fine(new java.sql.Date(resultSet.getDate(7).getTime()));
				esperienza.setRal(resultSet.getInt(8));
				esperienza.setTipo_contratto(resultSet.getString(9));
				esperienza.setSettore(resultSet.getString(10));
				esperienza.setPosizione_lavorativa(resultSet.getString(11));

				if(resultSet.getString(12)==null){
					System.out.println("No citta");
				}else {
					esperienza.setId_citta(new CittaIMPL().getCittaById(resultSet.getInt(12)));
				}


				esperienze1.add(esperienza);


			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			DBUtil.close(resultSet);
			DBUtil.close(statement);
			// DBUtil.close(connection);
		}
		return esperienze1;
	}

		@Override
		public void deleteEsperienzaUtente(Esperienza esperienza) {
			String sql = "DELETE Esperienza WHERE id_user = ?";
			PreparedStatement statement = null;
			try {
			
				statement = connection.getConnection().prepareStatement(sql);
				statement.setInt(1, esperienza.getId_esperienza());
				statement.executeUpdate();
			} catch (SQLException e) {
				System.err.println(e.getMessage());
			} finally {
				DBUtil.close(statement);
				//DBUtil.close((Connection) connection);
			}

		}
		

}

	
