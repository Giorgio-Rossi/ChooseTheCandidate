package com.candidatoDB.pw2.entity;

//id_user_skills int identity not null primary key,
//id_user int not null,
//id_skill int not null,
//verificata bit,
//
//CONSTRAINT FK_Skill_UserSkills FOREIGN KEY (id_skill) REFERENCES Skill (id_skill),
//CONSTRAINT FK_Utente_UserSkills FOREIGN KEY (id_user) REFERENCES Utente (id_user)
//);

public class UsersSkills {

	
	private int id_user_skills;
	private int id_user;
	private int id_skill;
	private boolean verificata;
}
