package com.student.admin;

import java.sql.SQLException;

import com.mysql.jdbc.ResultSet;
import com.mysql.jdbc.Statement;
import com.student.DB.DBCon;

public class GenerateRegNo {
	public ResultSet getLocation(){
		ResultSet resultset = null;
		try {
			Statement statement = (Statement) DBCon.getConnection().createStatement();
			 resultset= (ResultSet) statement.executeQuery("SELECT Location FROM classlocation");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultset;
		
	}

}
