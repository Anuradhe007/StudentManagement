package com.student.user;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.student.DB.DBCon;

public class SampleRegistration {
public String sampleregNoLocation(){
		
		String sql = "SELECT Location,Yer FROM sampleregno ";
		Connection con = null;
	    Statement st = null;
	    ResultSet rs = null;
	    boolean result = false;
	    ResultSet rst = null;
	    String location  = "";
	    try {
	        con = DBCon.getConnection();
	         st = con.createStatement();
	        rst =  st.executeQuery(sql);
	        while(rst.next()){
	       // System.out.println("************"+rst.getString("Location"));
	         location = rst.getString("Location");
	        }
	        con.close();

	    } catch (Exception ex) {
	        ex.printStackTrace();

	    } 
	    
	    return location;
		
	}
	

public String sampleregNoYear(){
	
	String sql = "SELECT Location,Yer FROM sampleregno ";
	Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    boolean result = false;
    ResultSet rst = null;
    String yer  = "";
    try {
        con = DBCon.getConnection();
         st = con.createStatement();
        rst =  st.executeQuery(sql);
        while(rst.next()){
       // System.out.println("************"+rst.getString("Location"));
         yer = rst.getString("Yer");
        }
        con.close();

    } catch (Exception ex) {
        ex.printStackTrace();

    } 
    
    return yer;
	
}

}
