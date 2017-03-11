package com.pawel.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class WartosciPodstawowe {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private Date data;
	private int godzina;
	private double zapotrzebowanie;
	private double generacjaJWCD;
	private double generacjaPI;
	private double generacjaIRZ;
	private double generacjaNJWCD;
	private double wymianaRow;
	private double wymianaNieRow;
	
	
	@Override
	public String toString() {
		return "WartosciPodstawowe [id=" + id + ", data=" + data + ", godzina=" + godzina + ", zapotrzebowanie="
				+ zapotrzebowanie + ", generacjaJWCD=" + generacjaJWCD + ", generacjaPI=" + generacjaPI
				+ ", generacjaIRZ=" + generacjaIRZ + ", generacjaNJWCD=" + generacjaNJWCD + ", wymianaRow=" + wymianaRow
				+ ", wymianaNieRow=" + wymianaNieRow + "]";
	}

	public WartosciPodstawowe() {}

	public WartosciPodstawowe(Date data, int godzina, double zapotrzebowanie, double generacjaJWCD,
			double generacjaPI, double generacjaIRZ, double generacjaNJWCD, double wymianaRow, double wymianaNieRow) {
		super();
		this.data = data;
		this.godzina = godzina;
		this.zapotrzebowanie = zapotrzebowanie;
		this.generacjaJWCD = generacjaJWCD;
		this.generacjaPI = generacjaPI;
		this.generacjaIRZ = generacjaIRZ;
		this.generacjaNJWCD = generacjaNJWCD;
		this.wymianaRow = wymianaRow;
		this.wymianaNieRow = wymianaNieRow;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public int getGodzina() {
		return godzina;
	}
	public void setGodzina(int godzina) {
		this.godzina = godzina;
	}
	public double getZapotrzebowanie() {
		return zapotrzebowanie;
	}
	public void setZapotrzebowanie(double zapotrzebowanie) {
		this.zapotrzebowanie = zapotrzebowanie;
	}
	public double getGeneracjaJWCD() {
		return generacjaJWCD;
	}
	public void setGeneracjaJWCD(double generacjaJWCD) {
		this.generacjaJWCD = generacjaJWCD;
	}
	public double getGeneracjaPI() {
		return generacjaPI;
	}
	public void setGeneracjaPI(double generacjaPI) {
		this.generacjaPI = generacjaPI;
	}
	public double getGeneracjaIRZ() {
		return generacjaIRZ;
	}
	public void setGeneracjaIRZ(double generacjaIRZ) {
		this.generacjaIRZ = generacjaIRZ;
	}
	public double getGeneracjaNJWCD() {
		return generacjaNJWCD;
	}
	public void setGeneracjaNJWCD(double generacjaNJWCD) {
		this.generacjaNJWCD = generacjaNJWCD;
	}
	public double getWymianaRow() {
		return wymianaRow;
	}
	public void setWymianaRow(double wymianaRow) {
		this.wymianaRow = wymianaRow;
	}
	public double getWymianaNieRow() {
		return wymianaNieRow;
	}
	public void setWymianaNieRow(double wymianaNieRow) {
		this.wymianaNieRow = wymianaNieRow;
	}
}
