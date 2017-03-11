package com.pawel.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MainController {
	
	@GetMapping("/start")
	public String startowa(HttpServletRequest request){
		request.setAttribute("mode", "MODE-DOM");
		return "start";
	}
	
	@GetMapping("/kalendarz")
	public String kalendarz(HttpServletRequest request){
		request.setAttribute("mode", "MODE-KALENDARZ");
		return "kalendarz";
	}
}
