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

import com.student.user.Student;

@Entity
@Table(name="addmission")
public class Addmission {


	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "studentId", nullable = false)
	private Student student;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "examid", nullable = false)
	private Exam exam;
	
	@Column(name="regno")
	private String regNo;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Exam getExam() {
		return exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
	}

	public String getRegNo() {
		return regNo;
	}

	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}

	

	

}
