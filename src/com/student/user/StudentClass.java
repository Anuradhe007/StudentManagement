package com.student.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.student.admin.ClassCategory;

@Entity
@Table(name="student_class")
public class StudentClass {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "studentId", nullable = false)
	private Student student;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "classId", nullable = false)
	private ClassCategory classCategory;

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

	public ClassCategory getClassCategory() {
		return classCategory;
	}

	public void setClassCategory(ClassCategory classCategory) {
		this.classCategory = classCategory;
	}
	

}
