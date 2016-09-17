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
@Table(name="attendence")
public class Attendence {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "regNo", nullable = false)
	private Student student;
	
	@Column(name="classId")
	private String classId;
	
	@Column(name="attendTime")
	private Date attendTime;

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

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public Date getAttendTime() {
		return attendTime;
	}

	public void setAttendTime(Date attendTime) {
		this.attendTime = attendTime;
	}
	
}
