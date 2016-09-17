package com.student.admin;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.student.DB.DBCon;

public class Password {
public boolean checkUserName (String userName){
		
		String sql = "SELECT USERNAME FROM users where USERNAME='"+userName+"'";
		String uname = "No";
		Connection con = null;
	    Statement st = null;
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
	    
	    if(uname.equals("No")) return false;
	    else return true;
	}

public boolean changePwd(String oldPwd, String newPwd, String uname) {
	String sql = "SELECT PASSWORD FROM users where USERNAME='"+uname+"'";
	String pwd = "No";
	boolean out = false;
	Connection con = null;
    Statement st = null;
    ResultSet rst = null;
    int updt;

    try {
        con = DBCon.getConnection();
        st = con.createStatement();
       rst =  st.executeQuery(sql);
      
      
      while(rst.next())
    	  pwd =  rst.getString("PASSWORD");
      con.close();
      
      System.out.println("pwd "+pwd);
    	if(pwd.equals(oldPwd)) {
    		sql = "UPDATE users SET PASSWORD='"+newPwd+"' WHERE USERNAME='"+uname+"'";
    		con = DBCon.getConnection();
            st = con.createStatement();
           updt =  st.executeUpdate(sql);
    		out=true;
    		con.close();
    	}

    } catch (Exception ex) {
        ex.printStackTrace();

    } 
    return out;
}
}
