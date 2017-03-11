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

import com.pawel.model.WymianaMiedzysystemowa;
import com.pawel.service.WymianaMiedzysystemowaService;

@Controller
public class WymianaMiedzysystemowaController {
	
	@Autowired
	WymianaMiedzysystemowaService wymianaMiedzysystemowaService;
	
	@GetMapping("/wymianaMiedzysystemowa")
	public String wymianaMiedzystemowa(HttpServletRequest request){
		request.setAttribute("Wymiana", wymianaMiedzysystemowaService.findAll());
		request.setAttribute("mode", "MODE-WYMIANA");
		return "wymiana";
	}
	
	@GetMapping("/nowaWymiana")
	public String nowaWymiana(HttpServletRequest request){
		request.setAttribute("mode", "MODE-NOWY");
		return "wymiana";
	}
	
	@PostMapping("/zapiszWymiana")
	public String zapiszWymiana(@ModelAttribute WymianaMiedzysystemowa wymianaMiedzysystemowa, HttpServletRequest request){
		wymianaMiedzysystemowaService.save(wymianaMiedzysystemowa);
		request.setAttribute("Wymiana", wymianaMiedzysystemowaService.findAll());
		request.setAttribute("mode", "MODE-WYMIANA");
		return "wymiana";
	}
	
	@GetMapping("/updateWymiana")
	public String updateWymiana(@RequestParam Integer id, HttpServletRequest request){
		request.setAttribute("wymianaMiedzysystemowa", wymianaMiedzysystemowaService.findWymiana(id));
		request.setAttribute("mode", "MODE-UPDATE");
		return "wymiana";
	}
	
	@GetMapping("/delateWymiana")
	public String delateWymiana(@RequestParam Integer id, HttpServletRequest request){
		wymianaMiedzysystemowaService.delate(id);
		request.setAttribute("wymianaMiedzysystemowa", wymianaMiedzysystemowaService.findAll());
		request.setAttribute("mode", "MODE-WYMIANA");
		return "wymiana";
	}
	
	@PostMapping("/wymianaWykres")
	public String wykresWymiana(@ModelAttribute String data, HttpServletRequest request){
		List<WymianaMiedzysystemowa> lista = new ArrayList<>();
		lista = wymianaMiedzysystemowaService.findByDataOrderByGodzina(Date.valueOf(data));
		if(lista.isEmpty()){
			request.setAttribute("mode", "MODE-BRAK");
			return "start";
		}else{
			request.setAttribute("Wymiana", lista);
			request.setAttribute("mode", "MODE-WYKRES");
			return "wymianaWykres";
		}

	}
	
	@GetMapping("/wykresWymianaData")
	public String wykresWymianaData(HttpServletRequest request) {
		request.setAttribute("mode", "MODE-DATA-WYMIANA");
		return "wykresyUstawDate";
	}
}
