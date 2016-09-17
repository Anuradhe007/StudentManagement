package com.student.user;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.student.util.HibernateUtil;

public class GenerateRegNoManager {

	
	private static GenerateRegNoManager manager ;
	
	private GenerateRegNoManager (){
		
	}
	
	public static GenerateRegNoManager getInstance(){
		
		if(manager==null){
			manager = new GenerateRegNoManager();
		}
		return manager;
	}
	
	
	/**
	 * 
	 * @param regNo  
	 * @return
	 */
	 public String generateRegNo(GenerateRegNo regNo){
		 Session session 	= null;
		 Transaction tx 	= null;
		 int id		 		= 0;
		 String yer		 	= null;
		 String symbol		= null;
		 try{
		 session 			= HibernateUtil.getSession();
		 tx 				= session.beginTransaction();
		 session.saveOrUpdate(regNo);
	     id 				= 	 regNo.getId();
	     yer 				= regNo.getYer();
	     symbol 			= regNo.getSymbol();
	     
		 
		 
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
		 
		 return yer+symbol+id;
	 }
}
