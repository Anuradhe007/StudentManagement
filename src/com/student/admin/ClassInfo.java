package com.student.admin;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "classinfo")
public class ClassInfo {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private String classId;

	@Column(name = "Description")
	private String description;

	@Column(name = "Subject")
	private String subject;
	
	@Column(name = "Stream")
	private String stream;

	@Column(name = "RegYear")
	private String regYear;

	@Column(name = "WeekDay")
	private String weekDay;

	@Column(name = "StartTime")
	private String startTime;

	@Column(name = "EndTime")
	private String endTime;

	@Column(name = "ClassType")
	private String classType;

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getStream() {
		return stream;
	}

	public void setStream(String stream) {
		this.stream = stream;
	}

	public String getRegYear() {
		return regYear;
	}

	public void setRegYear(String regYear) {
		this.regYear = regYear;
	}

	public String getWeekDay() {
		return weekDay;
	}

	public void setWeekDay(String weekDay) {
		this.weekDay = weekDay;
	}

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

	public String getClassType() {
		return classType;
	}

	public void setClassType(String classType) {
		this.classType = classType;
	}



	
	

}
