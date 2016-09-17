<%@page import="com.student.user.StudentManager"%>
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

<script type="text/javascript">


$(document).ready(function(){
	 $("#loadingDIV").hide();
 
 
});


 function apply(){
		$("#loadingDIV").show();
	 var names = [];
	 $('input:checked').each(function() {
		    names.push(this.value);
	 });
	  $.post("studentCardGenerator.jsp",{ 'stuID': names}, function(data) {
		 
		  	$("#showReslt").html(data);
			$("#loadingDIV").hide();
	   });  
	  
	  
	  
	  
	 
 }
 
  $('#select-all').click(function(event) {   
	    if(this.checked) {
	        // Iterate each checkbox
	        $(':checkbox').each(function() {
	            this.checked = true;                        
	        });
	    }else{
	    	 $(':checkbox').each(function() {
		            this.checked = false;                        
		        });
	    }
	}); 
 
	
</script>


<%
String regNo = request.getParameter("regNo");
StudentManager studentManager = StudentManager
			.getInstance();
	List<Student> stuLst = studentManager
			.getStudentByID(regNo);
	
	request.setAttribute("stuLst", stuLst);
%>

<c:choose>
	<c:when test="${stuLst==null}">
		Student is not found..
	</c:when>
	<c:otherwise>
	<table  bgcolor="#CEE3F6" width="800">
	<tr>
    <td class="body-bold-text-12px">Last Name</td>
    <td class="body-bold-text-12px">Full Name</td>
    <td class="body-bold-text-12px">Email</td>
    <td class="body-bold-text-12px">Reg No</td>
    <td class="body-bold-text-12px"><input type="checkbox" name="select-all" id="select-all" value="0"/></td>
  </tr>
  <tr>
  <td colspan="4"><img src="/student/themes/default/images/common/sub_table_dot_div.gif"></td>
  </tr>
	<c:forEach var="student" items="${stuLst}">
	        <tr>
	          <td class="body-bold-text-12px">${student.lastName}</td>
	          <td class="body-bold-text-12px">${student.fullName}</td>
	          <td class="body-bold-text-12px">${student.email} </td>
	          <td class="body-bold-text-12px">${student.regNo}</td>
	          <td class="body-bold-text-12px"><input type="checkbox" name="stuChkbx" id="stuChkbx_${student.id}" value="${student.regNo}" /></td>
	        </tr>
	 </c:forEach>
	 <tr>
	 	<td colspan="3" >
	 	 <input type="button" onclick="apply()" value="generateID"/>
	</c:otherwise>
</c:choose>
	 	</td>
	 </tr>
	 <tr><td><div align="left" id="loadingDIV"><img src="/student/themes/default/images/common/emailLoad.gif" alt="Loading..."></div></td></tr>
 </table>
