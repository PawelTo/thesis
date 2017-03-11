package com.pawel.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pawel.model.GeneracjaWiatr;
import com.pawel.repository.GeneracjaWiatrRepository;

@Service
@Transactional
public class GeneracjaWiatrService {

	private final GeneracjaWiatrRepository generacjaWiatrRepository;
	
	@Autowired
	public GeneracjaWiatrService(GeneracjaWiatrRepository generacjaWiatrRepository){
		this.generacjaWiatrRepository=generacjaWiatrRepository;
	}
	
	public List<GeneracjaWiatr> findAll(){
		List<GeneracjaWiatr> listaWiatr = new ArrayList<>();
		for(GeneracjaWiatr wiatr : generacjaWiatrRepository.findAll()){
			listaWiatr.add(wiatr);
		}
		return listaWiatr;
	}
	
	public GeneracjaWiatr findWiatr(Integer id){
		return generacjaWiatrRepository.findOne(id);
	}
	
	public void save(GeneracjaWiatr generacjaWiatr){
		System.out.println("jestem w service - save");
		generacjaWiatrRepository.save(generacjaWiatr);
		System.out.println("jestem w service - zapisałem");
	}
	
	public void delate(Integer id){
		generacjaWiatrRepository.delete(id);
	}
	
	public List<GeneracjaWiatr> findByDataOrderByGodzina(Date data){
		List<GeneracjaWiatr> listawiatr = new ArrayList<>();
		for(GeneracjaWiatr wiatr: generacjaWiatrRepository.findByDataOrderByGodzina(data)){
			listawiatr.add(wiatr);
		}
		return listawiatr;
	}
	
	public GeneracjaWiatr findByDataAndGodzina(Date data, int godzina){
		return generacjaWiatrRepository.findByDataAndGodzina(data,godzina);
	}
}
