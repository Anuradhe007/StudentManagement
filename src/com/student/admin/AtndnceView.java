package com.student.admin;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.student.DB.DBCon;
public class AtndnceView {
	
	public String getStId(String regNo) {
		 String sql = "SELECT ID FROM studentinfo where REGNO='"+regNo+"'";
			String classId = null;
			Connection con = null;
		    Statement st = null;
		    ResultSet rst = null;


		    try {
		        con = DBCon.getConnection();
		        st = con.createStatement();
		       rst =  st.executeQuery(sql);
		      
		      
		      while(rst.next())
		    	  classId =  rst.getString("ID");
		    	
		      con.close();

		    } catch (Exception ex) {
		        ex.printStackTrace();

		    } 
		    return classId;
	 }
	
	public ArrayList<String> getAttndDate(String id) {
		//MyMarks mail = new MyMarks();
		//String classId = mail.getClassId(className);
		String sql = "SELECT attendTime  FROM attendence where regNo='"+id+"'";
		ArrayList<String> examList = new ArrayList<String>();
		Connection con = null;
	    Statement st = null;
	    ResultSet rst = null;

	    ModelAtnd mdel = new ModelAtnd();

	    try {
	        con = DBCon.getConnection();
	        st = con.createStatement();
	       rst =  st.executeQuery(sql);
	      
	      
	      while(rst.next()) {
	    	  examList.add(rst.getString("attendTime"));
	    	 
	    	  
	      }
	    	  
	    	
	      con.close();

	    } catch (Exception ex) {
	        ex.printStackTrace();

	    } 
	    return examList;
	}
	public ArrayList<String> getAttndCls(String id) {
		//MyMarks mail = new MyMarks();
		//String classId = mail.getClassId(className);
		String sql = "SELECT classId  FROM attendence where regNo='"+id+"'";
		ArrayList<String> examList = new ArrayList<String>();
		Connection con = null;
	    Statement st = null;
	    ResultSet rst = null;

	    ModelAtnd mdel = new ModelAtnd();

	    try {
	        con = DBCon.getConnection();
	        st = con.createStatement();
	       rst =  st.executeQuery(sql);
	      
	      
	      while(rst.next()) {
	    	  examList.add(rst.getString("classId"));
	    	 
	    	  
	      }
	    	  
	    	
	      con.close();

	    } catch (Exception ex) {
	        ex.printStackTrace();

	    } 
	    return examList;
	}
/*	
	public static void main (String aaa[]) throws SQLException{
		AtndnceView mail = new AtndnceView();
		//boolean check = mail.mailSend("gmherath@gmail.com","Student Registration","You successfully registered", "E:\\oui_mem_leak.txt");
		//if(check){
			//System.out.println("Successfully  sent .....");
		//}
		 String a = mail.getStId("2016MA0019");
		System.out.println(a);
		
		for(ModelAtnd i : mail.getAttnd(a)){
			System.out.println(i.getDate());
		}
		//System.out.println(mail.getStudentId(a));
		//System.out.println(mail.getStudentEmail(mail.getStudentId(a)));
		//System.out.println(mail.sendEmailGroup(mail.getStudentEmail(mail.getStudentId(a)), "Test","Test", "C://Users/Prabhath/Downloads/bird.jpg"));
	} */

}
