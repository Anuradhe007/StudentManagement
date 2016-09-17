package com.student.DB;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ExecuteData {
	
	
	
	public static boolean updateMyData (String sql){
	Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    boolean result = false;


    try {
        con = DBCon.getConnection();
        st = con.createStatement();
        st.execute(sql);
        result = true;
        con.close();

    } catch (Exception ex) {
        ex.printStackTrace();

    } 
    
    return result;
}

	

	public static int getMyData (String sql){
	Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    int result = 0;


    try {
        con = DBCon.getConnection();
        st = con.createStatement();
        ResultSet rst = st.executeQuery(sql);
        rst.last();
        result = rst.getRow();
        con.close();

    } catch (Exception ex) {
        ex.printStackTrace();

    } 
    
    return result;
}
}
