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

import com.pawel.model.WymianaMiedzysystemowa;
import com.pawel.service.WymianaMiedzysystemowaService;

@Controller
public class WymianaPobieranieController {

	@Autowired
	WymianaMiedzysystemowaService wymianaMiedzysystemowaService;

	@GetMapping("/ustawDateWymianaHTML")
	public String ustawDateWymianaHTML(HttpServletRequest request) {
		request.setAttribute("mode", "MODE-POBIERANIE-DATA-HTML");
		return "wymianaPobieranie";
	}
	
	@GetMapping("/ustawDateWymianaCSV")
	public String ustawDateWymianaCSV(HttpServletRequest request) {
		request.setAttribute("mode", "MODE-POBIERANIE-DATA-CSV");
		return "wymianaPobieranie";
	}

	@PostMapping("/pobieranieWymianaHTML")
	public String pobierzWymianaHTML(@ModelAttribute String data, HttpServletRequest request) {
		String html = "http://www.pse.pl/index.php?modul=21&id_rap=9&data=" + data;
		try {
			Document doc = Jsoup.connect(html).get();
			Elements tabela = doc.select("table");

			Elements wiersze = tabela.select(":not(thead) tr");
			for (int i = 5; i < wiersze.size(); i++) {
				Element wiersz = wiersze.get(i);
				Elements wartos = wiersz.select("td");
				String[] tablica = new String[13];

				for (int j = 0; j < wartos.size(); j++) {
					tablica[j] = wartos.get(j).text().replace(",", ".").replace(" ", "");
					if (tablica[j].equals("-")) {
						tablica[j] = Integer.toString(0);
					}
				}

				WymianaMiedzysystemowa wymiana = new WymianaMiedzysystemowa();
				wymiana.setData(Date.valueOf(data));
				wymiana.setGodzina(Integer.parseInt(tablica[0]));
				
				WymianaMiedzysystemowa test = wymianaMiedzysystemowaService.findByDataAndGodzina(wymiana.getData(), wymiana.getGodzina());
				if (test != null){
					wymiana.setId(test.getId());
					System.out.println("Rekord już istnieje, dlatego go aktualizuję, id: " +wymiana.getId() + "stare id: " + test.getId());
				}
				wymiana.seteCzechy(Double.parseDouble(tablica[1]));
				wymiana.setiCzechy(Double.parseDouble(tablica[2]));
				wymiana.seteSlowacja(Double.parseDouble(tablica[3]));
				wymiana.setiSlowacja(Double.parseDouble(tablica[4]));
				wymiana.seteNiemcy(Double.parseDouble(tablica[5]));
				wymiana.setiNiemcy(Double.parseDouble(tablica[6]));
				wymiana.seteSzwecja(Double.parseDouble(tablica[7]));
				wymiana.setiSzwecja(Double.parseDouble(tablica[8]));
				wymiana.seteUkraina(Double.parseDouble(tablica[9]));
				wymiana.setiUkraina(Double.parseDouble(tablica[10]));
				wymiana.seteLitwa(Double.parseDouble(tablica[11]));
				wymiana.setiLitwa(Double.parseDouble(tablica[12]));
				wymianaMiedzysystemowaService.save(wymiana);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("Wymiana", wymianaMiedzysystemowaService.findByDataOrderByGodzina(Date.valueOf(data)));
		request.setAttribute("mode", "MODE-WYKRES");
		return "wymianaWykres";
	}

	@PostMapping("/pobieranieWymianaCSV")
	public String pobierzWymianaCSV(@ModelAttribute String data, HttpServletRequest request) {
		BufferedReader reader;
		try {
			reader = new BufferedReader(new FileReader("C:\\wymSQL\\WYMIANA-"+data+".csv"));
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

					WymianaMiedzysystemowa wymiana = new WymianaMiedzysystemowa();
					wymiana.setData(Date.valueOf(data));
					wymiana.setGodzina(Integer.parseInt(split[1]));
					
					WymianaMiedzysystemowa test = wymianaMiedzysystemowaService.findByDataAndGodzina(wymiana.getData(), wymiana.getGodzina());
					if (test != null){
						wymiana.setId(test.getId());
						System.out.println("Rekord już istnieje, dlatego go aktualizuję, id: " +wymiana.getId() + "stare id: " + test.getId());
					}			
					wymiana.seteCzechy(Double.parseDouble(split[2]));
					wymiana.setiCzechy(Double.parseDouble(split[3]));
					wymiana.seteSlowacja(Double.parseDouble(split[4]));
					wymiana.setiSlowacja(Double.parseDouble(split[5]));
					wymiana.seteNiemcy(Double.parseDouble(split[6]));
					wymiana.setiNiemcy(Double.parseDouble(split[7]));
					wymiana.seteSzwecja(Double.parseDouble(split[8]));
					wymiana.setiSzwecja(Double.parseDouble(split[9]));
					wymiana.seteUkraina(Double.parseDouble(split[10]));
					wymiana.setiUkraina(Double.parseDouble(split[11]));
					wymiana.seteLitwa(Double.parseDouble(split[12]));
					wymiana.setiLitwa(Double.parseDouble(split[13]));
					wymianaMiedzysystemowaService.save(wymiana);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("Wymiana", wymianaMiedzysystemowaService.findByDataOrderByGodzina(Date.valueOf(data)));
		request.setAttribute("mode", "MODE-WYKRES");
		return "wymianaWykres";
	}
}