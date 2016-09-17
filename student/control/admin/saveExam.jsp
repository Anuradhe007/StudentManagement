<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.student.admin.ExamManager"%>
<%@page import="com.student.admin.Exam"%>
<%@page import="com.student.admin.ClassCategoryManager"%>
<%@page import="com.student.admin.ClassCategory"%>
<%@ taglib prefix="tab" uri="http://ditchnet.org/jsp-tabs-taglib" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.util.*,
    		com.student.user.*,
    		com.student.exception.*,
    		com.dialog.util.SystemConfig,
    		com.dialog.util.exception.SystemError,
    		java.net.URLEncoder,
    		sun.misc.BASE64Encoder,
    		java.security.MessageDigest,
    		java.text.SimpleDateFormat,
    		javax.servlet.*,
    		com.dialog.util.SystemLog.*"
    buffer="8kb"
    errorPage="/view/error.jsp"%>
    
		

<%
String action=request.getParameter("action");

ExamManager examManager=ExamManager.getInstance();
if(action!=null){
	if(action.equals("save")){
		String examNum = request.getParameter("examNum");
		List<Exam> examLst=examManager.getExamByExamNumber(examNum);
		
		if(examLst!=null && examLst.size()>0){  %>
			<p><b>Exam Number Is Already Available.please enter different exam number</b></p>
		<%}else{
			
			String description = request.getParameter("description");
			String startDate=request.getParameter("startDate");
			String startHour=request.getParameter("startHour");
			String startMin=request.getParameter("startMin");
			String endHour=request.getParameter("endHour");
			String endMin=request.getParameter("endMin");
			
			Exam exam=new Exam();
			
			exam.setDescription(description);
			Date startdate2 = new SimpleDateFormat("YYYY-mm-dd").parse(startDate);
			exam.setExamDate(startDate);
			exam.setExamStartTime(startHour+":"+startMin);
			exam.setExamEndTime(endHour+":"+endMin);
			exam.setExamNumber(examNum);
			String classID = request.getParameter("classId").toString();
			
			ClassCategoryManager classCategoryManager=ClassCategoryManager.getInstance();
			ClassCategory classCategory=classCategoryManager.getCategoryByClasId(classID);
			
			exam.setClassCategory(classCategory);
			
			if(classCategory!=null){
				examManager.InsertExam(exam);%>
				<p><b>Sucessfully added the exam..</b></p>
			<%} else{%>
			
				<p><b>Save Error !!! Please try again.</b></p>
			<% } %> 	
			
			
			
	<%	}
		
		//request.setAttribute("classCategory", classCategory);
	}else if(action.equals("edit")){
		
		String id = request.getParameter("id");
		String examNum = request.getParameter("examNum");
		List<Exam> examLst=examManager.getExamByExamNumberAndId(examNum,id);
		
		if(examLst!=null && examLst.size()>0){  %>
			<p><b>Exam Number Is Already Available.please enter different exam number</b></p>
		<%}else{
			
			String description = request.getParameter("description");
			String startDate=request.getParameter("startDate");
			String startHour=request.getParameter("startHour");
			String startMin=request.getParameter("startMin");
			String endHour=request.getParameter("endHour");
			String endMin=request.getParameter("endMin");
			 
			Exam exam=examManager.getExamByExamId(id);
			if(exam==null){
				exam=new Exam();
			}
			
			
			exam.setDescription(description);
			Date startdate2 = new SimpleDateFormat("YYYY-mm-dd").parse(startDate);
			exam.setExamDate(startDate);
			exam.setExamStartTime(startHour+":"+startMin);
			exam.setExamEndTime(endHour+":"+endMin);
			exam.setExamNumber(examNum);
						
			if(true){
				examManager.InsertExam(exam);%>
				<p><b>Sucessfully Updated the exam..</b></p>
			<%} else{%>
			<% } %> 	
			
			
			
	<%	}
		
		//request.setAttribute("classCategory", classCategory);
	
		
		
		
	}
}

%>

