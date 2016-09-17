package com.student.admin;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="exams")
public class Exam {


	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "classid", nullable = false)
	private ClassCategory classCategory;
	
	@Column(name="description")
	private String description;
	
	@Column(name="examdate")
	private String examDate;
	
	@Column(name="examStartTime")
	private String examStartTime;
	
	@Column(name="examEndTime")
	private String examEndTime;
	
	@Column(name="examnumber")
	private String examNumber;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public ClassCategory getClassCategory() {
		return classCategory;
	}

	public void setClassCategory(ClassCategory classCategory) {
		this.classCategory = classCategory;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getExamDate() {
		return examDate;
	}

	public void setExamDate(String examDate) {
		this.examDate = examDate;
	}

	public String getExamStartTime() {
		return examStartTime;
	}

	public void setExamStartTime(String examStartTime) {
		this.examStartTime = examStartTime;
	}

	public String getExamEndTime() {
		return examEndTime;
	}

	public void setExamEndTime(String examEndTime) {
		this.examEndTime = examEndTime;
	}


	public String getExamNumber() {
		return examNumber;
	}

	public void setExamNumber(String examNumber) {
		this.examNumber = examNumber;
	}

	


}
