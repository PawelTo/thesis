package com.pawel.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class WymianaMiedzysystemowa {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private Date data;
	private int godzina;
	private double eCzechy;
	private double iCzechy;
	private double eSlowacja;
	private double iSlowacja;
	private double eNiemcy;
	private double iNiemcy;
	private double eSzwecja;
	private double iSzwecja;
	private double eUkraina;
	private double iUkraina;
	private double eLitwa;
	private double iLitwa;
	
	
	@Override
	public String toString() {
		return "WymianaMiedzysystemowa [id=" + id + ", data=" + data + ", godzina=" + godzina + ", eCzechy=" + eCzechy
				+ ", iCzechy=" + iCzechy + ", eSlowacja=" + eSlowacja + ", iSlowacja=" + iSlowacja + ", eNiemcy="
				+ eNiemcy + ", iNiemcy=" + iNiemcy + ", eSzwecja=" + eSzwecja + ", iSzwecja=" + iSzwecja + ", eUkraina="
				+ eUkraina + ", iUkraina=" + iUkraina + ", eLitwa=" + eLitwa + ", iLitwa=" + iLitwa + "]";
	}

	public WymianaMiedzysystemowa() {}
	
	public WymianaMiedzysystemowa(Date data, int godzina, double eCzechy, double iCzechy, double eSlowacja,
			double iSlowacja, double eNiemcy, double iNiemcy, double eSzwecja, double iSzwecja, double eUkraina,
			double iUkraina, double eLitwa, double iLitwa) {
		super();
		this.data = data;
		this.godzina = godzina;
		this.eCzechy = eCzechy;
		this.iCzechy = iCzechy;
		this.eSlowacja = eSlowacja;
		this.iSlowacja = iSlowacja;
		this.eNiemcy = eNiemcy;
		this.iNiemcy = iNiemcy;
		this.eSzwecja = eSzwecja;
		this.iSzwecja = iSzwecja;
		this.eUkraina = eUkraina;
		this.iUkraina = iUkraina;
		this.eLitwa = eLitwa;
		this.iLitwa = iLitwa;
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
	public double geteCzechy() {
		return eCzechy;
	}
	public void seteCzechy(double eCzechy) {
		this.eCzechy = eCzechy;
	}
	public double getiCzechy() {
		return iCzechy;
	}
	public void setiCzechy(double iCzechy) {
		this.iCzechy = iCzechy;
	}
	public double geteSlowacja() {
		return eSlowacja;
	}
	public void seteSlowacja(double eSlowacja) {
		this.eSlowacja = eSlowacja;
	}
	public double getiSlowacja() {
		return iSlowacja;
	}
	public void setiSlowacja(double iSlowacja) {
		this.iSlowacja = iSlowacja;
	}
	public double geteNiemcy() {
		return eNiemcy;
	}
	public void seteNiemcy(double eNiemcy) {
		this.eNiemcy = eNiemcy;
	}
	public double getiNiemcy() {
		return iNiemcy;
	}
	public void setiNiemcy(double iNiemcy) {
		this.iNiemcy = iNiemcy;
	}
	public double geteSzwecja() {
		return eSzwecja;
	}
	public void seteSzwecja(double eSzwecja) {
		this.eSzwecja = eSzwecja;
	}
	public double getiSzwecja() {
		return iSzwecja;
	}
	public void setiSzwecja(double iSzwecja) {
		this.iSzwecja = iSzwecja;
	}
	public double geteUkraina() {
		return eUkraina;
	}
	public void seteUkraina(double eUkraina) {
		this.eUkraina = eUkraina;
	}
	public double getiUkraina() {
		return iUkraina;
	}
	public void setiUkraina(double iUkraina) {
		this.iUkraina = iUkraina;
	}
	public double geteLitwa() {
		return eLitwa;
	}
	public void seteLitwa(double eLitwa) {
		this.eLitwa = eLitwa;
	}
	public double getiLitwa() {
		return iLitwa;
	}
	public void setiLitwa(double iLitwa) {
		this.iLitwa = iLitwa;
	}
}
