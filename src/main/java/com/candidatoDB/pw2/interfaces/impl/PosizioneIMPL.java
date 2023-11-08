@Override
	public List<Posizione> findPosizioniPiuRecenti() {
		 List<Posizione> posizioni = new ArrayList<>();
		    PreparedStatement statement = null;
		    ResultSet resultSet = null;
 
		    try {
		        String sql = "SELECT * FROM Posizione ORDER BY data_inserimento";
		    	statement = connection.getConnection().prepareStatement(sql);
		        resultSet = statement.executeQuery();
 
		        while (resultSet.next()) {
		        	Posizione posizione = new Posizione();
	        		posizione.setId_posizione(resultSet.getInt(1));
					posizione.setN_ammissioni(resultSet.getInt(2));
					posizione.setDescrizione(resultSet.getString(3));
					Citta citta = new Citta();
					citta.setId_citta(resultSet.getInt(4));
					posizione.setCitta(citta);
				CategoriaPosizione	categoria = new CategoriaPosizione();
					categoria.setId_categoria(resultSet.getInt(5));
					posizione.setCategoria(categoria);
					 int idQuiz = resultSet.getInt("id_quiz");
			            if (!resultSet.wasNull()) {
			                Quiz quiz = new Quiz();
			                quiz.setId_quiz(idQuiz);
			                posizione.setQuiz(quiz);
			            }
 
					posizione.setStato(resultSet.getString(7));
	     posizione.setData_inserimento(new java.sql.Date(resultSet.getDate(8).getTime()));
	     posizione.setRuolo(resultSet.getString(9));
	          
	                posizioni.add(posizione);
		
 
		       
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        
		        DBUtil.close(resultSet);
		        DBUtil.close(statement);
		    }
 
		    return posizioni;
		}