package com.candidatoDB.pw2.interfaces;
import java.sql.PreparedStatement;
import java.util.List;

import com.candidatoDB.pw2.entity.Esperienza;

public interface EsperienzaDAO {

	void save(Esperienza esperienze);
	
	void update(Esperienza esperienze);
	
	List<Esperienza> getAllExperience(int id_user);
	
	void deleteEsperienzaUtente(Integer id_esperienza);
}


