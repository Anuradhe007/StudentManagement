package com.student.payment;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.student.DB.ExecuteData;
import com.student.admin.Attendence;
import com.student.util.HibernateUtil;


public class PaymentManager {

private static PaymentManager paymentManager;
	
	private PaymentManager(){
		
	}
	
	public static PaymentManager getInstance(){
		if(paymentManager==null){
			paymentManager=new PaymentManager();
		}
		return paymentManager;
	}
	
	public List<Payment> getPaymentByRegNoAndClasId(String regNo,String classId){
		 Session sess = HibernateUtil.getSession();
	     Transaction tx = sess.beginTransaction();
	       
	        try {        
	        	String hql = "FROM Payment s WHERE s.regNo=:regNo AND s.classId=:classId";
	        	Query query = sess.createQuery(hql);
	        	query.setParameter("regNo",regNo);
	        	query.setParameter("classId",classId);
	        	List<Payment> pmntLst = query.list();
	            if(pmntLst==null || pmntLst.isEmpty()){
	            	return null;
	            }else{
	            	return pmntLst;
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
	
	public boolean savePayment(String regNo,String classId, String fee,String payingMonth,String paidDate,String payYear){
		Session session 	= null;
		 Transaction tx 	= null;
		 try{
		 session = HibernateUtil.getSession();
		 tx = session.beginTransaction();
		 Payment payment=new Payment();
		 payment.setClassId(classId);
		 payment.setRegNo(regNo);
		 payment.setFee(Double.parseDouble(fee));
		 payment.setPaidDate(new Date(paidDate));
		 payment.setPaymentMonth(payingMonth);
		 payment.setPaymentYear(payYear);
		 session.saveOrUpdate(payment);
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
	
	public boolean isPaymentAlreadyDone(String regNo,String classId,String payingMonth,String payear){
		 Session sess = HibernateUtil.getSession();
	     Transaction tx = sess.beginTransaction();
	       
	        try {        
	        	String hql = "FROM Payment s WHERE s.regNo=:regNo AND s.classId=:classId AND s.paymentYear=:payear AND s.paymentMonth=:payingMonth";
	        	Query query = sess.createQuery(hql);
	        	query.setParameter("regNo",regNo);
	        	query.setParameter("classId",classId);
	        	query.setParameter("payear",payear);
	        	query.setParameter("payingMonth",payingMonth);
	        	List<Payment> pmntLst = query.list();
	            if(pmntLst==null || pmntLst.isEmpty()){
	            	return false;
	            }else{
	            	return true;
	            }
	        
	        } catch (Exception e) {
	        	 System.out.println("=Exception"+e);
	            e.printStackTrace();
	        } finally {
	            tx.commit();
	            sess.close();
	        }
	        return false;
	}
	
	public List<Payment> getPaymentByClasId(String classId){
		 Session sess = HibernateUtil.getSession();
	     Transaction tx = sess.beginTransaction();
	       
	        try {        
	        	String hql = "select distinct s FROM Payment s WHERE s.classId=:classId";
	        	Query query = sess.createQuery(hql);
	        	query.setParameter("classId",classId);
	        	List<Payment> pmntLst = query.list();
	            if(pmntLst==null || pmntLst.isEmpty()){
	            	return null;
	            }else{
	            	return pmntLst;
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
	
	public List<Payment> getPaymentByMonthAndYear(String year,String month){
		 Session sess = HibernateUtil.getSession();
	     Transaction tx = sess.beginTransaction();
	       
	        try {        
	        	//String hql = "select distinct s FROM Payment s WHERE s.classId=:classId";
	        	//String hql = "FROM payment where paymentMonth=:month AND paymentYear=:year group by classId";
	        	
	        	String hql = "SELECT sum(fee) As FEE , classId FROM Payment where payingMonth='"+month+"' And payingYear='"+year+"' group by classId ";
	        	
	        	Query query = sess.createQuery(hql);
	        	//query.setParameter("month",month);
	        	//query.setParameter("year",year);
	        	List<Object[]>  pmntLst = query.list();
	        	List<Payment> paymenyLst = new ArrayList();;
	        	Payment paymnt=null;
	            if(pmntLst==null || pmntLst.isEmpty()){
	            	return null;
	            }else{
	            	for(Object[] obj:pmntLst){
	            		paymnt=new Payment();
	            		paymnt.setFee(Double.parseDouble(obj[0].toString()));
	            		paymnt.setClassId(obj[1].toString());
	            		paymenyLst.add(paymnt);
	            	}
	            	return paymenyLst;
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
