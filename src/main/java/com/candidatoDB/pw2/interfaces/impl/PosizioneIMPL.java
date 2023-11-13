
package com.candidatoDB.pw2.interfaces.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.candidatoDB.pw2.entity.CategoriaPosizione;
import com.candidatoDB.pw2.entity.Citta;
import com.candidatoDB.pw2.entity.Posizione;
import com.candidatoDB.pw2.entity.Quiz;
import com.candidatoDB.pw2.interfaces.PosizioneDAO;
import com.servlets.pw2.controller.DBUtil;
import com.servlets.pw2.controller.SQLServerConnection;

//TODO AGGIUNGERE LA CREAZIONE DEI QUIZ NEI METODI DI FILTRI

public class PosizioneIMPL implements PosizioneDAO {
	private SQLServerConnection connection = new SQLServerConnection();

	public PosizioneIMPL() {
		connection.Connect();
	}

	@Override
	public Posizione getPosizioneById(int id_posizione) {
		Posizione posizione = new Posizione();
		String sql = "SELECT * from Posizione where id_posizione = ?";

		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			statement = connection.getConnection().prepareStatement(sql);
			statement.setInt(1, id_posizione);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {

				posizione.setId_posizione(resultSet.getInt("id_posizione"));
				posizione.setN_ammissioni(resultSet.getInt("n_ammissioni"));
				posizione.setDescrizione(resultSet.getString("descrizione"));

				Citta citta = new Citta();
				citta.setId_citta(resultSet.getInt("id_citta"));

				citta.setNome(resultSet.getString("nome"));
				posizione.setCitta(citta);

				CategoriaPosizione categoriaPosizione = new CategoriaPosizione();
				categoriaPosizione.setId_categoria(resultSet.getInt("id_categoria"));
				categoriaPosizione.setNome_categoria(resultSet.getString("nome_categoria"));
				posizione.setCategoria(categoriaPosizione);

				QuizIMPL quizIMPL = new QuizIMPL();
				posizione.setQuiz(quizIMPL.getQuizById(resultSet.getInt("id_quiz")));

				posizione.setStato(resultSet.getString("stato"));
				posizione.setData_inserimento(new java.sql.Timestamp(resultSet.getDate("data_inserimento").getTime()));
				posizione.setRuolo(resultSet.getString("ruolo"));

				System.out.println("Funziono");
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
			// DBUtil.close(connection.getConnection());
		}
		return posizione;
	}

	@Override
	public List<Posizione> searchByCity(Citta citta) {
		List<Posizione> posizioni = new ArrayList<>();

		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			String sql = "SELECT * FROM Posizione p  INNER JOIN Citta c ON p.id_citta = c.id_citta INNER JOIN CategoriaPosizione cp ON cp.id_Categoria = p.id_Categoria WHERE p.id_citta = ?";
			System.out.println(sql);
			connection.Connect();
			statement = connection.getConnection().prepareStatement(sql);

			statement.setInt(1, citta.getId_citta());

			resultSet = statement.executeQuery();
			System.out.println("mi sono fermato");
			while (resultSet.next()) {
				Posizione posizione = new Posizione();

				posizione.setId_posizione(resultSet.getInt("id_posizione"));
				posizione.setN_ammissioni(resultSet.getInt("n_ammissioni"));
				posizione.setDescrizione(resultSet.getString("descrizione"));

				citta = new Citta();
				citta.setId_citta(resultSet.getInt("id_citta"));
				// CittaIMPL cittaIMPL = new CittaIMPL();

				// citta.setRegione(cittaIMPL.getRegione(resultSet.getInt("id_regione")));

				citta.setNome(resultSet.getString("nome"));
				posizione.setCitta(citta);

				CategoriaPosizione categoria = new CategoriaPosizione();
				categoria.setId_categoria(resultSet.getInt("id_categoria"));
				categoria.setNome_categoria(resultSet.getString("nome_categoria"));
				posizione.setCategoria(categoria);

				QuizIMPL quizIMPL = new QuizIMPL();
				posizione.setQuiz(quizIMPL.getQuizById(resultSet.getInt("id_quiz")));

				posizione.setStato(resultSet.getString("stato"));
				posizione.setData_inserimento(new java.sql.Timestamp(resultSet.getDate("data_inserimento").getTime()));
				posizione.setRuolo(resultSet.getString("ruolo"));

				posizioni.add(posizione);
				System.out.println("Funziono");
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
			// DBUtil.close((Connection) connection);
		}

		return posizioni;

	}

	@Override
	public List<Posizione> searchByRuolo(String ruolo) {
		List<Posizione> posizioni = new ArrayList<>();
		PreparedStatement statement = null;
		ResultSet resultSet = null;

		try {
			String sql = "SELECT * FROM Posizione p INNER JOIN CategoriaPosizione cp ON p.id_categoria = cp.id_categoria  INNER JOIN Citta c ON c.id_citta = p.id_citta  WHERE p.ruolo =?";
			System.out.println(sql);
			connection.Connect();
			statement = connection.getConnection().prepareStatement(sql);
			statement.setString(1, ruolo);

			resultSet = statement.executeQuery();
			System.out.println("sono bloccato");
			while (resultSet.next()) {
				Posizione posizione = new Posizione();

				posizione.setId_posizione(resultSet.getInt("id_posizione"));
				posizione.setN_ammissioni(resultSet.getInt("n_ammissioni"));
				posizione.setDescrizione(resultSet.getString("descrizione"));

				Citta citta = new Citta();
				citta.setId_citta(resultSet.getInt("id_citta"));
				// CittaIMPL cittaIMPL = new CittaIMPL();

				// citta.setRegione(cittaIMPL.getRegione(resultSet.getInt("id_regione")));

				citta.setNome(resultSet.getString("nome"));
				posizione.setCitta(citta);

				CategoriaPosizione categoria = new CategoriaPosizione();
				categoria.setId_categoria(resultSet.getInt("id_categoria"));
				categoria.setNome_categoria(resultSet.getString("nome_categoria"));
				posizione.setCategoria(categoria);

				QuizIMPL quizIMPL = new QuizIMPL();
				posizione.setQuiz(quizIMPL.getQuizById(resultSet.getInt("id_quiz")));

				posizione.setStato(resultSet.getString("stato"));
				posizione.setData_inserimento(new java.sql.Timestamp(resultSet.getDate("data_inserimento").getTime()));
				posizione.setRuolo(resultSet.getString("ruolo"));

				posizioni.add(posizione);

			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
			// DBUtil.close((Connection) connection);
		}
		return posizioni;
	}

	@Override
	public List<Posizione> searchByCategoria(CategoriaPosizione categoria) {
		List<Posizione> posizioni = new ArrayList<>();

		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			String sql = "SELECT * FROM Posizione p INNER JOIN CategoriaPosizione cp ON p.id_categoria = cp.id_categoria  INNER JOIN Citta c ON c.id_citta = p.id_citta WHERE cp.id_categoria = ?";
			connection.Connect();
			statement = connection.getConnection().prepareStatement(sql);

			statement.setInt(1, categoria.getId_categoria());

			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Posizione posizione = new Posizione();

				posizione.setId_posizione(resultSet.getInt("id_posizione"));
				posizione.setN_ammissioni(resultSet.getInt("n_ammissioni"));
				posizione.setDescrizione(resultSet.getString("descrizione"));

				Citta citta = new Citta();
				citta.setId_citta(resultSet.getInt("id_citta"));
				// CittaIMPL cittaIMPL = new CittaIMPL();

				// citta.setRegione(cittaIMPL.getRegione(resultSet.getInt("id_regione")));

				citta.setNome(resultSet.getString("nome"));
				posizione.setCitta(citta);

				categoria = new CategoriaPosizione();
				categoria.setId_categoria(resultSet.getInt("id_categoria"));
				categoria.setNome_categoria(resultSet.getString("nome_categoria"));
				posizione.setCategoria(categoria);

				QuizIMPL quizIMPL = new QuizIMPL();
				posizione.setQuiz(quizIMPL.getQuizById(resultSet.getInt("id_quiz")));

				posizione.setStato(resultSet.getString("stato"));
				posizione.setData_inserimento(new java.sql.Timestamp(resultSet.getDate("data_inserimento").getTime()));
				posizione.setRuolo(resultSet.getString("ruolo"));

				posizioni.add(posizione);
				System.out.println("Funziono");
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
			// DBUtil.close((Connection) connection);
		}
		return posizioni;
	}

	@Override

	public List<Posizione> findPosizioniPiuRecenti() {

		List<Posizione> posizioni = new ArrayList<>();
		PreparedStatement statement = null;
		ResultSet resultSet = null;

		try {

			String sql = "SELECT p.*, c.id_citta, c.nome, cp.id_categoria, cp.nome_categoria, q.id_quiz, q.descrizione, q.n_domande "
					+ "FROM Posizione p " + "INNER JOIN Citta c ON p.id_citta = c.id_citta "
					+ "INNER JOIN CategoriaPosizione cp ON p.id_categoria = cp.id_categoria "
					+ "LEFT JOIN Quiz q ON p.id_quiz = q.id_quiz " + "ORDER BY p.data_inserimento DESC";
			statement = connection.getConnection().prepareStatement(sql);
			resultSet = statement.executeQuery();

			while (resultSet.next()) {

				Posizione posizione = new Posizione();

				posizione.setId_posizione(resultSet.getInt("id_posizione"));
				posizione.setN_ammissioni(resultSet.getInt("n_ammissioni"));
				posizione.setDescrizione(resultSet.getString("descrizione"));

				Citta citta = new Citta();
				citta.setId_citta(resultSet.getInt("id_citta"));
				// CittaIMPL cittaIMPL = new CittaIMPL();

				// citta.setRegione(cittaIMPL.getRegione(resultSet.getInt("id_regione")));

				citta.setNome(resultSet.getString("nome"));
				posizione.setCitta(citta);

				CategoriaPosizione categoria = new CategoriaPosizione();
				categoria.setId_categoria(resultSet.getInt("id_categoria"));
				categoria.setNome_categoria(resultSet.getString("nome_categoria"));
				posizione.setCategoria(categoria);

				int idQuiz = resultSet.getInt("id_quiz");
				if (!resultSet.wasNull()) {
					Quiz quiz = new Quiz();
					quiz.setId_quiz(idQuiz);
					quiz.setDescrizione(resultSet.getString("q.descrizione"));
					quiz.setN_domande(resultSet.getInt("q.n_domande"));
					posizione.setQuiz(quiz);
				}

				posizione.setStato(resultSet.getString("stato"));
				posizione.setData_inserimento(new java.sql.Timestamp(resultSet.getDate("data_inserimento").getTime()));
				posizione.setRuolo(resultSet.getString("ruolo"));

				posizioni.add(posizione);
				System.out.println("Funziono");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			DBUtil.close(resultSet);
			DBUtil.close(statement);
			// DBUtil.close((Connection) connection);
		}

		return posizioni;
	}

	@Override
	public List<Posizione> searchByFilters(String ruolo, Citta citta, CategoriaPosizione categoria) {

		List<Posizione> posizioni = new ArrayList<>();
		String sql = "SELECT * FROM Posizione WHERE (ruolo = ? OR ? IS NULL OR ruolo = '') AND (id_citta = ? OR ? IS NULL) AND (id_categoria = ? OR ? IS NULL)";

		PreparedStatement statement = null;
		ResultSet resultSet = null;

		try {
			connection.Connect();
			statement = connection.getConnection().prepareStatement(sql);
			statement.setString(1, ruolo);
			statement.setString(2, ruolo);
			if (citta != null) {
				statement.setInt(3, citta.getId_citta());
				statement.setInt(4, citta.getId_citta());
			} else {
				statement.setNull(3, Types.INTEGER);
				statement.setNull(4, Types.INTEGER);
			}
			if (categoria != null) {
				statement.setInt(5, categoria.getId_categoria());
				statement.setInt(6, categoria.getId_categoria());
			} else {
				statement.setNull(5, Types.INTEGER);
				statement.setNull(6, Types.INTEGER);
			}

			resultSet = statement.executeQuery();

			while (resultSet.next()) {
				Posizione posizione = new Posizione();
				posizione.setId_posizione(resultSet.getInt(1));
				posizione.setN_ammissioni(resultSet.getInt(2));
				posizione.setDescrizione(resultSet.getString(3));
				Citta posizioneCitta = new Citta();
				posizioneCitta.setId_citta(resultSet.getInt(4));
				posizione.setCitta(posizioneCitta);
				CategoriaPosizione categoriaPosizione = new CategoriaPosizione();
				categoriaPosizione.setId_categoria(resultSet.getInt(5));
				posizione.setCategoria(categoriaPosizione);

				QuizIMPL quizIMPL = new QuizIMPL();
				posizione.setQuiz(quizIMPL.getQuizById(resultSet.getInt("id_quiz")));

				posizioni.add(posizione);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
			// DBUtil.close((Connection) connection);
		}

		return posizioni;
	}

	@Override
	public List<Posizione> searchByCategoriaAndRuolo(String ruolo, CategoriaPosizione categoriaPosizione) {
		List<Posizione> posizioni = new ArrayList<>();
//		Posizione posizione = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			String sql = "SELECT * FROM Posizione p INNER JOIN CategoriaPosizione cp ON p.id_categoria = cp.id_categoria  INNER JOIN Citta c ON c.id_citta = p.id_citta WHERE cp.id_categoria = ? and p.ruolo = ?";
			connection.Connect();
			statement = connection.getConnection().prepareStatement(sql);

			statement.setInt(1, categoriaPosizione.getId_categoria());
			statement.setString(2, ruolo);

			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Posizione posizione = new Posizione();

				posizione.setId_posizione(resultSet.getInt("id_posizione"));
				posizione.setN_ammissioni(resultSet.getInt("n_ammissioni"));
				posizione.setDescrizione(resultSet.getString("descrizione"));

				Citta citta = new Citta();
				citta.setId_citta(resultSet.getInt("id_citta"));
				// CittaIMPL cittaIMPL = new CittaIMPL();

				// citta.setRegione(cittaIMPL.getRegione(resultSet.getInt("id_regione")));

				citta.setNome(resultSet.getString("nome"));
				posizione.setCitta(citta);

				categoriaPosizione = new CategoriaPosizione();
				categoriaPosizione.setId_categoria(resultSet.getInt("id_categoria"));
				categoriaPosizione.setNome_categoria(resultSet.getString("nome_categoria"));
				posizione.setCategoria(categoriaPosizione);

				QuizIMPL quizIMPL = new QuizIMPL();
				posizione.setQuiz(quizIMPL.getQuizById(resultSet.getInt("id_quiz")));

				posizione.setStato(resultSet.getString("stato"));
				posizione.setData_inserimento(new java.sql.Timestamp(resultSet.getDate("data_inserimento").getTime()));
				posizione.setRuolo(resultSet.getString("ruolo"));

				posizioni.add(posizione);
				System.out.println("Funziono");
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
			// DBUtil.close((Connection) connection);
		}
		return posizioni;
	}

	@Override
	public List<Posizione> searchByCittaAndRuolo(Citta citta, String ruolo) {
		List<Posizione> posizioni = new ArrayList<>();
//		Posizione posizione = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			String sql = "SELECT * FROM Posizione p INNER JOIN CategoriaPosizione cp ON p.id_categoria = cp.id_categoria  INNER JOIN Citta c ON c.id_citta = p.id_citta WHERE p.id_citta = ? and p.ruolo = ?";
			connection.Connect();
			statement = connection.getConnection().prepareStatement(sql);

			statement.setInt(1, citta.getId_citta());
			statement.setString(2, ruolo);

			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Posizione posizione = new Posizione();

				posizione.setId_posizione(resultSet.getInt("id_posizione"));
				posizione.setN_ammissioni(resultSet.getInt("n_ammissioni"));
				posizione.setDescrizione(resultSet.getString("descrizione"));

				citta = new Citta();
				citta.setId_citta(resultSet.getInt("id_citta"));
				// CittaIMPL cittaIMPL = new CittaIMPL();

				// citta.setRegione(cittaIMPL.getRegione(resultSet.getInt("id_regione")));

				citta.setNome(resultSet.getString("nome"));
				posizione.setCitta(citta);

				CategoriaPosizione categoriaPosizione = new CategoriaPosizione();
				categoriaPosizione.setId_categoria(resultSet.getInt("id_categoria"));
				categoriaPosizione.setNome_categoria(resultSet.getString("nome_categoria"));
				posizione.setCategoria(categoriaPosizione);

				QuizIMPL quizIMPL = new QuizIMPL();
				posizione.setQuiz(quizIMPL.getQuizById(resultSet.getInt("id_quiz")));

				posizione.setStato(resultSet.getString("stato"));
				posizione.setData_inserimento(new java.sql.Timestamp(resultSet.getDate("data_inserimento").getTime()));
				posizione.setRuolo(resultSet.getString("ruolo"));

				posizioni.add(posizione);
				System.out.println("Funziono");
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
			// DBUtil.close((Connection) connection);
		}
		return posizioni;
	}

	@Override
	public List<Posizione> searchByCittaAndCategoria(Citta citta, CategoriaPosizione categoriaPosizione) {
		List<Posizione> posizioni = new ArrayList<>();
//		Posizione posizione = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			String sql = "SELECT * FROM Posizione p INNER JOIN CategoriaPosizione cp ON p.id_Categoria = cp.id_Categoria  INNER JOIN Citta c ON c.id_citta = p.id_citta WHERE c.id_citta = ? and cp.id_Categoria = ?";
			connection.Connect();
			statement = connection.getConnection().prepareStatement(sql);

			statement.setInt(1, citta.getId_citta());
			statement.setInt(2, categoriaPosizione.getId_categoria());

			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Posizione posizione = new Posizione();

				posizione.setId_posizione(resultSet.getInt("id_posizione"));
				posizione.setN_ammissioni(resultSet.getInt("n_ammissioni"));
				posizione.setDescrizione(resultSet.getString("descrizione"));

				citta = new Citta();
				citta.setId_citta(resultSet.getInt("id_citta"));
				// CittaIMPL cittaIMPL = new CittaIMPL();

				// citta.setRegione(cittaIMPL.getRegione(resultSet.getInt("id_regione")));

				citta.setNome(resultSet.getString("nome"));
				posizione.setCitta(citta);

				categoriaPosizione = new CategoriaPosizione();
				categoriaPosizione.setId_categoria(resultSet.getInt("id_categoria"));
				categoriaPosizione.setNome_categoria(resultSet.getString("nome_categoria"));
				posizione.setCategoria(categoriaPosizione);

				QuizIMPL quizIMPL = new QuizIMPL();
				posizione.setQuiz(quizIMPL.getQuizById(resultSet.getInt("id_quiz")));

				posizione.setStato(resultSet.getString("stato"));
				posizione.setData_inserimento(new java.sql.Timestamp(resultSet.getDate("data_inserimento").getTime()));
				posizione.setRuolo(resultSet.getString("ruolo"));

				posizioni.add(posizione);
				System.out.println("Funziono");
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
			// DBUtil.close((Connection) connection);
		}
		return posizioni;
	}

	public ArrayList<Posizione> getAllPosizioni() {
		ArrayList<Posizione> posizioni = new ArrayList<>();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {

			String sql = "SELECT * FROM Posizione";
			preparedStatement = connection.getConnection().prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Posizione posizione = new Posizione();
				posizione.setId_posizione(resultSet.getInt(1));
				posizione.setN_ammissioni(resultSet.getInt(2));
				posizione.setDescrizione(resultSet.getString(3));

				CittaIMPL cittaIMPL = new CittaIMPL();
				posizione.setCitta(cittaIMPL.getCittaById(resultSet.getInt(4)));

				CategoriaPosizioneIMPL categoriaPosizioneIMPL = new CategoriaPosizioneIMPL();
				posizione.setCategoria(categoriaPosizioneIMPL.getCategoriaPosizioneById(resultSet.getInt(5)));

				QuizIMPL quizIMPL = new QuizIMPL();
				posizione.setQuiz(quizIMPL.getQuizById(resultSet.getInt(6)));

				posizione.setStato(resultSet.getString(7));
				posizione.setData_inserimento(new java.sql.Timestamp(resultSet.getDate(8).getTime()));
				posizione.setRuolo(resultSet.getString(9));

				posizioni.add(posizione);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			// DBUtil.close(connection);
		}

		return posizioni;
	}

	@Override
	public ArrayList<String> getAllRuoli() {
		ArrayList<String> ruoli = new ArrayList<>();
		String sql = "SELECT ruolo from Posizione";

		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			statement = connection.getConnection().prepareStatement(sql);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				ruoli.add(resultSet.getString(1));
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
			// DBUtil.close(connection.getConnection());
		}
		return ruoli;
	}

	public List<Posizione> topTreAnnunci(Citta citta) {
		List<Posizione> posizioni = new ArrayList<>();
		PreparedStatement statement = null;
		ResultSet resultSet = null;

		try {
			String sql = "SELECT TOP 3 * FROM Posizione p INNER JOIN Citta c ON p.id_citta = c.id_citta INNER JOIN CategoriaPosizione cp ON cp.id_Categoria = p.id_Categoria WHERE p.id_citta = ? ORDER BY p.data_inserimento DESC";

			System.out.println(sql);
			connection.Connect();
			statement = connection.getConnection().prepareStatement(sql);

			statement.setInt(1, citta.getId_citta());

			resultSet = statement.executeQuery();

			while (resultSet.next()) {
				Posizione posizione = new Posizione();
				posizione.setId_posizione(resultSet.getInt(1));
				posizione.setN_ammissioni(resultSet.getInt(2));
				posizione.setDescrizione(resultSet.getString(3));

				CittaIMPL cittaIMPL = new CittaIMPL();
				posizione.setCitta(cittaIMPL.getCittaById(resultSet.getInt(4)));

				CategoriaPosizioneIMPL categoriaPosizioneIMPL = new CategoriaPosizioneIMPL();
				posizione.setCategoria(categoriaPosizioneIMPL.getCategoriaPosizioneById(resultSet.getInt(5)));

				QuizIMPL quizIMPL = new QuizIMPL();
				posizione.setQuiz(quizIMPL.getQuizById(resultSet.getInt(6)));

				posizione.setStato(resultSet.getString(7));
				posizione.setData_inserimento(new java.sql.Timestamp(resultSet.getDate(8).getTime()));
				posizione.setRuolo(resultSet.getString(9));

				posizioni.add(posizione);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
		}

		return posizioni;
	}

}
