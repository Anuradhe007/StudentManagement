package com.student.admin;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.student.exception.InvalidUserException;
import com.student.util.HibernateUtil;

public class MetaClassYearManager {

	
	 public List getCalssYears() throws Exception {
	        Session sess = HibernateUtil.getSession();
	        Transaction tx = sess.beginTransaction();
	        try {  
	       
	        	String sql ="from MetaClassYear";
	            List<ClassCategory> userList = sess.createQuery(sql).list();
	            if(userList.isEmpty())
	                throw new InvalidUserException("GN005", new Exception("No Records Available"));
	            else 
	            {
	            	return userList;
	            }
	            	
	                      
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	           
	            sess.close();
	        }
	        return null;
	    }
}
