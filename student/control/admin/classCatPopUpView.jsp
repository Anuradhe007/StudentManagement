<%@page import="com.student.admin.ClassCategoryManager"%>
<%@page import="com.student.admin.ExamManager"%>
<%@page import="com.student.admin.Exam"%>
<%@page import="com.student.user.StudentManager"%>
<%@page import="com.student.user.Student"%>
<%@page import="com.student.payment.PaymentManager"%>
<%@page import="com.student.payment.Payment"%>
<%@page import="com.student.admin.Attendence"%>
<%@page import="com.student.admin.AttendenceManager"%>
<%@ taglib prefix="tab" uri="http://ditchnet.org/jsp-tabs-taglib" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.student.admin.ClassCategory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.util.*,
    		com.student.user.*,
    		com.student.exception.*"
    errorPage="/view/error.jsp"		
    buffer="8kb"%>
    <%
    User user = (User)session.getAttribute("user");
    if((user==null) || (user.getUserName()==null)) {
        throw new UserVerificationException(new Exception("You are not logged in"),"/student/view/login/login.html");
    }    
    
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
		

		
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<script type="text/javascript">
function unload(){
	unloadPopupBox();
}
function unloadPopupBox() {    // TO Unload the Popupbox
    $('#popup_box').fadeOut("slow");
    $('#popup_box').hide();
    
}   
</script>
</head>

<body>
<%
String id=request.getParameter("classId");
ClassCategory cat=null;
Student student=null;
ClassCategoryManager classCategoryManager=ClassCategoryManager.getInstance();
if(id!=null){
	cat=classCategoryManager.getCategoryByClasId(id);
	
}

 if(cat!=null){
%>

<table >
			<tr>
			    <th>Class Id </th>
			    <th >Lecture Name</th>
			    <th >Subject</th>
		   </tr>
		  <tr>
		  <td colspan="4"><img src="/student/themes/default/images/common/sub_table_dot_div.gif"></td>
		  </tr>
		  <c:if test="${cat!=null}">
			        <tr>
			          <td class="body-bold-text-12px">${cat.classId}</td>
			          <td class="body-bold-text-12px">${cat.lectureName}</td>
			          <td class="body-bold-text-12px">${cat.subject}</td>
			        </tr>
		  </c:if>
		  <tr>
	        <td>
	        <td>&nbsp;<a id="popupBoxClose" onclick="unload()"><u>Close</u></a></td>
	        </td>
	        </tr>
       </table>
<%}else {%>
 <table>
 <tr>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>Student is Not found for the entered Reg No!!!!! </td>
 </tr>
 </table>

<%} %>

</body>
</html>