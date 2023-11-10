package com.candidatoDB.pw2.interfaces;

import java.util.Date;
import java.util.List;
import com.candidatoDB.pw2.entity.CandidaturaUser;

public interface CandidaturaDAO {
	List<CandidaturaUser> orderCandidature();
	CandidaturaUser trovaCandidaturaPiuRecente(int id_user);
	List<CandidaturaUser> findCandidatureUtente(int id_user , Date data_candidatura);
	List<CandidaturaUser> findCandidatureUtenteById(int id_user);
}
