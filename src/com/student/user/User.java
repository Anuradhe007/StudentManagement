package com.student.user;

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

@Entity
@Table(name="users")
public class User implements Serializable {
	
	
	
	
	 @Id
	 @Column(name="USERNAME", unique=true, insertable=false, updatable=false)
	private String m_userName;
	
	@Column(name="PASSWORD")
	private String m_password;
	
	@Column(name="CREATEDBY")
	private String m_createdBy;
	   
	@Column(name="USERROLE")
	private String m_userRole;
	   
	@Column(name="CDATE")
	private Date m_cDate;
	
	
	
	
	public String getUserName() {
		return m_userName;
	}
	public void setUserName(String userName) {
		this.m_userName = userName;
	}
	public String getPassword() {
		return m_password;
	}
	public void setPassword(String password) {
		this.m_password = password;
	}
	public String getCreatedBy() {
		return m_createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.m_createdBy = createdBy;
	}
	public String getUserRole() {
		return m_userRole;
	}
	public void setUserRole(String userRole) {
		this.m_userRole = userRole;
	}
	public Date getcDate() {
		return m_cDate;
	}
	public void setcDate(Date cDate) {
		this.m_cDate = cDate;
	}
	
	
	
	

}
