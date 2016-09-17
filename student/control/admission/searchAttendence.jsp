<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.student.admin.ClassCategory"%>
<%@page import="com.student.admin.AttendenceManager"%>
<%@page import="com.student.user.StudentManager"%>
<%@page import="com.student.payment.PaymentManager"%>
<%@page import="com.student.payment.Payment"%>
<%@page import="com.student.admin.Attendence"%>
<%@ taglib prefix="tab" uri="http://ditchnet.org/jsp-tabs-taglib" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    		javax.servlet.*,
    		com.dialog.util.SystemLog.*"
    buffer="8kb"
    errorPage="/view/error.jsp"%>
    
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
		

		
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
 
  </head>

<body style="background-color:#CEE3F6;">
<!--  
<ul class="nav nav-tabs">
    <li><a data-toggle="tab" href="#Info">Student Info</a></li>
    <li><a data-toggle="tab" href="#Payment">Payment</a></li>
    <li><a data-toggle="tab" href="#Attendence">Attendance for This class</a></li>
  </ul>
-->
<%
String regNo = request.getParameter("regNo");
String classID = request.getParameter("classId");
List<ClassCategory>catList=null;
StudentManager studentManager=StudentManager.getInstance();
boolean isNotStuFound=false;
boolean isNotAtdFound=false;
Student student=null;
AttendenceManager attendenceManager=AttendenceManager.getInstance();
if(regNo!=null && classID!=null ){
	student=studentManager.getStudentByRegNo(regNo);
	 System.out.println("student>>>1"+student);
	if(student==null){
		isNotStuFound=true;
	}else{
		int attendence=attendenceManager.insertAttendence(student,classID);
		System.out.println("attendence>>>1"+attendence);
		if(attendence==3){
			isNotStuFound=true;
		}else{
			if(attendence==2){
				isNotAtdFound=true;
				request.setAttribute("isNotAtdFound", isNotAtdFound);
			}
			PaymentManager paymentManager=PaymentManager.getInstance();
			List<Payment> pmntList=paymentManager.getPaymentByRegNoAndClasId(regNo,classID);
			request.setAttribute("student", student);
			if(pmntList!=null){
				request.setAttribute("pmntList", pmntList);
			}
			List<Attendence>attdnceList=attendenceManager.getAllAttendenceByRegNoAndClasId(regNo,classID);
			if(attdnceList!=null){
				request.setAttribute("attdnceList", attdnceList);
			}
		}
	}
}

 if(student!=null && !isNotStuFound ){
%>
		  	<c:if test="${isNotAtdFound!=null && isNotAtdFound }">
		  	  You have already entered to this class!!!
		  	</c:if>
		  	
  <ul class="nav nav-tabs">
    <li><a data-toggle="tab" href="#Info">Student Info</a></li>
    <li><a data-toggle="tab" href="#Payment">Payment</a></li>
    <li><a data-toggle="tab" href="#Attendence">Attendance for This class</a></li>
  </ul>
</div>
  <div class="tab-content">
   
   <div id="Info" class="tab-pane fade">
      <table >
			<tr>
			    
			    <th>Full Name</th>
			    <th>&nbsp;</th>
			    <th>Email</th>
			    <th>&nbsp;</th>
			    <th>Reg No</th>
			    <th>&nbsp;</th>
			    <th>Gender</th>
		   </tr>
	  	   <tr>
	  		<td colspan="4"><img id="image1" src="/student/themes/default/images/common/sub_table_dot_div.gif" class="img-responsive center-block" ></td>
	  	   </tr>

	        <tr>
	          <td class="body-bold-text-10px">  ${student.fullName} </td>
	          <td>&nbsp;</td>
	          <td class="body-bold-text-10px">  ${student.email}  </td>
	          <td>&nbsp;</td>
	          <td class="body-bold-text-10px">  ${student.regNo}  </td>
	          <td>&nbsp;</td>
	          <td class="body-bold-text-10px">  ${student.lastName}  </td>
	        </tr>
	        <tr><td colspan="4">
	        <img src="/student/ProfPics/${student.regNo}.jpg" height="150" width="150"/>
	        </td></tr>
	  </table>
	  </div>
   
    <div id="Payment" class="tab-pane fade">
      <table>
			<tr>
			    <th>Class Id</th>
			    <th>&nbsp;</th>
			    <th>Payment Month</th>
			    <th>&nbsp;</th>
			    <th>Fee(LKR)</th>
			    <th>&nbsp;</th>
			    <th>Paid Date</th>
		   </tr>
		  <tr>
		  <td colspan="4"><img src="/student/themes/default/images/common/sub_table_dot_div.gif"></td>
		  </tr>
		  <c:if test="${pmntList!=null}">
			 <c:forEach var="payment" items="${pmntList}">
			        <tr>
			          <td class="body-bold-text-12px">${payment.classId}</td>
			           <td>&nbsp;</td>
			          <td class="body-bold-text-12px">${payment.paymentMonth}</td>
			           <td>&nbsp;</td>
			          <td class="body-bold-text-12px">${payment.fee} </td>
			           <td>&nbsp;</td>
			          <td class="body-bold-text-12px">${payment.paidDate}</td>
			        </tr>
			  </c:forEach>
		  </c:if>
       </table>
       </div>
      
    <div id="Attendence" class="tab-pane fade">
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
       </table></div>
</div>

<table >
 <tr>
 
 <td>&nbsp;</td>
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