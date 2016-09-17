<%@page import="com.student.admin.ClassCategoryManager"%>
<%@page import="com.student.admin.ExamManager"%>
<%@page import="com.student.admin.AddmissionManager"%>
<%@page import="com.student.admin.Exam"%>
<%@page import="com.student.payment.Payment"%>
<%@page import="com.student.user.StudentManager"%>
<%@page import="com.student.util.AddmissionGenerater"%>
<%@page import="com.student.admin.Addmission"%>
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
List<Addmission>admList=  AddmissionManager.getInstance().getExistingAddmissions();

if(admList!=null && admList.size()>0){
	AddmissionGenerater.getPdf(admList);
	%>
	
	Your PDF file is save as <%=AddmissionGenerater.getDateStr() %> .
<%}else{%>
	No Students Found!!!!
<%} %>



