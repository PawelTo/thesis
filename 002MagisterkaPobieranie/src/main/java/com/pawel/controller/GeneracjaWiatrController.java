package com.pawel.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pawel.model.GeneracjaWiatr;
import com.pawel.service.GeneracjaWiatrService;

@Controller
public class GeneracjaWiatrController {
	
	@Autowired
	GeneracjaWiatrService generacjaWiatrService;
	
	@GetMapping("/generacjaWiatr")
	public String generacjaWiatr(HttpServletRequest request){
		request.setAttribute("Wiatr", generacjaWiatrService.findAll());
		request.setAttribute("mode", "MODE-WIATR");
		return "wiatr";
	}
	
	@GetMapping("/nowaGenWiatr")
	public String nowyWiatr(HttpServletRequest request){
		request.setAttribute("mode", "MODE-NOWY");
		return "wiatr";
	}
	
	@PostMapping("/zapiszWiatr")
	public String zapiszWiatr(@ModelAttribute GeneracjaWiatr generacjaWiatr, HttpServletRequest request){
		System.out.println("jestem w controller - zapisz");
		generacjaWiatrService.save(generacjaWiatr);
		System.out.println("jestem w controller - zapisałem");
		request.setAttribute("Wiatr", generacjaWiatrService.findAll());
		request.setAttribute("mode", "MODE-WIATR");
		return "wiatr";
	}
	
	@GetMapping("/updateWiatr")
	public String updateWiatr(@RequestParam Integer id, HttpServletRequest request){
		System.out.println("jestem w controller - update");
		request.setAttribute("generacjaWiatr", generacjaWiatrService.findWiatr(id));
		request.setAttribute("mode", "MODE-UPDATE");
		return "wiatr";
	}
	
	@GetMapping("/delateWiatr")
	public String delateWiatr(@RequestParam Integer id, HttpServletRequest request){
		generacjaWiatrService.delate(id);
		request.setAttribute("generacjaWiatr", generacjaWiatrService.findAll());
		request.setAttribute("mode", "MODE-WIATR");
		return "wiatr";
	}
	
	@PostMapping("/wiatrWykres")
	public String wykresWiatr(@ModelAttribute String data, HttpServletRequest request){
		List<GeneracjaWiatr> lista = new ArrayList<>();
		lista = generacjaWiatrService.findByDataOrderByGodzina(Date.valueOf(data));
		if(lista.isEmpty()){
			request.setAttribute("mode", "MODE-BRAK");
			return "start";
		}else{
			request.setAttribute("Wiatr", lista);
			request.setAttribute("mode", "MODE-WYKRES");
			return "wiatrWykres";
		}
	}
	
	@GetMapping("/wykresWiatrData")
	public String wykresWiatrData(HttpServletRequest request) {
		request.setAttribute("mode", "MODE-DATA-WIATR");
		return "wykresyUstawDate";
	}
}
