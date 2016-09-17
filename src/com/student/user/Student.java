package com.student.user;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;


@Entity
@Table(name="studentInfo")
public class Student implements Serializable{
	@Id    
	@Column(name="ID", unique=true, insertable=true, updatable=false)
	@GeneratedValue(strategy=GenerationType.AUTO)
	private String id;
	
	@Column(name="REGNO")
	private String regNo;
	
	
	@Column(name="FULLNAME")
	private String fullName;
	 
	@Column(name="INITIALS")
	private String initials;
	 
	@Column(name="LASTNAME")
	private String lastName;
	 
	@Column(name="SEX")
	private String sex;
	 
	@Column(name="TITLE")
	private  String title;
	 
	@Column(name="NIC")
	private String nic;
	 
	@Column(name="DOB")
	private String dob;
	 
	@Column(name="DISTRICT")
	private String district;
	 
	@Column(name="MOBILE")
	private String telephone;
	 
	@Column(name="EMAIL") 
	private String email;
	 
	 
	@Column(name="ADDRESS") 
	private String address;
	 
	@Column(name="ALYEAR") 
	private String alYear;
	
	@Lob
	@Column(name="STU_IMAGE", columnDefinition="mediumblob")
	private byte[] image;
	
	@Column(name="IMG_NAME")
	private String imgName;
	
	@Column(name="FatherName") 
	private String fatherName;
	
	@Column(name="FatherJob") 
	private String fatherJob;
	
	@Column(name="FatherPhone") 
	private String fatherPhone;
	
	@Column(name="MotherName") 
	private String motherName;
	
	@Column(name="MotherJob") 
	private String motherJob;
	
	@Column(name="MotherPhone") 
	private String motherPhone;
	
	@Column(name="SubjectStream") 
	private String subjectStream;
	
	@Column(name="School")
	private String school;
	
	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getFatherName() {
		return fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	public String getFatherJob() {
		return fatherJob;
	}

	public void setFatherJob(String fatherJob) {
		this.fatherJob = fatherJob;
	}

	public String getFatherPhone() {
		return fatherPhone;
	}

	public void setFatherPhone(String fatherPhone) {
		this.fatherPhone = fatherPhone;
	}

	public String getMotherName() {
		return motherName;
	}

	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}

	public String getMotherJob() {
		return motherJob;
	}

	public void setMotherJob(String motherJob) {
		this.motherJob = motherJob;
	}

	public String getMotherPhone() {
		return motherPhone;
	}

	public void setMotherPhone(String motherPhone) {
		this.motherPhone = motherPhone;
	}

	public String getSubjectStream() {
		return subjectStream;
	}

	public void setSubjectStream(String subjectStream) {
		this.subjectStream = subjectStream;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRegNo() {
		return regNo;
	}

	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getInitials() {
		return initials;
	}

	public void setInitials(String initials) {
		this.initials = initials;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAlYear() {
		return alYear;
	}

	public void setAlYear(String alYear) {
		this.alYear = alYear;
	}
	 
	
	

	
	

}
