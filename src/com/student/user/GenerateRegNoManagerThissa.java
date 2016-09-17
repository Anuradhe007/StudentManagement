package com.student.user;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.student.util.HibernateUtil;

public class GenerateRegNoManagerThissa {

	
	private static GenerateRegNoManagerThissa manager ;
	
	private GenerateRegNoManagerThissa (){
		
	}
	
	public static GenerateRegNoManagerThissa getInstance(){
		
		if(manager==null){
			manager = new GenerateRegNoManagerThissa();
		}
		return manager;
	}
	
	
	/**
	 * 
	 * @param regNo  
	 * @return
	 */
	 public String generateRegNo(GenerateRegNoThissa regNo){
		 Session session 	= null;
		 Transaction tx 	= null;
		 int id		 		= 0;
		 String yer		 	= null;
		 String symbol		= null;
		 String newId        = "";
		 try{
		 session 			= HibernateUtil.getSession();
		 tx 				= session.beginTransaction();
		 session.saveOrUpdate(regNo);
	     id 				= regNo.getId();
	     yer 				= regNo.getYer();
	     symbol 			= regNo.getSymbol();
	    
	     
		 if(id<10){
			newId = "000"+id;
		 }
		 else if(id<100){
			 newId = "00"+id;
		 }
		 
		 else if(id<1000){
			newId  = "0"+id; 
		 }
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
		 
		 return yer+symbol+newId;
	 }
}
