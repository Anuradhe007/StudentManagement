package com.student.payment;

import com.student.DB.ExecuteData;

public class MyPayment {

	public boolean savePayment(String regNo,String classId, String fee,String payingMonth,String paidDate){
		boolean result = false;
		ExecuteData d = new ExecuteData();
		String sql = "INSERT INTO  payment  (RegNo, classId, fee, payingMonth, paidDate) VALUES ('"+regNo+"','"+classId+"','"+fee+"','"+payingMonth+"','"+paidDate+"')";
		result = d.updateMyData(sql);
		
		return result;
	}
	
	public boolean checkRegNoAvailable(String regNo){
		boolean result = false;
		String sql = "SELECT REGNO FROM studentinfo where REGNO='"+regNo+"'";
		ExecuteData d = new ExecuteData();
		if(d.getMyData(sql)==1){
			result = true;
		}
		return result;
	}
}
