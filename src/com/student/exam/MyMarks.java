package com.student.exam;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.student.DB.DBCon;
import com.student.DB.ExecuteData;

public class MyMarks {
	
	
	public boolean saveExamMarks(String regNo,String classId, String examNo,double marks){
		boolean result = false;
		ExecuteData d = new ExecuteData();
		String sql = "INSERT INTO exam_marks(RegNo, classId, examNo, marks) VALUES ('"+regNo+"','"+classId+"','"+examNo+"','"+marks+"')";
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

	public String[] getExamNo (){
		
		String sql = "SELECT examNo FROM exam_marks group by examNo";
		String[] exam = null;
		Connection con = null;
	    Statement st = null;
	    ResultSet rs = null;
	    boolean result = false;
	    ResultSet rst = null;
	    try {
	        con = DBCon.getConnection();
	         st = con.createStatement();
	        rst =  st.executeQuery(sql);
	        exam = new String[100];
	      int x = 0;
	       while(rst.next()){
	    	exam[x] = rst.getString("examNo");
	    	 x++;
	       }
	      con.close();

	    } catch (Exception ex) {
	        ex.printStackTrace();

	    } 
	    
	    return exam;
		
	}
			public String getAvgMarks(String classId,String examNo){
				String result = "";
				String sql = "SELECT avg(marks) FROM exam_marks where classId='"+classId+"' and examNo='"+examNo+"'";
				 ResultSet rst = null;
				 Connection con = null;
				 Statement st = null;
				    try {
				        con = DBCon.getConnection();
				         st = con.createStatement();
				        rst =  st.executeQuery(sql);
				     while(rst.next()){
				    	result = rst.getString(1);
				    	 
				       }
				      con.close();

				    } catch (Exception ex) {
				        ex.printStackTrace();

				    } 
				    
				    return result;
			}
			
			public ArrayList<String> getExams() {
				//MyMarks mail = new MyMarks();
				//String classId = mail.getClassId(className);
				String sql = "SELECT examnumber FROM exams";
				ArrayList<String> examList = new ArrayList<String>();
				Connection con = null;
			    Statement st = null;
			    ResultSet rst = null;


			    try {
			        con = DBCon.getConnection();
			        st = con.createStatement();
			       rst =  st.executeQuery(sql);
			      
			      
			      while(rst.next())
			    	  examList.add(rst.getString("examnumber"));
			    	
			      con.close();

			    } catch (Exception ex) {
			        ex.printStackTrace();

			    } 
			    return examList;
			}
			
			public String getClassId(String className) {
				 String sql = "SELECT id FROM classcategory where classId='"+className+"'";
					String classId = null;
					Connection con = null;
				    Statement st = null;
				    ResultSet rst = null;


				    try {
				        con = DBCon.getConnection();
				        st = con.createStatement();
				       rst =  st.executeQuery(sql);
				      
				      
				      while(rst.next())
				    	  classId =  rst.getString("id");
				    	
				      con.close();

				    } catch (Exception ex) {
				        ex.printStackTrace();

				    } 
				    return classId;
			 }
			/*
			public static void main (String aaa[]) throws SQLException{
				MyMarks mail = new MyMarks();
				//boolean check = mail.mailSend("gmherath@gmail.com","Student Registration","You successfully registered", "E:\\oui_mem_leak.txt");
				//if(check){
					//System.out.println("Successfully  sent .....");
				//}
				 
				System.out.println(mail.getExams("Physics_2014"));
				//System.out.println(mail.getStudentId(a));
				//System.out.println(mail.getStudentEmail(mail.getStudentId(a)));
				//System.out.println(mail.sendEmailGroup(mail.getStudentEmail(mail.getStudentId(a)), "Test","Test", "C://Users/Prabhath/Downloads/bird.jpg"));
			} */
}
