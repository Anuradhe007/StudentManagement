<%@page import="com.student.admin.ClassInfoManager"%>
<%@page import="com.student.admin.ClassInfo"%>
<%@page import="com.student.exam.MyMarks"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.util.*,
    		com.student.user.*,
    		com.student.exception.*,
    		com.dialog.util.SystemConfig,
    		com.dialog.util.exception.SystemError,
    		com.student.admin.ClassInfo,
    		com.student.admin.ClassInfoManager,
    		java.net.URLEncoder,
    		sun.misc.BASE64Encoder,
    		java.security.MessageDigest,
    		javax.servlet.*,
    		com.dialog.util.SystemLog.*"
    buffer="8kb"
    errorPage="/view/error.jsp"%>
    
<%

String action = request.getParameter("action");


if(action.equalsIgnoreCase("saveClassInfo")){
	
	System.out.println("================================================1");
	String regID   = "";

	String discription = request.getParameter("discription");
	String subject = request.getParameter("subject");
	String stream 		= request.getParameter("stream");
	String year	= request.getParameter("year");
	String day = request.getParameter("day");
	String startTime	= request.getParameter("startTime");
	String endTime    = request.getParameter("endTime");
	String classType    = request.getParameter("classType1");
	
	//System.out.println("DESCRIPTION"+discription);
	//System.out.println("SUBJECT"+subject+","+stream+","+year+","+day+","+startTime+","+endTime+","+classType);
	
    try {
    	
    	 ClassInfo classInfo = new ClassInfo();
    	
    	classInfo.setClassId("CS_2016");
    	classInfo.setDescription(discription);
    	classInfo.setSubject(subject);
    	classInfo.setStream(stream);
    	classInfo.setRegYear(year);
    	classInfo.setWeekDay(day);
    	classInfo.setStartTime(startTime);
    	classInfo.setEndTime(endTime);
    	classInfo.setClassType(classType);
    	
    	System.out.println("DESCRIPTION "+discription);
    	System.out.println("SUBJECT "+subject+","+stream+","+year+","+day+","+startTime+","+endTime+","+classType);
    	
    	
    	ClassInfoManager.getInstance().saveClassInfo(classInfo);
       	request.setAttribute("msg", "Successfully Registered!");
    	
    	//response.sendRedirect("/student/view/NewFile.html");
    	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/admin/classInfoResp.jsp");
		rd.forward(request, response);
		
    }
 	catch(Exception e) {
	    e.printStackTrace();
	   
    	//SystemLog.getInstance().getLogger("EVENT").info("login,after_validate,"+nic+",ERR,"+msg);
    	//SystemLog.getInstance().getLogger("EVENT").error("login,after_validate,"+nic+",ERR,"+msg,e);
	   
    }
	
	
	
}



%>