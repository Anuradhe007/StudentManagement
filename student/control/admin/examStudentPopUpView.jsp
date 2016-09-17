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
<tab:tabConfig />
</head>

<body>
<%
String regNo = request.getParameter("regNo");
String id=request.getParameter("classId");
List<ClassCategory>catList=null;
StudentManager studentManager=StudentManager.getInstance();
boolean isNotStuFound=false;
Student student=null;
AttendenceManager attendenceManager=AttendenceManager.getInstance();
if(regNo!=null){
	student=studentManager.getStudentByRegNo(regNo);
	 System.out.println("ididid>>>1"+id);
	if(student==null){
		isNotStuFound=true;
	}else{
		List<Attendence>attdnceList=attendenceManager.getAllAttendenceByRegNoAndClasId(regNo,id);
		if(attdnceList!=null){
			request.setAttribute("attdnceList", attdnceList);
		}
		
		PaymentManager paymentManager=PaymentManager.getInstance();
		List<Payment> pmntList=paymentManager.getPaymentByRegNoAndClasId(regNo,id);
		request.setAttribute("student", student);
		if(pmntList!=null){
			request.setAttribute("pmntList", pmntList);
		}
			
		
	}
}

 if(student!=null && !isNotStuFound ){
%>

<tab:tabContainer id="info-container">
	
	<tab:tabPane id="Info" tabTitle="Student Info">
	  <table >
			<tr>
			    <th>Last Name &nbsp;&nbsp;</th>
			    <th >Full Name</th>
			    <th>Email</th>
			    <th>Reg No</th>
		   </tr>
	  	   <tr>
	  		<td colspan="4"><img src="/student/themes/default/images/common/sub_table_dot_div.gif"></td>
	  	   </tr>

	        <tr>
	          <td class="body-bold-text-12px">${student.lastName} </td>
	          <td class="body-bold-text-12px">${student.fullName}</td>
	          <td class="body-bold-text-12px">${student.email} &nbsp;&nbsp;</td>
	          <td class="body-bold-text-12px">${student.regNo}</td>
	        </tr>
	        <tr><td>
	        <c:if test="${student.imgName!=null }">
	        <img src="/student/themes/default/images/${student.imgName}" alt="Smiley face" height="150" width="150"/>
	        </c:if>
	        </td></tr>
	        <tr>
	        <td>
	        <td>&nbsp;<a id="popupBoxClose" onclick="unload()"><u>Close</u></a></td>
	        </td>
	        </tr>
	  </table>
	</tab:tabPane>

	<tab:tabPane id="Payment" tabTitle="Payment">
		<table >
			<tr>
			    <th>Class Id &nbsp;&nbsp;</th>
			    <th >Payment Month &nbsp;&nbsp;</th>
			    <th>Fee(LKR)</th>
			    <th>Paid Date</th>
		   </tr>
		  <tr>
		  <td colspan="4"><img src="/student/themes/default/images/common/sub_table_dot_div.gif"></td>
		  </tr>
		  <c:if test="${pmntList!=null}">
			 <c:forEach var="payment" items="${pmntList}">
			        <tr>
			          <td class="body-bold-text-12px">${payment.classId}</td>
			          <td class="body-bold-text-12px">${payment.paymentMonth}</td>
			          <td class="body-bold-text-12px">${payment.fee} </td>
			          <td class="body-bold-text-12px">${payment.paidDate}</td>
			        </tr>
			  </c:forEach>
		  </c:if>
		  <tr>
	        <td>
	        <td>&nbsp;<a id="popupBoxClose" onclick="unload()"><u>Close</u></a></td>
	        </td>
	        </tr>
       </table>
	</tab:tabPane>
	<tab:tabPane id="Attendence" tabTitle="Attendence for This class">
		<table >
			<tr>
			    <th>Class Id </th>
			    <th >Attendence Date/Time</th>
		   </tr>
		  <tr>
		  <td colspan="4"><img src="/student/themes/default/images/common/sub_table_dot_div.gif"></td>
		  </tr>
		  <c:if test="${attdnceList!=null}">
			 <c:forEach var="attendence" items="${attdnceList}">
			        <tr>
			          <td class="body-bold-text-12px">${attendence.classId}</td>
			          <td class="body-bold-text-12px">${attendence.attendTime}</td>
			        </tr>
			  </c:forEach>
		  </c:if>
		  <tr>
	        <td>
	        <td>&nbsp;<a id="popupBoxClose" onclick="unload()"><u>Close</u></a></td>
	        </td>
	        </tr>
       </table>
	</tab:tabPane>
</tab:tabContainer>
<table >
 <tr>
 
 
 <td>&nbsp;</td>
 <td>&nbsp;</td>
 </tr>
</table>
<%}else if(isNotStuFound){%>
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