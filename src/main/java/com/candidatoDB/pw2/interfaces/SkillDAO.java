package com.candidatoDB.pw2.interfaces;

import java.util.List;
import com.candidatoDB.pw2.entity.Skill;


public interface SkillDAO {
	
	void save(Skill skill);

	void update(Skill skill);

	void delete(Skill skill);

	List<Skill> findAll();

	Skill findById(int id_skill);

	

}
