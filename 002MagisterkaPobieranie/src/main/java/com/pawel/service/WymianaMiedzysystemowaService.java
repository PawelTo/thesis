package com.pawel.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pawel.model.WymianaMiedzysystemowa;
import com.pawel.repository.WymianaMiedzysystemowaRepository;

@Service
@Transactional
public class WymianaMiedzysystemowaService {

	private final WymianaMiedzysystemowaRepository wymianaMiedzysystemowaRepository;
	
	@Autowired
	public WymianaMiedzysystemowaService(WymianaMiedzysystemowaRepository wymianaMiedzysystemowaRepository){
		this.wymianaMiedzysystemowaRepository=wymianaMiedzysystemowaRepository;
	}
	
	public List<WymianaMiedzysystemowa> findAll(){
		List<WymianaMiedzysystemowa> listaWymiana = new ArrayList<>();
		for(WymianaMiedzysystemowa wym: wymianaMiedzysystemowaRepository.findAll()){
			listaWymiana.add(wym);
		}
		return listaWymiana;
	}
	
	public WymianaMiedzysystemowa findWymiana(Integer id){
		return wymianaMiedzysystemowaRepository.findOne(id);
	}
	
	public void save(WymianaMiedzysystemowa wymianaMiedzysystemowa){
		wymianaMiedzysystemowaRepository.save(wymianaMiedzysystemowa);
	}
	
	public void delate(Integer id){
		wymianaMiedzysystemowaRepository.delete(id);
	}
	
	public List<WymianaMiedzysystemowa> findByDataOrderByGodzina(Date data){
		List<WymianaMiedzysystemowa> listWymiana = new ArrayList<>();
		for(WymianaMiedzysystemowa wym: wymianaMiedzysystemowaRepository.findByDataOrderByGodzina(data)){
			listWymiana.add(wym);
		}
		return listWymiana;
	}
	
	public WymianaMiedzysystemowa findByDataAndGodzina(Date data, int godzina){
		return wymianaMiedzysystemowaRepository.findByDataAndGodzina(data,godzina);
	}

}
