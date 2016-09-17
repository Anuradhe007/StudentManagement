<%@page import="com.student.user.StudentManager"%>
<%@page import="com.student.util.PDFGenerater"%>
<%@page import="com.student.user.Student"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.util.*,
    		com.student.user.*,
    		com.student.exception.*"
    errorPage="/view/error.jsp"		
    buffer="8kb"%><%
    User user = (User)session.getAttribute("user");
    if((user==null) || (user.getUserName()==null)) {
        throw new UserVerificationException(new Exception("You are not logged in"),"/student/view/login/login.html");
    }    
    
    //ArrayList<Location> locations = (ArrayList<Location>)request.getAttribute("locations");
   // locations = locations==null?new ArrayList<Location>():locations;
%>

<%
List<Student>stuList=new ArrayList();
Student stu=null;
String[] idArr = request.getParameterValues("stuID[]");

StudentManager stuManger=StudentManager.getInstance();
if(idArr!=null && idArr.length>0){
	for(String regNo:idArr){
		stu=stuManger.getStudentByRegNo(regNo);
		if(stu!=null){
			stuList.add(stu);
		}
	}
}
if(stuList!=null && stuList.size()>0){
	PDFGenerater.getPdf(stuList);
	%>
	
	Your PDF file is save as <%=PDFGenerater.getDateStr() %> .
<%}else{%>
	No Students Found!!!!
<%} %>



