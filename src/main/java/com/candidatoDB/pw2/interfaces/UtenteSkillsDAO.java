package com.candidatoDB.pw2.interfaces;

import com.candidatoDB.pw2.entity.Skill;
import com.candidatoDB.pw2.entity.UsersSkills;
import com.candidatoDB.pw2.entity.Utente;

import java.util.ArrayList;

public interface UtenteSkillsDAO {

    ArrayList<UsersSkills> getAllUserSkillVerifiedOrNot(Utente utente);

    void update(UsersSkills usersSkills);

    void save(UsersSkills usersSkills);

    UsersSkills getById(int id_skill, int id_user);
}
