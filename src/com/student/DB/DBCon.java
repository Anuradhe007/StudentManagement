package com.student.DB;

import java.sql.DriverManager;

import com.mysql.jdbc.Connection;

public class DBCon {
	
	
	public static Connection getConnection (){
		Connection connection = null;
		 try {  
	            Class.forName("com.mysql.jdbc.Driver");  
	            connection = (Connection) DriverManager.getConnection(  
	                    "jdbc:mysql://localhost:3306/student", "root", "");  
	         return connection;  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        } 
		 return connection;
	}

}
