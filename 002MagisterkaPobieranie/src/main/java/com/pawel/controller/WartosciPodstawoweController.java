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

import com.pawel.model.WartosciPodstawowe;
import com.pawel.service.WartosciPodstawoweService;

@Controller
public class WartosciPodstawoweController {

	@Autowired
	WartosciPodstawoweService wartosciPodstawoweService;

	@GetMapping("/wartosciPodstawowe")
	public String wartosciPodstawowe(HttpServletRequest request) {
		request.setAttribute("wartPodst", wartosciPodstawoweService.findAll());
		request.setAttribute("mode", "MODE-PODSTAWA");
		return "podstawowe";
	}

	@GetMapping("/nowaWartPodst")
	public String nowaPodstawa(HttpServletRequest request) {
		request.setAttribute("mode", "MODE-NOWY");
		return "podstawowe";
	}

	@PostMapping("/zapiszWartPodst")
	public String zapiszPodstawa(@ModelAttribute WartosciPodstawowe wartosciPodstawowe, HttpServletRequest request) {
		wartosciPodstawoweService.save(wartosciPodstawowe);
		request.setAttribute("wartPodst", wartosciPodstawoweService.findAll());
		request.setAttribute("mode", "MODE-PODSTAWA");
		return "podstawowe";
	}

	@GetMapping("/updateWartPodst")
	public String updatePodstawa(@RequestParam Integer id, HttpServletRequest request) {
		request.setAttribute("wartoscipodstawowe", wartosciPodstawoweService.findWartosci(id));
		request.setAttribute("mode", "MODE-UPDATE");
		return "podstawowe";
	}

	@GetMapping("/delateWartPodst")
	public String delatePodstawa(@RequestParam Integer id, HttpServletRequest request) {
		wartosciPodstawoweService.delate(id);
		request.setAttribute("wartoscipodstawowe", wartosciPodstawoweService.findAll());
		request.setAttribute("mode", "MODE-PODSTAWA");
		return "podstawowe";
	}

	@PostMapping("/podstawaWykres")
	public String wykresPodstawa(@ModelAttribute String data, HttpServletRequest request){
		List<WartosciPodstawowe> lista = new ArrayList<>();
		lista = wartosciPodstawoweService.findByDataOrderByGodzina(Date.valueOf(data));
		if(lista.isEmpty()){
			request.setAttribute("mode", "MODE-BRAK");
			return "start";
		}else {
			request.setAttribute("wartPodst", wartosciPodstawoweService.findByDataOrderByGodzina(Date.valueOf(data)));
			request.setAttribute("mode", "MODE-WYKRES");
			return "podstawoweWykres";
		}
	}

	@GetMapping("/wykresPodstawaData")
	public String wykresPodstawaData(HttpServletRequest request) {
		request.setAttribute("mode", "MODE-DATA-PODSTAWA");
		return "wykresyUstawDate";
	}
}
