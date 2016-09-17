package com.student.user;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


import com.student.admin.Attendence;
import com.student.exception.InvalidUserException;
import com.student.util.HibernateUtil;

public class StudentManager {
	
	
	/**
	 * This method is used to insert student information 
	 * @param student
	 * @return
	 */
	public static StudentManager studentManager;
	
	private StudentManager (){
		
	}
	
	public String getName (){
		
		return "Veranga Sooriyabandara";
	}
	
	public static StudentManager getInstance(){
		if(studentManager==null){
			studentManager = new StudentManager();
		}
		return studentManager;
	}
	
	 public String saveStudentInfo(Student student){
		 Session session 	= null;
		 Transaction tx 	= null;
		 String id		 	= null;
		 String alYear  	= null;
		 try{
		 session = HibernateUtil.getSession();
		 tx = session.beginTransaction();
		 session.saveOrUpdate(student);
	     id = 	 student.getId();
		 System.out.println("Return ID "+id);
		 alYear = student.getAlYear();
		 }
		 catch(Exception e){
			 tx.rollback();
			 System.out.println("Error");
			 e.printStackTrace();
			
		 }
		 finally{
			 tx.commit();
			 session.close();
		 }
		 
		 return id;
	 }
	 
	
	 
	 
	 public Student checkNIC(String nic) throws Exception {
	        Session sess = HibernateUtil.getSession();
	        Transaction tx = sess.beginTransaction();
	        System.out.println("=================WITHIN check NIC Method");
	        try {            
	            List<Object> userList = sess.createQuery("from Student where nic='"+nic+"'").list();
	            if(!userList.isEmpty())
	                throw new InvalidUserException("GN005", new Exception("Your NIC already associated with the system"));
	            else 
	                return (Student)userList.get(0);
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
	 
	 
	 public boolean check(String nic){
		 
		 boolean result = false;
		 Session sess = HibernateUtil.getSession();
		 Transaction tx = sess.beginTransaction();
	     try{
	     List<Object> userList = sess.createQuery("from Student where nic='"+nic+"'").list();
	     if(userList.isEmpty()){
	    	 result =true;
	    	 return result;
	     }
	     
	     }
	     catch(Exception e){
	    	 e.printStackTrace();
	     }
	     finally {
	            tx.commit();
	            sess.close();
	     }
	     return result;
	 }
	 
	 
	 
	 
 public Student getID(String regNo) throws Exception {
		 
		 Session sess = HibernateUtil.getSession();
		 
	     Transaction tx =    sess.beginTransaction();
	       System.out.println(">>>>>>>>>>>>>>>>>>>"+regNo);
	        try {            
	            List<Object> userList = sess.createQuery("from Student where regNo='"+regNo+"'").list();
	            if(userList.isEmpty()){
	                throw new InvalidUserException("GN005", new Exception("Invalid username or password"));
	            }else {
	                return (Student)userList.get(0);
	            }
	        }catch (InvalidUserException e) {
	        	e.printStackTrace();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            tx.commit();
	            sess.close();
	        }
	        return null;
	    }
 
 public Student getStudentByRegNo(String regNo) {
	 
	 Session sess = HibernateUtil.getSession();
     Transaction tx =    sess.beginTransaction();
        try {       
        	String hql = "FROM Student WHERE regNo=:regNo";
        	Query query = sess.createQuery(hql);
        	query.setParameter("regNo",regNo);
        	List<Student> stuList = query.list();
            if(stuList==null || stuList.isEmpty()){
                return null;
        	}else{
        		return stuList.get(0);
        	}   
        }catch (Exception e) {
            e.printStackTrace();
        } finally {
            tx.commit();
            sess.close();
        }
        return null;
    }
 
   public List<String> getAllRegNo() {
	 
	 Session sess = HibernateUtil.getSession();
     Transaction tx =    sess.beginTransaction();
        try {       
        	List<String>regNoLst=sess.createSQLQuery("SELECT s.regNo FROM studentInfo s").list();
            if(regNoLst==null || regNoLst.isEmpty()){
                return null;
        	}else{
        		return regNoLst;
        	}   
        }catch (Exception e) {
            e.printStackTrace();
        } finally {
            tx.commit();
            sess.close();
        }
        return null;
    }
   
   public List<Student> getStudentByID(String regNo){
       Session sess = HibernateUtil.getSession();
       Transaction tx = sess.beginTransaction();
       try {        
       	String hql = "FROM Student s WHERE str(s.regNo) like :regNo";
       	Query query = sess.createQuery(hql);
       	query.setParameter("regNo",regNo+"%");
       	List<Student> userList = query.list();
           if(userList.isEmpty()){
           	return null;
           }else{
           	return userList;
           }
       
       } catch (Exception e) {
       	 System.out.println("=Exception"+e);
           e.printStackTrace();
       } finally {
           tx.commit();
           sess.close();
       }
       return null;
  }
   public Student getStudentByNIC(String nic){
       Session sess = HibernateUtil.getSession();
       Transaction tx = sess.beginTransaction();
       try {        
       	String hql = "FROM Student s WHERE s.nic=:nic";
       	Query query = sess.createQuery(hql);
       	query.setParameter("nic",nic);
       	List<Student> userList = query.list();
           if(userList==null || userList.isEmpty()){
           	return null;
           }else{
           	return userList.get(0);
           }
       
       } catch (Exception e) {
       	 System.out.println("=Exception"+e);
           e.printStackTrace();
       } finally {
           tx.commit();
           sess.close();
       }
       return null;
  }
   
 
}
