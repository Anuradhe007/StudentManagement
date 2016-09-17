
package com.student.admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.student.DB.DBCon;
import com.student.user.Student;
import com.student.util.HibernateUtil;

public class AttendenceManager {

	private static AttendenceManager attendenceManager;
	
	private AttendenceManager(){
		
	}
	
	public static AttendenceManager getInstance(){
		if(attendenceManager==null){
			attendenceManager=new AttendenceManager();
		}
		return attendenceManager;
	}
	
	
	
	
	public boolean checkAttendance(){
		
		
		return false;
	}
	
	public int insertAttendence(Student student,String classId){
		 Session session 	= null;
		 Transaction tx 	= null;
		 try{
		 session = HibernateUtil.getSession();
		 tx = session.beginTransaction();
		 
		 
		 Calendar dd= Calendar.getInstance();
		 dd.add(Calendar.HOUR, -2);
		 Date twentyDaysInFuture = dd.getTime();
		 Date noww=new Date();
		 Query query = session.createQuery("FROM Attendence x WHERE x.student.regNo='"+student.getRegNo()+"' AND x.attendTime > :endDate").setParameter("endDate", twentyDaysInFuture);
		 
		 
		 List<Attendence> atdList = query.list();
     	 System.out.println("atdListttttttttttttttttttttttttttt>>"+atdList.size());
         if(atdList.isEmpty()){
        	 Attendence attendence=new Attendence();
    		 attendence.setStudent(student);
    		 attendence.setClassId(classId);
    		 attendence.setAttendTime(new Date());
    		 session.saveOrUpdate(attendence);
    		 System.out.println("attendenceattendence>>"+attendence.getClassId());
    		 return 1;
         }else{
         	return 2;
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
		return 3;
	}
	
	public List<Attendence> getAllAttendenceByRegNoAndClasId(String regNo,String clasID ){
		    Session sess = HibernateUtil.getSession();
	        Transaction tx = sess.beginTransaction();
	       
	        try {        
	        	String hql = "FROM Attendence s WHERE s.student.regNo=:regNo AND s.classId=:clasID";
	        	Query query = sess.createQuery(hql);
	        	query.setParameter("regNo",regNo);
	        	query.setParameter("clasID",clasID);
	        	List<Attendence> atdList = query.list();
	        	System.out.println("atdList>>"+atdList.size());
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
	
	// Get data to generate attendance graph  ************************************************
	
	
	public List<Attendence> getAttendaceInfo(String clasID ){
	    Session sess = HibernateUtil.getSession();
        Transaction tx = sess.beginTransaction();
       
        try {        
        	String hql = "FROM Attendence s  where s.classId=:clasID group by substr(attendTIme,1,10)";
        	Query query = sess.createQuery(hql);
        	query.setParameter("clasID",clasID);
        	List<Attendence> atdList = query.list();
        	System.out.println("atdList>>"+atdList.size());
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
	
	
	
	
	
	
	public ResultSet  generateAttnGraph(String classId){
		 
		String sql = "SELECT count(regNo) as students, substr(attendTIme,6,6) as mydate FROM attendence where classId='"+classId+"' group by substr(attendTIme,1,10)";
		 ResultSet rst = null;
		 Connection con = null;
		 Statement st = null;
		    try {
		        con = DBCon.getConnection();
		         st = con.createStatement();
		        
		        rst =  st.executeQuery(sql);
		     
		      con.close();

		    } catch (Exception ex) {
		        ex.printStackTrace();

		    } 
		    
		    return rst;
		
	}
	
	
	
	public List<Attendence> getAttendenceByRegNoAndID(String regNo,String idStr ){
	    Session sess = HibernateUtil.getSession();
        Transaction tx = sess.beginTransaction();
       
        try {        
        	if(idStr==null){
        		return null;
        	}
        	int id=Integer.parseInt(idStr);
        	String hql = "FROM Attendence s WHERE s.student.regNo=:regNo AND s.id=:id";
        	Query query = sess.createQuery(hql);
        	query.setParameter("regNo",regNo);
        	query.setParameter("id",id);
        	List<Attendence> atdList = query.list();
        	System.out.println("atdList>>"+atdList.size());
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
	
	
	
	
	
	//**************************************************************************
}
