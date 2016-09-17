package com.student.admin;

import org.hibernate.Session;
import org.hibernate.Transaction;


import com.student.util.HibernateUtil;

public class ClassInfoManager {
	
	public static ClassInfoManager calssInfoManager;
	
	private ClassInfoManager(){
		
	}
	
	public static ClassInfoManager getInstance(){
		if(calssInfoManager!=null){
			calssInfoManager = new ClassInfoManager();
		}
		return calssInfoManager;
	}
	
	 public String saveClassInfo(ClassInfo classInfo){
		 Session session 	= null;
		 Transaction tx 	= null;
		 String id		 	="1";
		 System.out.println("------------------------------1");
		 try{
		 session = HibernateUtil.getSession();
		 System.out.println("------------------------------2");
		 tx = session.beginTransaction();
		 System.out.println("------------------------------3");
		 session.saveOrUpdate(classInfo);
	    
		 System.out.println("------------------------------4");
		
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
	 

}
