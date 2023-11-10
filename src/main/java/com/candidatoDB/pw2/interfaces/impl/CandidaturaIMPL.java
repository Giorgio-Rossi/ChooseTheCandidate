package com.candidatoDB.pw2.interfaces.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.candidatoDB.pw2.entity.CandidaturaUser;
import com.candidatoDB.pw2.entity.Posizione;
import com.candidatoDB.pw2.interfaces.CandidaturaDAO;
import com.servlets.pw2.controller.DBUtil;
import com.servlets.pw2.controller.SQLServerConnection;


public class CandidaturaIMPL implements CandidaturaDAO {
	private SQLServerConnection connection = new SQLServerConnection();

	public CandidaturaIMPL() {
		connection.Connect();
	}


	@Override
	public List<CandidaturaUser> orderCandidature() {

		        List<CandidaturaUser> candidature = new ArrayList<>();
		        PreparedStatement statement = null;
				ResultSet resultSet = null;
		        String sql = "SELECT * FROM CandidaturaUser ORDER BY data_candidatura DESC";
		        try {
		           
		    
		        
		        	statement = connection.getConnection().prepareStatement(sql);

		             resultSet = statement.executeQuery();
		            while (resultSet.next()) {
		                CandidaturaUser candidatura = new CandidaturaUser();
		                candidatura.setId_candidatura(resultSet.getInt(1));
						candidatura.setId_posizione(resultSet.getInt(2));
						candidatura.setId_user(resultSet.getInt(3));
						candidatura.setData_candidatura(new java.sql.Date(resultSet.getDate(4).getTime()));    
		                candidature.add(candidatura);
		            }
		          
	} catch (SQLException e) {
		System.err.println(e.getMessage());
	} finally {
		DBUtil.close(resultSet);
		DBUtil.close(statement);
		DBUtil.close((Connection) connection);
	}
	return candidature;
}


	@Override
	public CandidaturaUser trovaCandidaturaPiuRecente(int id_user) {
	 
	        CandidaturaUser Candidatura = null;
	     //   Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultSet = null;
	        String sql = "SELECT top 3 id_candidatura_user, id_posizione, id_user, data_candidatura " +
                    "FROM CandidaturaUser " +
                    "WHERE id_user = ? " +
                    "ORDER BY data_candidatura DESC ";
                   
	        try {
	        
	            statement = connection.getConnection().prepareStatement(sql);

	          
	            statement.setInt(1, id_user);
	            resultSet = statement.executeQuery();

	            if (resultSet.next()) {
	                Candidatura = new CandidaturaUser();
	                Candidatura.setId_candidatura(resultSet.getInt(1));
	                Candidatura.setId_posizione(resultSet.getInt(2));
	                Candidatura.setId_user(resultSet.getInt(3));
	                Candidatura.setData_candidatura(new java.sql.Date(resultSet.getDate(4).getTime()));
	                
	                System.out.println("metodo Candidatura piu recente funziona");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	        
	        	DBUtil.close(resultSet);
	    		DBUtil.close(statement);
	    	//	DBUtil.close((Connection) connection);
	        }

	        return Candidatura;
	    }


	@Override
	public List<CandidaturaUser> findCandidatureUtente(int id_user, Date data_candidatura) {
	     
			//Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;
	        List<CandidaturaUser> candidature = new ArrayList<>();

	        try {
	          
	            String sql = "SELECT * FROM CandidaturaUser WHERE id_user = ? AND data_candidatura IS NOT NULL";
	            preparedStatement = connection.getConnection().prepareStatement(sql);
	            preparedStatement.setInt(1, id_user);

	            resultSet = preparedStatement.executeQuery();

	            while (resultSet.next()) {
	            	 CandidaturaUser candidatura = new CandidaturaUser();
	                candidatura.setId_candidatura(resultSet.getInt(1));
	                candidatura.setId_posizione(resultSet.getInt(2));
	                candidatura.setId_user(resultSet.getInt(3));
	                candidatura.setData_candidatura(new java.sql.Date(resultSet.getDate(4).getTime()));

	                candidature.add(candidatura);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	           
	            DBUtil.close(resultSet);
	            DBUtil.close(preparedStatement);
	           // DBUtil.close(connection);
	        }

	        return candidature;
	    }


	@Override
	public List<CandidaturaUser> findCandidatureUtenteById(int id_user) {
		//Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<CandidaturaUser> candidature = new ArrayList<>();

        try {
          
            String sql = "SELECT * FROM CandidaturaUser WHERE id_user = ? ";
            preparedStatement = connection.getConnection().prepareStatement(sql);
            preparedStatement.setInt(1, id_user);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
            	 CandidaturaUser candidatura = new CandidaturaUser();
                candidatura.setId_candidatura(resultSet.getInt(1));
                candidatura.setId_posizione(resultSet.getInt(2));
                candidatura.setId_user(resultSet.getInt(3));
                candidatura.setData_candidatura(new java.sql.Date(resultSet.getDate(4).getTime()));

                candidature.add(candidatura);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
           
            DBUtil.close(resultSet);
            DBUtil.close(preparedStatement);
           //DBUtil.close(connection);
        }

        return candidature;
	}


	public Posizione getPosizionebyCandidaturaId(CandidaturaUser candidaturaUser){
		Posizione posizione = new Posizione();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {

			String sql = "SELECT * FROM Posizione WHERE id_posizione = ? ";
			preparedStatement = connection.getConnection().prepareStatement(sql);
			preparedStatement.setInt(1, candidaturaUser.getId_posizione());

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				posizione.setId_posizione(resultSet.getInt(1));
				posizione.setN_ammissioni(resultSet.getInt(2));
				posizione.setDescrizione(resultSet.getString(3));

				CittaIMPL cittaIMPL = new CittaIMPL();
				posizione.setCitta(cittaIMPL.getCittaById(resultSet.getInt(4)));

				CategoriaPosizioneIMPL categoriaPosizioneIMPL = new CategoriaPosizioneIMPL();
				posizione.setCategoria(categoriaPosizioneIMPL.getCategoriaPosizioneById(resultSet.getInt(5)));

				QuizIMPL quizIMPL = new QuizIMPL();
				posizione.setQuiz(quizIMPL.getQuizById(6));

				posizione.setStato(resultSet.getString(7));
				posizione.setData_inserimento(resultSet.getDate(8));
				posizione.setRuolo(resultSet.getString(9));


			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			//DBUtil.close(connection);
		}

		return posizione;
	}
}
	
	
	


	
	
	

