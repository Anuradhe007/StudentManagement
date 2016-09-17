package com.student.admin;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="classyear")
public class MetaClassYear {
	
	@Column(name="MyYear", unique=true)
	private String classYear;
	

	public String getClassYear() {
		return classYear;
	}

	public void setClassYear(String classYear) {
		this.classYear = classYear;
	}
	
	

}
