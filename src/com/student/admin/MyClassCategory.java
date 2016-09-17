package com.student.admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.student.DB.DBCon;

public class MyClassCategory {
	
	
	public String[] getClassCategory (){
		
		String sql = "SELECT classId FROM classcategory ";
		String [] myId = null;
		Connection con = null;
	    Statement st = null;
	    ResultSet rs = null;
	    boolean result = false;
	    ResultSet rst = null;


	    try {
	        con = DBCon.getConnection();
	        st = con.createStatement();
	       rst =  st.executeQuery(sql);
	      
	      
	       System.out.println("======Row  d Count===="+rst.getRow());
	       myId = new String[10];
	       int x = 0;
	       while(rst.next()){
	    	 myId[x] =  rst.getString("classId");
	    	 x++;
	       }
	      con.close();

	    } catch (Exception ex) {
	        ex.printStackTrace();

	    } 
	    
	    return myId;
		
	}
	
	
	
public String getClassFee (String classId){
		
		String sql = "SELECT Fee FROM classcategory where classId='"+classId+"'";
		String fee = null;
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
	    	fee =  rst.getString("Fee");
	    	
	      con.close();

	    } catch (Exception ex) {
	        ex.printStackTrace();

	    } 
	    
	    return fee;
		
	}

}
