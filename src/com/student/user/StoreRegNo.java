package com.student.user;
import java.io.Serializable;
public class StoreRegNo implements Serializable {
	private static String regNo;
	
	
	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}
	public String getRegNo() {
		return regNo;
	}
}
