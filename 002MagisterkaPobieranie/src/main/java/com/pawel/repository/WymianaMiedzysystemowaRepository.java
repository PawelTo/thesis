package com.pawel.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.pawel.model.WymianaMiedzysystemowa;

public interface WymianaMiedzysystemowaRepository extends CrudRepository<WymianaMiedzysystemowa, Integer> {
	List<WymianaMiedzysystemowa> findByDataOrderByGodzina(Date data);
	WymianaMiedzysystemowa findByDataAndGodzina(Date data, int godzina);
}
