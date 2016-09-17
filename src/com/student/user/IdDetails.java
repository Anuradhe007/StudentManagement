package com.student.user;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="iddetails")
public class IdDetails {
	
	@Id    
	@Column(name="ID", unique=true, insertable=true, updatable=false)
	@GeneratedValue(strategy=GenerationType.AUTO)
	private String id;
	

	@Column(name="NAME")
	private String name;
	
	@Column(name="createdTime")
	private Date createdTime;
	
	@Column(name="addmission")
	private String addmission;
	
	public String getAddmission() {
		return addmission;
	}

	public void setAddmission(String addmission) {
		this.addmission = addmission;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	

}
