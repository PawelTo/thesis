package com.pawel.controller;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.pawel.model.GeneracjaWiatr;
import com.pawel.service.GeneracjaWiatrService;

@Controller
public class GenWiatrPobieranieController {

	@Autowired
	GeneracjaWiatrService generacjaWiatrService;
	
	@GetMapping("/ustawDateWiatrHTML")
	public String ustawDateWiatrHTML(HttpServletRequest request) {
		request.setAttribute("mode", "MODE-POBIERANIE-DATA-HTML");
		return "wiatrPobieranie";
	}
	
	@GetMapping("/ustawDateWiatrCSV")
	public String ustawDateWiatrCSV(HttpServletRequest request) {
		request.setAttribute("mode", "MODE-POBIERANIE-DATA-CSV");
		return "wiatrPobieranie";
	}
	
	@PostMapping("/pobieranieWiatrHTML")
	public String pobierzWiatrHTML(@ModelAttribute String data, HttpServletRequest request) {
		String html = "http://www.pse.pl/index.php?modul=21&id_rap=24&data=" + data;
		System.out.println("Jestem w metodzie pobierzData " + data);
		try {
			Document doc = Jsoup.connect(html).get();
			Elements tabela = doc.select("table");

			Elements wiersze = tabela.select(":not(thead) tr");
			for (int i = 4; i < wiersze.size(); i++) {
				Element wiersz = wiersze.get(i);
				Elements wartos = wiersz.select("td");
				String[] tablica = new String[2];

				for (int j = 0; j < wartos.size(); j++) {
					tablica[j] = wartos.get(j).text().replace(",", ".").replace(" ", "");
					if (tablica[j].equals("-")) {
						tablica[j] = Integer.toString(0);
					}
				}

				GeneracjaWiatr wiatr = new GeneracjaWiatr();
				wiatr.setData(Date.valueOf(data));
				wiatr.setGodzina(Integer.parseInt(tablica[0]));
				
				GeneracjaWiatr test = generacjaWiatrService.findByDataAndGodzina(wiatr.getData(), wiatr.getGodzina());
				if(test != null){
					wiatr.setId(test.getId());
					System.out.println("Rekord istnieje " + test.getId());
				}
				wiatr.setGeneracjaWiatrDouble(Double.parseDouble(tablica[1]));
				generacjaWiatrService.save(wiatr);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("Wiatr", generacjaWiatrService.findByDataOrderByGodzina(Date.valueOf(data)));
		request.setAttribute("mode", "MODE-WYKRES");
		return "wiatrWykres";
	}

	@PostMapping("/pobieranieWiatrCSV")
	public String pobierzWiatrCSV(@ModelAttribute String data, HttpServletRequest request) {
		BufferedReader reader;
		try {
			reader = new BufferedReader(new FileReader("C:\\wymSQL\\WIATR-"+data+".csv"));
			try {
				System.out.println(reader.readLine());
				String linia;
				while ((linia = reader.readLine()) != null) {
					String[] split = linia.split(";");
					for (int i = 0; i < split.length; i++) {

						if (split[i].equals("-")) {
							split[i] = Integer.toString(0);
						}
						split[i] = split[i].replace(",", ".");
					}

					GeneracjaWiatr wiatr = new GeneracjaWiatr();
					wiatr.setData(Date.valueOf(data));
					wiatr.setGodzina(Integer.parseInt(split[1]));
					
					GeneracjaWiatr test = generacjaWiatrService.findByDataAndGodzina(wiatr.getData(), wiatr.getGodzina());
					if(test != null){
						wiatr.setId(test.getId());
						System.out.println("Rekord istnieje " + test.getId());
					}
					wiatr.setGeneracjaWiatrDouble(Double.parseDouble(split[2]));
					generacjaWiatrService.save(wiatr);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("Wiatr", generacjaWiatrService.findByDataOrderByGodzina(Date.valueOf(data)));
		request.setAttribute("mode", "MODE-WYKRES");
		return "wiatrWykres";
	}
}
