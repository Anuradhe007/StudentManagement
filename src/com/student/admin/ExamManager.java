package com.student.admin;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.student.payment.Payment;
import com.student.payment.PaymentManager;
import com.student.user.Student;
import com.student.util.HibernateUtil;

public class ExamManager {
private static ExamManager examManager;
	
	private ExamManager (){
		
	}
	public static ExamManager getInstance(){
		if(examManager==null){
			examManager = new ExamManager();
		}
		return examManager;
	}
	
public List<Exam> getExistingExams()  { 
	Session sess = HibernateUtil.getSession();
    Transaction tx = sess.beginTransaction();
    List<Exam> detLst2=new ArrayList<Exam>();
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
    	List<Object> detLst=sess.createQuery("from Exam where examDate>='"+year+"-"+mnthStr+"-"+dateStr+"'").list();
    	System.out.println("detLst>>"+detLst);
        if(detLst==null || detLst.isEmpty()){
        	return null;
        }else{
     	   for(Object obj:detLst){
     		   detLst2.add((Exam)obj);
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

public Exam InsertExam(Exam exam)  {
	 Session session 	= null;
	 Transaction tx 	= null;
	 try{
	 session = HibernateUtil.getSession();
	 tx = session.beginTransaction();
	 if(exam!=null){
		 
		 session.saveOrUpdate(exam);
		 System.out.println("classCatesccccccsssss>>>"+exam.getExamNumber());
		 return exam;
	 }
	 
	 }
	 catch(Exception e){
		 tx.rollback();
		 e.printStackTrace();
		
	 }
	 finally{
		 tx.commit();
		 session.close();
	 }
	return null;
}

public ExamClass InsertExamClass(ExamClass examClass)  {
	 Session session 	= null;
	 Transaction tx 	= null;
	 try{
	 session = HibernateUtil.getSession();
	 tx = session.beginTransaction();
	 if(examClass!=null){
		 session.saveOrUpdate(examClass);
		 return examClass;
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

public List<Exam> getExamByExamNumber(String num)  { 
	Session sess = HibernateUtil.getSession();
    Transaction tx = sess.beginTransaction();
    try {        
    	//List<Object> detLst=sess.createQuery("from Exam where examnumber=:num).list();
    	String hql = "FROM Exam WHERE examnumber=:num";
    	Query query = sess.createQuery(hql);
    	query.setParameter("num",num);
    	List<Exam> ExamList = query.list();
        if(ExamList==null || ExamList.isEmpty()){
        	return null;
        }else{
     	   return ExamList;
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

public List<Exam> getExamByExamNumberAndId(String num,String id)  { 
	Session sess = HibernateUtil.getSession();
    Transaction tx = sess.beginTransaction();
    try {        
    	//List<Object> detLst=sess.createQuery("from Exam where examnumber=:num).list();
    	String hql = "FROM Exam WHERE examnumber=:num and id!=:id";
    	Query query = sess.createQuery(hql);
    	query.setParameter("num",num);
    	query.setParameter("id",id);
    	List<Exam> ExamList = query.list();
        if(ExamList==null || ExamList.isEmpty()){
        	return null;
        }else{
     	   return ExamList;
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

public Exam getExamByExamId(String id)  { 
	Session sess = HibernateUtil.getSession();
    Transaction tx = sess.beginTransaction();
    try {        
    	//List<Object> detLst=sess.createQuery("from Exam where examnumber=:num).list();
    	int idInt=Integer.parseInt(id);
    	String hql = "FROM Exam WHERE id=:id";
    	Query query = sess.createQuery(hql);
    	query.setParameter("id",idInt);
    	List<Exam> ExamList = query.list();
        if(ExamList==null || ExamList.isEmpty()){
        	return null;
        }else{
     	   return ExamList.get(0);
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


public boolean deleteExamById(String idStr)  {
	 Session session 	= null;
	 Transaction tx 	= null;
	 try{
	 session = HibernateUtil.getSession();
	 tx = session.beginTransaction();
	 int idInt=(Integer.parseInt(idStr));
	 String hql = "DELETE Exam WHERE id=:idInt";
	 Query query = session.createQuery(hql);
    query.setParameter("idInt",idInt);
    query.executeUpdate();
	 return true;
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
	return false;
}

public List<Payment> getPaymentByExamNo(String examNo)  { 
	Session sess = HibernateUtil.getSession();
    Transaction tx = sess.beginTransaction();
    try {        
    	Exam exam=null;
    	String classId=null;
    	List<Exam>exams=getExamByExamNumber(examNo);
    	if(exams!=null && exams.get(0)!=null){
    		exam=exams.get(0);
    	}
    	if(exam==null){
    		return null;
    	}
    	
    	if(exam.getClassCategory()==null){
    		return null;
    	}
    	classId=exam.getClassCategory().getClassId();
    	
    	
    	
    	
    	String[] monthName = {"January", "February",
    			  "March", "April", "May", "June", "July",
    			  "August", "September", "October", "November",
    			  "December"
    			  };
    	
    	  Calendar cal = Calendar.getInstance();
    	  String month = monthName[cal.get(Calendar.MONTH)];
    	  System.out.println("classIdclassIdclassId>>"+classId);
    	//List<Object> detLst=sess.createQuery("from Exam where examnumber=:num).list();
    	//String hql = "SELECT DISTINCT payment.regNo  from Payment where classid="+classId+" and paidDate=(select max(paidDate) from Payment where classID="+classId+") ";
    	String hql = "select distinct p from Payment p where p.classid=:classId";
    	Query query = sess.createSQLQuery(hql);
    	query.setParameter("classId",classId);
    	List<Payment> paymntList = PaymentManager.getInstance().getPaymentByClasId(classId);
    	Set<Payment> paymntList2=new HashSet<Payment>();
    	
        if(paymntList==null || paymntList.isEmpty()){
        	return null;
        }else{
        	for(Payment p:paymntList){
        		paymntList2.add(p);
        	}
        	
     	   return  new ArrayList<Payment>(paymntList2);
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
