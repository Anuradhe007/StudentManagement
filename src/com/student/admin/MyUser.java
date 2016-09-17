package com.student.admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.student.DB.DBCon;
import com.student.DB.ExecuteData;

public class MyUser {
	
public String checkUserName (String userName){
		
		String sql = "SELECT USERNAME FROM users where USERNAME='"+userName+"'";
		String uname = "No";
		Connection con = null;
	    Statement st = null;
	    ResultSet rs = null;
	    boolean result = false;
	    ResultSet rst = null;


	    try {
	        con = DBCon.getConnection();
	        st = con.createStatement();
	       rst =  st.executeQuery(sql);
	      
	      
	      while(rst.next())
	    	  uname =  rst.getString("USERNAME");
	    	
	      con.close();

	    } catch (Exception ex) {
	        ex.printStackTrace();

	    } 
	    
	    return uname;
		
	}

public boolean createUsers(String userName,String password, String userRole ,String createdBy){
	boolean result = false;
	ExecuteData d = new ExecuteData();
	String sql = "INSERT INTO users (USERNAME, `PASSWORD`, USERROLE, CREATEDBY, CDATE) VALUES ('"+userName+"','"+password+"','"+userRole+"','"+createdBy+"',curdate())";
	result = d.updateMyData(sql);
	
	return result;
}

}


