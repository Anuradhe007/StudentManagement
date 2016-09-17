<%@page import="com.student.user.IdDetailsManager"%>
<%@page import="com.student.user.IdDetails"%>
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
 function apply(){
	 
	 var names = [];
	 $('input:checked').each(function() {
		    names.push(this.value);
	 });
	  $.post("studentCardGenerator.jsp",{ 'stuID': names}, function(data) {
	    	$('#showReslt').show();
			$("#showReslt").html(data);
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
String fromDate = request.getParameter("fromDate").toString();
String toDate = request.getParameter("toDate").toString();
String action=request.getParameter("action").toString();
IdDetailsManager idDetailsManager = IdDetailsManager
.getInstance();
if(action.equals("Y")){
	List<IdDetails> idLst = idDetailsManager.getAddmissionDateRange(fromDate,toDate);
	request.setAttribute("idLst", idLst);
}else{
	
	List<IdDetails> idLst = idDetailsManager.getStudentDateRange(fromDate,toDate);
	
	request.setAttribute("idLst", idLst);
}







%>

<c:choose>
	<c:when test="${idLst==null}">
		Student is not found..
	</c:when>
	<c:otherwise>
	<table bgcolor="#CEE3F6" width="800" >
	<tr>
    <td class="body-bold-text-12px">Created Time</td>
    <td class="body-bold-text-12px">File Name</td>
    <td class="body-bold-text-12px"></td>
  </tr>
  <tr>
  <td colspan="4"><img src="/student/themes/default/images/common/sub_table_dot_div.gif"></td>
  </tr>
	<c:forEach var="idDetails" items="${idLst}">
	        <tr>
	          <td class="body-bold-text-12px">${idDetails.createdTime}</td>
	          <td class="body-bold-text-12px">${idDetails.name}</td>
	          <td class="body-bold-text-12px"><a href="/student/control/admin/viewPdf.jsp?name=${idDetails.name}&admission=${idDetails.addmission}"	 target="_blank" class="button">View</a></td>
	        </tr>
	 </c:forEach>
	 <tr>
	 <td>
	 </td>
	 </tr>
 </table>
	</c:otherwise>
</c:choose>
 