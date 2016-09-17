<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.student.admin.ExamManager"%>
<%@page import="com.student.admin.Exam"%>
<%@page import="com.student.admin.ClassCategoryManager"%>
<%@page import="com.student.admin.ClassCategory"%>
<%@page import="com.student.admin.Addmission"%>
<%@page import="com.student.admin.AddmissionManager"%>
<%@page import="com.student.user.StudentManager"%>
<%@page import="com.student.user.Student"%>
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
StudentManager studentManager=StudentManager.getInstance();
AddmissionManager addmissionManager=AddmissionManager.getInstance();
if(action!=null){
	if(action.equals("save")){
		String examNum = request.getParameter("examNo");
		String classId = request.getParameter("classId");
		String regNo = request.getParameter("regNo");
		System.out.println("action>>1");
		Exam exam=null;
		boolean error=false;
		List<Exam> examLst=examManager.getExamByExamNumber(examNum);
		System.out.println("action>>2"+examNum);
		if(examLst!=null && examLst.size()>0){
			exam=examLst.get(0);
		}
		if(exam==null){
			error=true;
		}
		if(!error){
			System.out.println("action>>3");
			Student stu=studentManager.getStudentByRegNo(regNo);
			System.out.println("action>>4"+stu);
			if(stu!=null){
				List<Addmission> admissionLst=addmissionManager.getAddmissionByStuIdAndExam(stu.getId(),exam.getId());
				if(admissionLst!=null && admissionLst.size()>0){%>
					<b>Already Added</b>
				<%}else{
					Addmission admission=new Addmission();
					admission.setStudent(stu);
					admission.setExam(exam);
					admission.setRegNo(regNo);
					addmissionManager.InsertAdmission(admission);%>
					<b>Added</b>
				
			<%	}
				
				
				%>
				
				
		<%	}
			
		}
			%>
					
			
			
			
	<%	
		
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

