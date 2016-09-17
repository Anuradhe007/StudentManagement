package com.student.exam;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.student.exception.InvalidUserException;
import com.student.user.Student;
import com.student.util.HibernateUtil;

public class MarksManager {

	
	 public void getStudentMarks(String regNo, String subject,String year) throws Exception {
	        Session sess = HibernateUtil.getSession();
	        Transaction tx = sess.beginTransaction();
	        try {  
	       
	        	String sql =" from Marks where m_year='"+year+"' and m_regNo='"+regNo+"' and m_subjectNo='"+subject+"'";
	            List<Object> userList = sess.createQuery(sql).list();
	            if(!userList.isEmpty())
	                throw new InvalidUserException("GN005", new Exception("No Records Available"));
	            else 
	            {
	            	int size = userList.size();
	            	Object [] row = new Object[size];
	            	for (int x=0;x<size;x++) {
	            	      row[x] = userList.get(x);          
	            	     String name = (String) row[0];             
	            	     Float price = (Float) row[1];
	            	}    
	            }
	            	
	            
	                
	        
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	           
	            sess.close();
	        }
	        
	    }
	 
}
