package com.student.user;

import java.util.List;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.student.util.HibernateUtil;


public class SearchManager{
	
	public static SearchManager searchManager;
	
	private SearchManager (){
		
	}
	
	public static SearchManager getInstance(){
		if(searchManager==null){
			searchManager = new SearchManager();
		}
		return searchManager;
	}
	
	
	 public List<Student> getStudentByNIC(String nic){
	        Session sess = HibernateUtil.getSession();
	        Transaction tx = sess.beginTransaction();
	       
	        try {        
	        	String hql = "FROM Student WHERE nic = :nic";
	        	Query query = sess.createQuery(hql);
	        	query.setParameter("nic",nic);
	        	System.out.println("nic>>"+nic);
	        	System.out.println(query.getQueryString());
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
	 
	 public List<Student> getStudentByName(String name){
	        Session sess = HibernateUtil.getSession();
	        Transaction tx = sess.beginTransaction();
	       
	        try {        
	        	String hql = "FROM Student s WHERE str(s.fullName) like :name";
	        	Query query = sess.createQuery(hql);
	        	query.setParameter("name",name+"%");
	        	System.out.println("nic>>"+name);
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
	 
	 public List<Student> getStudentByRegNo(String regNo){
	        Session sess = HibernateUtil.getSession();
	        Transaction tx = sess.beginTransaction();
	       
	        try {        
	        	String hql = "FROM Student s WHERE regNo =:regNo";
	        	Query query = sess.createQuery(hql);
	        	query.setParameter("regNo",regNo);
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
	

}
