package com.pawel.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class GeneracjaWiatr {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private Date data;
	private int godzina;
	private double generacjaWiatr;

	@Override
	public String toString() {
		return "GeneracjaWiatr [id=" + id + ", data=" + data + ", godzina=" + godzina + ", generacjaWiatr="
				+ generacjaWiatr + "]";
	}	

	public GeneracjaWiatr() {}
	
	public GeneracjaWiatr(Date data, int godzina, double generacjaWiatr) {
		super();
		this.data = data;
		this.godzina = godzina;
		this.generacjaWiatr = generacjaWiatr;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		System.out.println("jeste w setID " + id);
		this.id = id;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		System.out.println("jeste w setData " + data);
		this.data = data;
	}
	public int getGodzina() {
		return godzina;
	}
	public void setGodzina(int godzina) {
		System.out.println("jeste w setGodzina " + godzina);
		this.godzina = godzina;
	}
	
	public double getGeneracjaWiatrDouble() {
		return generacjaWiatr;
	}
	public void setGeneracjaWiatrDouble(double generacjaWiatr) {
		System.out.println("jeste w setGeneracjaWiatr " + generacjaWiatr);
		this.generacjaWiatr = generacjaWiatr;
	}
}
