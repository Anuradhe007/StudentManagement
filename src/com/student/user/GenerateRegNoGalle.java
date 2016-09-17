package com.student.user;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="generateregnogalle")
public class GenerateRegNoGalle implements Serializable {
	
	
	@Id    
	@Column(name="No", unique=true, insertable=true, updatable=false)
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int m_id;
	
	@Column(name="Yer")
	private String m_yer;
	
	@Column(name="Symbol")
	private String m_symbol;
	
	
	
	public int getId() {
		return m_id;
	}
	
	public void setId(int id) {
		m_id = id;
	}
	public String getYer() {
		return m_yer;
	}
	public void setYer(String ymer) {
		this.m_yer = ymer;
	}
	public String getSymbol() {
		return m_symbol;
	}
	public void setSymbol(String symbol) {
		this.m_symbol = symbol;
	}
	
	
	

}
