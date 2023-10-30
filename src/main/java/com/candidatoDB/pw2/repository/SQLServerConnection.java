package com.candidatoDB.pw2.repository;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 
public class SQLServerConnection {
 
	public static void main(String[] args)
			throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		String dburl = "jdbc:sqlserver://127.0.0.1;databaseName=ProjectWork2;encrypt=false;";
 
		String user = "sa";
		String password = "zucchetti";
 
		try {
			Connection connection = DriverManager.getConnection(dburl, user, password);
			if (connection != null) {
				System.out.println("Connessione al database riuscita!");
			}
 
			Statement stmt = connection.createStatement();
<<<<<<< HEAD
			ResultSet rs = stmt.executeQuery("select * from Esperienza");
=======
			ResultSet rs = stmt.executeQuery("select * from dbo.Esperienza");
>>>>>>> branch 'master' of https://github.com/Lollof00/PW2.git
			while (rs.next()) {
				// Display values
				System.out.print(", First: " + rs.getString("azienda"));
				System.out.println(", Last: " + rs.getString("anni"));
			}
			rs.close();
			stmt.close();
			connection.close();
			
		} catch (SQLException e) {
			System.err.println("Errore durante la connessione al database: " + e.getMessage());
			e.printStackTrace();
		}
	}
}