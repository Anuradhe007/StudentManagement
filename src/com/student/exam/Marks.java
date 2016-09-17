package com.student.exam;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.CascadeType;
import javax.persistence.Table;
import javax.persistence.JoinColumn;
import javax.persistence.Column;

import com.student.util.HibernateUtil;


@Entity
@Table(name="exam_marks")
public class Marks implements Serializable{
	
	
	@Id
	@Column(name="RegNo", unique=true, insertable=false, updatable=false)
	private String m_regNO;
	
	@Id
	 @Column(name="SubjectNo", unique=true, insertable=false, updatable=false)
	private String m_subjectNo;
	
	@Id
	 @Column(name="Month", unique=true, insertable=false, updatable=false)
	private String m_month;
	
	
	@Column(name="Marks")
	private String m_marks;
	
	@Id
	@Column(name="Year", unique=true, insertable=false, updatable=false)
	private String m_year;
	

	 
	public String getRegNo() {
		return m_regNO;
	}
	public void setRegNo(String regNo) {
		m_regNO = regNo;
	}
	public String getSubjectNo() {
		return m_subjectNo;
	}
	public void setSubjectNo(String subjectNo) {
		m_subjectNo = subjectNo;
	}
	public String getMonth() {
		return m_month;
	}
	public void setMonth(String month) {
		m_month = month;
	}
	public String getMarks() {
		return m_marks;
	}
	public void setMarks(String marks) {
		m_marks = marks;
	}
	public String getYear() {
		return m_year;
	}
	public void setYear(String year) {
		m_year = year;
	}
	
	
public static void main(String aa[]){
	MarksManager mgt = new MarksManager();
	try {
		mgt.getStudentMarks("2012V10030", "Java","2012");
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

		
}	
		
		
		
		
		
		
		
		
		
		





