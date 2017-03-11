package com.pawel.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.pawel.model.WartosciPodstawowe;

public interface WartosciPodstawoweRepository extends CrudRepository<WartosciPodstawowe, Integer>{
	List<WartosciPodstawowe> findByDataOrderByGodzina(Date data);
	WartosciPodstawowe findByDataAndGodzina(Date data, int godzina);
}
