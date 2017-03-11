package com.pawel.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pawel.model.WartosciPodstawowe;
import com.pawel.repository.WartosciPodstawoweRepository;

@Service
@Transactional
public class WartosciPodstawoweService {

	private final WartosciPodstawoweRepository wartosciPodstawoweRepository;
	
	@Autowired
	public WartosciPodstawoweService(WartosciPodstawoweRepository wartosciPodstawoweRepository){
		this.wartosciPodstawoweRepository=wartosciPodstawoweRepository;
	}
	
	public List<WartosciPodstawowe> findAll(){
		List<WartosciPodstawowe> listaWart = new ArrayList<>();
		for(WartosciPodstawowe wart : wartosciPodstawoweRepository.findAll()){
			listaWart.add(wart);
		}
		return listaWart;
	}
	
	public WartosciPodstawowe findWartosci(Integer id){
		return wartosciPodstawoweRepository.findOne(id);
	}
	
	public void save(WartosciPodstawowe wartosciPodstawowe){
		wartosciPodstawoweRepository.save(wartosciPodstawowe);
	}
	
	public void delate(Integer id){
		wartosciPodstawoweRepository.delete(id);
	}

	public List<WartosciPodstawowe> findByDataOrderByGodzina(Date data){
		List <WartosciPodstawowe> listaWart = new ArrayList<>();
		for(WartosciPodstawowe wart: wartosciPodstawoweRepository.findByDataOrderByGodzina(data)){
			listaWart.add(wart);
		}
		return listaWart;	
	}
	
	public WartosciPodstawowe findByDataAndGodzina(Date data, int godzina){
		return wartosciPodstawoweRepository.findByDataAndGodzina(data,godzina);
	}
}
