package com.candidatoDB.pw2.interfaces;

import com.candidatoDB.pw2.entity.Istruzione;
import java.util.List;

import com.candidatoDB.pw2.entity.*;

public interface IstruzioneDAO {

    void save(Istruzione istruzioni);

	void update(Istruzione istruzioni);
}

