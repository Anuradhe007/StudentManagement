package com.student.user;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.student.util.HibernateUtil;

public class IdDetailsManager {
	
private static IdDetailsManager idDetailsManager;
	
	private IdDetailsManager(){
		
	}
	
	public static IdDetailsManager getInstance(){
		if(idDetailsManager==null){
			idDetailsManager=new IdDetailsManager();
		}
		return idDetailsManager;
	}
	
	
	public IdDetails insertIdDetails(IdDetails idDetails){
		 Session session 	= null;
		 Transaction tx 	= null;
		 try{
		 session = HibernateUtil.getSession();
		 tx = session.beginTransaction();
		if(idDetails!=null){
			session.saveOrUpdate(idDetails);
		}
		 
		 System.out.println("idDetails>>"+idDetails.getId());
		 return idDetails;
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
		return null;
	}
	
	public List<IdDetails> getStudentDateRange(String fromDate,String toDate){
	       Session sess = HibernateUtil.getSession();
	       Transaction tx = sess.beginTransaction();
	       DateFormat formatter=null ; 
	       Date dateFrom=null ;
	       Date dateTo=null ;
	       List<IdDetails> detLst2=new ArrayList<IdDetails>();
	       try {        
	    	   
	       
	    //	formatter = new SimpleDateFormat("yyyy-MMM-dd");
	    //	dateFrom = (Date)formatter.parse(fromDate);
	    //	dateTo = (Date)formatter.parse(toDate);
	       	//String hql = "FROM IdDetails s WHERE s.createdTime>=:fromDate AND s.createdTime<=:toDate";
	       	//String hql =sess.createQuery("from IdDetails where createdTime>='"+fromDate+" 00:00:00"+"' AND createdTime<='"+toDate+" 00:00:00 '" );
	     //  	Query query = sess.createQuery(hql);
	      // 	query.setParameter("fromDate",dateFrom);
	      // 	query.setParameter("toDate",dateTo);
	       	//List<IdDetails> detLst = query.list();
	       	List<Object> detLst=sess.createQuery("from IdDetails where addmission='N' AND createdTime>='"+fromDate+" 00:00:00"+"' AND createdTime<='"+toDate+" 00:00:00'" ).list();
	       	System.out.println("detLst>"+detLst.size());
	           if(detLst!=null && detLst.isEmpty()){
	           	return null;
	           }else{
	        	   for(Object obj:detLst){
	        		   detLst2.add((IdDetails)obj);
	        	   }
	           	   return detLst2!=null && detLst2.size()>0 ?detLst2:null;
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
	
	public List<IdDetails> getAddmissionDateRange(String fromDate,String toDate){
	       Session sess = HibernateUtil.getSession();
	       Transaction tx = sess.beginTransaction();
	       DateFormat formatter=null ; 
	       Date dateFrom=null ;
	       Date dateTo=null ;
	       List<IdDetails> detLst2=new ArrayList<IdDetails>();
	       try {        
	    	   
	   
	       	List<Object> detLst=sess.createQuery("from IdDetails where addmission='Y' AND createdTime>='"+fromDate+" 00:00:00"+"' AND createdTime<='"+toDate+" 00:00:00'" ).list();
	       	System.out.println("detLst>"+detLst.size());
	           if(detLst!=null && detLst.isEmpty()){
	           	return null;
	           }else{
	        	   for(Object obj:detLst){
	        		   detLst2.add((IdDetails)obj);
	        	   }
	           	   return detLst2!=null && detLst2.size()>0 ?detLst2:null;
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
