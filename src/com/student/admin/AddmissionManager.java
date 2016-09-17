package com.student.admin;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.student.util.HibernateUtil;

public class AddmissionManager {
	
private static AddmissionManager addmissionManager;
	
	private AddmissionManager(){
		
	}
	
	public static AddmissionManager getInstance(){
		if(addmissionManager==null){
			addmissionManager=new AddmissionManager();
		}
		return addmissionManager;
	}
	
	
	public Addmission InsertAdmission(Addmission addmission)  {
		 Session session 	= null;
		 Transaction tx 	= null;
		 try{
		 session = HibernateUtil.getSession();
		 tx = session.beginTransaction();
		 if(addmission!=null){
			 session.saveOrUpdate(addmission);
			 return addmission;
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
		return null;
	}
	
	
	public List<Addmission> getAddmissionByStuIdAndExam(String stuId,int examNo ){
	    Session sess = HibernateUtil.getSession();
        Transaction tx = sess.beginTransaction();
       
        try {        
        	
        	String hql = "FROM Addmission s WHERE s.student.id=:stuId AND s.exam.id=:examNo";
        	Query query = sess.createQuery(hql);
        	query.setParameter("stuId",stuId);
        	query.setParameter("examNo",examNo);
        	List<Addmission> atdList = query.list();
        	System.out.println("AddmissionLst>>"+atdList.size());
            if(atdList.isEmpty()){
            	return null;
            }else{
            	return atdList;
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
	
	
	public List<Addmission> getExistingAddmissions()  { 
		Session sess = HibernateUtil.getSession();
	    Transaction tx = sess.beginTransaction();
	    List<Addmission> detLst2=new ArrayList<Addmission>();
	    try {        
	    	int year = Calendar.getInstance().get(Calendar.YEAR);
	    	int month=Calendar.getInstance().get(Calendar.MONTH);
	    	int date=Calendar.getInstance().get(Calendar.DATE);
	    	String mnthStr=null;
	    	String dateStr=null;
	    	if(month<10){
	    		mnthStr="0"+month;
	    	}else{
	    		mnthStr=new Integer(month).toString();
	    	}
	    	
	    	if(date<10){
	    		dateStr="0"+date;
	    	}else{
	    		dateStr=new Integer(date).toString();
	    	}
	    	List<Object> detLst=sess.createQuery("from Addmission where exam.examDate>='"+year+"-"+mnthStr+"-"+dateStr+"'").list();
	    	System.out.println("detLst>>"+detLst);
	        if(detLst==null || detLst.isEmpty()){
	        	return null;
	        }else{
	     	   for(Object obj:detLst){
	     		   detLst2.add((Addmission)obj);
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
