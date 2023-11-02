package com.candidatoDB.pw2.interfaces.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.candidatoDB.pw2.entity.CandidaturaUser;
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
}
