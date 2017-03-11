package com.pawel.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.pawel.model.GeneracjaWiatr;

@Repository
public interface GeneracjaWiatrRepository extends CrudRepository<GeneracjaWiatr, Integer>{
	List<GeneracjaWiatr> findByDataOrderByGodzina(Date data);
	GeneracjaWiatr findByDataAndGodzina(Date data, int godzina);
}
