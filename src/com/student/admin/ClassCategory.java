package com.student.admin;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="classcategory")
public class ClassCategory {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Column(name="classId", unique=true)
	private String classId;
	
	@Column(name="Fee")
	private Double fee;
	
	@Column(name="paymentCategory")
	private String paymentCategory;

	@Column(name="subject")
	private String subject;
	
	@Column(name="lectureName")
	private String lectureName;
	
	@Column(name="startTime")
	private String startTime;
	
	@Column(name="endTime")
	private String endTime;
	
	

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getLectureName() {
		return lectureName;
	}

	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}

	public Double getFee() {
		return fee;
	}

	public void setFee(Double fee) {
		this.fee = fee;
	}

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}


	public String getPaymentCategory() {
		return paymentCategory;
	}

	public void setPaymentCategory(String paymentCategory) {
		this.paymentCategory = paymentCategory;
	}
	
	
	
	
	
	
}
