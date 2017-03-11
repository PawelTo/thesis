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

import com.pawel.model.WartosciPodstawowe;
import com.pawel.service.WartosciPodstawoweService;

@Controller
public class WartPodstPobieranieController {

	@Autowired
	WartosciPodstawoweService wartosciPodstawoweService;
	
	@GetMapping("/ustawDateWartPodsHTML")
	public String ustawDateWartPodsHTML(HttpServletRequest request) {
		request.setAttribute("mode", "MODE-POBIERANIE-DATA-HTML");
		return "podstawowePobieranie";
	}
	
	@GetMapping("/ustawDateWartPodsCSV")
	public String ustawDateWartPodsCSV(HttpServletRequest request) {
		request.setAttribute("mode", "MODE-POBIERANIE-DATA-CSV");
		return "podstawowePobieranie";
	}
	
	@PostMapping("/pobieranieWartPodsHTML")
	public String pobierzWartPodsHTML(@ModelAttribute String data, HttpServletRequest request) {
		String html = "http://www.pse.pl/index.php?modul=21&id_rap=8&data=" + data;
		System.out.println("Jestem w metodzie pobierzData " + data);
		try {
			Document doc = Jsoup.connect(html).get();
			Elements tabela = doc.select("table");

			Elements wiersze = tabela.select(":not(thead) tr");
			for (int i = 4; i < wiersze.size(); i++) {
				Element wiersz = wiersze.get(i);
				Elements wartos = wiersz.select("td");
				String[] tablica = new String[9];

				for (int j = 0; j < wartos.size(); j++) {
					tablica[j] = wartos.get(j).text().replace(",", ".").replace(" ", "");
					if (tablica[j].equals("-")) {
						tablica[j] = Integer.toString(0);
					}
				}

				WartosciPodstawowe podstawowe = new WartosciPodstawowe();
				podstawowe.setData(Date.valueOf(data));
				podstawowe.setGodzina(Integer.parseInt(tablica[0]));
				
				WartosciPodstawowe test = wartosciPodstawoweService.findByDataAndGodzina(podstawowe.getData(), podstawowe.getGodzina());
				if(test != null){
					podstawowe.setId(test.getId());
					System.out.println("Rekord istnieje "+test.getId());
				}
				podstawowe.setZapotrzebowanie(Double.parseDouble(tablica[1]));
				podstawowe.setGeneracjaJWCD(Double.parseDouble(tablica[2]));
				podstawowe.setGeneracjaPI(Double.parseDouble(tablica[3]));
				podstawowe.setGeneracjaIRZ(Double.parseDouble(tablica[4]));
				podstawowe.setGeneracjaNJWCD(Double.parseDouble(tablica[5]));
				podstawowe.setWymianaRow(Double.parseDouble(tablica[6]));
				podstawowe.setWymianaNieRow(Double.parseDouble(tablica[7]));
				wartosciPodstawoweService.save(podstawowe);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("wartPodst", wartosciPodstawoweService.findByDataOrderByGodzina(Date.valueOf(data)));
		request.setAttribute("mode", "MODE-WYKRES");
		return "podstawoweWykres";
	}

	@PostMapping("/pobieranieWartPodsCSV")
	public String pobierzWartPodsCSV(@ModelAttribute String data, HttpServletRequest request) {
		BufferedReader reader;
		try {
			reader = new BufferedReader(new FileReader("C:\\wymSQL\\PODSTAWOWE-"+data+".csv"));
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

					WartosciPodstawowe podstawowe = new WartosciPodstawowe();
					podstawowe.setData(Date.valueOf(data));
					podstawowe.setGodzina(Integer.parseInt(split[1]));
					
					WartosciPodstawowe test = wartosciPodstawoweService.findByDataAndGodzina(podstawowe.getData(), podstawowe.getGodzina());
					if(test != null){
						podstawowe.setId(test.getId());
						System.out.println("Rekord istnieje "+test.getId());
					}
					podstawowe.setZapotrzebowanie(Double.parseDouble(split[2]));
					podstawowe.setGeneracjaJWCD(Double.parseDouble(split[3]));
					podstawowe.setGeneracjaPI(Double.parseDouble(split[4]));
					podstawowe.setGeneracjaIRZ(Double.parseDouble(split[5]));
					podstawowe.setGeneracjaNJWCD(Double.parseDouble(split[6]));
					podstawowe.setWymianaRow(Double.parseDouble(split[7]));
					podstawowe.setWymianaNieRow(Double.parseDouble(split[8]));
					wartosciPodstawoweService.save(podstawowe);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("wartPodst", wartosciPodstawoweService.findByDataOrderByGodzina(Date.valueOf(data)));
		request.setAttribute("mode", "MODE-WYKRES");
		return "podstawoweWykres";
	}
}

