package com.student.admin;

/**
 * Title		: Class Categroy
 * Description	: 
 * Copyright	: Copyright(c) 2012
 * Created on	: Nov 14, 2012
 * @author 		: Veranga Sooriyabandara
 * Comments		: 
 */

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.student.DB.ExecuteData;
import com.student.exception.InvalidUserException;
import com.student.user.StudentClass;
import com.student.util.HibernateUtil;

public class ClassCategoryManager {
	
	private static ClassCategoryManager m_classCategoryManager;
	
	private ClassCategoryManager (){
		
	}
	public static ClassCategoryManager getInstance(){
		if(m_classCategoryManager==null){
			m_classCategoryManager = new ClassCategoryManager();
		}
		return m_classCategoryManager;
	}

	 public List getClassCategory() throws Exception {
	        Session sess = HibernateUtil.getSession();
	        Transaction tx = sess.beginTransaction();
	        try {  
	       
	        	String sql ="from ClassInfo";
	            List<ClassCategory> userList = sess.createQuery(sql).list();
	            if(userList.isEmpty())
	                throw new InvalidUserException("GN005", new Exception("No Records Available"));
	            else 
	            {
	            	return userList;
	            }
	            	
	                      
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	           
	            sess.close();
	        }
	        return null;
	    }
	 
	 public List<ClassCategory> getAllClassCategory()  {
		    Session sess = HibernateUtil.getSession();
	        Transaction tx = sess.beginTransaction();
	       
	        try {        
	        	String hql = "FROM ClassCategory";
	        	Query query = sess.createQuery(hql);
	        	List<ClassCategory> catList = query.list();
	            if(catList==null || catList.isEmpty()){
	            	return null;
	            }else{
	            	return catList;
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
	 
	 public ClassCategory InsertClassCategory(String idStr,String lecName,String subject,String clasID,Double fee,String pamntCat,String endTime,String startTime)  {
		 Session session 	= null;
		 Transaction tx 	= null;
		 try{
		 session = HibernateUtil.getSession();
		 tx = session.beginTransaction();
		 ClassCategory classCategory=new ClassCategory();
		 if(idStr!=null && !idStr.equals("")){
			 classCategory=getCategoryById(idStr);
		 }
		// Date startdate = new SimpleDateFormat("YYYY-mm-dd").parse(startTime);
		// Date enddate = new SimpleDateFormat("YYYY-mm-dd").parse(endTime);
		// System.out.println("startdatestartdate>"+startdate.toString());
		 classCategory.setClassId(clasID);
		 classCategory.setFee(fee);
		 classCategory.setLectureName(lecName);
		 classCategory.setPaymentCategory(pamntCat);
		 classCategory.setSubject(subject);
		 classCategory.setEndTime(endTime);
		 classCategory.setStartTime(startTime);
		 session.saveOrUpdate(classCategory);
		 return classCategory;
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
	 
	 public boolean isClasIdAvailable(String clasID)  {
		 Session sess = HibernateUtil.getSession();
	        Transaction tx = sess.beginTransaction();
	       
	        try {        
	        	String hql = "FROM ClassCategory WHERE classId=:clasID";
	        	Query query = sess.createQuery(hql);
	        	query.setParameter("clasID",clasID);
	        	List<ClassCategory> clasCatList = query.list();
	            if(clasCatList==null || clasCatList.isEmpty()){
	            	return true;
	            }else{
	            	return false;
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
	 
	 public ClassCategory getCategoryById(String id)  {
		    Session sess = HibernateUtil.getSession();
	        Transaction tx = sess.beginTransaction();
	        
	        try {    
	        	int idInt=(Integer.parseInt(id));
	        	String hql = "FROM ClassCategory WHERE id=:clasID";
	        	Query query = sess.createQuery(hql);
	        	query.setParameter("clasID",idInt);
	        	List<ClassCategory> clasCatList = query.list();
	            if(clasCatList==null || clasCatList.isEmpty()){
	            	return null;
	            }else{
	            	return clasCatList.get(0);
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
	 
	 public ClassCategory getCategoryByClasId(String clasID)  {
		 Session sess = HibernateUtil.getSession();
	        Transaction tx = sess.beginTransaction();
	       
	        try {        
	        	String hql = "FROM ClassCategory WHERE classId=:clasID";
	        	Query query = sess.createQuery(hql);
	        	query.setParameter("clasID",clasID);
	        	List<ClassCategory> clasCatList = query.list();
	        	
	            if(clasCatList==null || clasCatList.isEmpty()){
	            	return null;
	            }else{
	            	System.out.println("clasCatList>>>"+clasCatList.get(0).getId());
	            	return clasCatList.get(0);
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
	 
	 public boolean deleteClassCategory(String idStr)  {
		 Session session 	= null;
		 Transaction tx 	= null;
		 try{
		 session = HibernateUtil.getSession();
		 tx = session.beginTransaction();
		 int idInt=(Integer.parseInt(idStr));
		 String hqlStuCls = "FROM StudentClass s WHERE s.classCategory.id=:idInt";
		 Query query = session.createQuery(hqlStuCls);
         query.setParameter("idInt",idInt);
         List<StudentClass> stuList = query.list();
         if(stuList!=null && stuList.size()>0){
        	 return false;
         }else{
        	 String hql = "DELETE ClassCategory WHERE id=:idInt";
    		 Query query2 = session.createQuery(hql);
             query2.setParameter("idInt",idInt);
             query2.executeUpdate();
    		 return true;
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
		return false;
	 }
	 
	 
	 public void getClassCategory(String regNo){
		 
		 System.out.println("VVVVVVVVVVVVVVVVVVVVVVV");
		 
		 
	 }
	 
	 
	 
	 public List<ClassCategory> getClassCategoryByStudent(String id)  {
		  
		 
		 
		  Session sess = HibernateUtil.getSession();
	      Transaction tx = sess.beginTransaction();
	      List<ClassCategory>catList2= new ArrayList<ClassCategory>();
	     
	        try {        
	        	String hql = "FROM ClassCategory";
	        	Query query = sess.createQuery(hql);
	        	List<ClassCategory>catList= query.list();
	            if(catList==null || catList.isEmpty()){
	            	System.out.println("catList is empty in class cat manager>>");
	            	return null;
	            }else{
	            	
	            	String hql2=null;
	            	Query query2=null;
	            	List<StudentClass>stucls=null;
	            	for(ClassCategory classCategory:catList){
	            		System.out.println("catList is empty in class cat manager 2>>"+classCategory. getId());
	            		hql2="FROM StudentClass where classCategory.id="+classCategory.getId() +" and student.id="+id;
	            		query2 = sess.createQuery(hql2);
	            		stucls=query2.list();
	            		if(stucls==null || stucls.size()<=0){
	            			catList2.add(classCategory);
	            		}
	            	}

	            	
	            }
	        
	        } catch (Exception e) {
	        	 System.out.println("=Exception"+e);
	            e.printStackTrace();
	        } finally {
	            tx.commit();
	            sess.close();
	        }
	        
	        return catList2!=null && catList2.size()>0 ?catList2 :null;
	    }
	 
	 public void saveStudentClass(String stuId,String classId)  {
		 System.out.println("class cat 3"+classId);
	      String []idArr=classId.split(",");
	      ExecuteData d =null;
	      System.out.println("class cat 4");
	      for(String id:idArr){
	    	  if(id!=null){
	    		  System.out.println("class cat 5");
	    		   d=new ExecuteData();
	    			String sql = "INSERT INTO student_class (classid, studentid) VALUES ('"+id+"','"+stuId+"')";
	    		    d.updateMyData(sql);
	    	  }
	      }
	    }
	 
}
