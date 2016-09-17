package com.student.user;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import com.student.util.*;
import com.student.exception.*;



public class UserManager {
	
	
	 public User validateUser(String userName, String password) throws Exception {
		 
		 Session sess = HibernateUtil.getSession();
		 
	     Transaction tx =    sess.beginTransaction();
	       
	        try {            
	            List<Object> userList = sess.createQuery("from User where m_userName='"+userName+"' and m_password='"+password+"'").list();
	            if(userList.isEmpty())
	                throw new InvalidUserException("GN005", new Exception("Invalid username or password"));
	            else 
	                return (User)userList.get(0);
	        } catch (InvalidUserException e) {
	            throw e;
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            tx.commit();
	            sess.close();
	        }
	        return null;
	    }
	    
public User validateUserRole(String userName, String password) throws Exception {
		 
		 Session sess = HibernateUtil.getSession();
		 
	     Transaction tx =    sess.beginTransaction();
	       
	        try {            
	            List<Object> userList = sess.createQuery("from User where m_userName='"+userName+"' and m_password='"+password+"'").list();
	            if(userList.isEmpty())
	                throw new InvalidUserException("GN005", new Exception("Invalid username or password"));
	            else {
	            	return (User)userList.get(0);
	            }
	                
	                
	        } catch (InvalidUserException e) {
	            throw e;
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            tx.commit();
	            sess.close();
	        }
	        return null;
	    }
	    

}
