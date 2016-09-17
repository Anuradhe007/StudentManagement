<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.student.exam.MarksManager"%>

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
    <%
    User user = (User)session.getAttribute("user");
    if((user==null) || (user.getUserName()==null)) {
        throw new UserVerificationException(new Exception("You are not logged in"),"/student/view/login/login.html");
    }    
    %>
    
<script type="text/javascript">
<!--
function open(){
	alert('ddd');
	 $('.popbox').popbox();
}
//-->
</script>
<%
String name = request.getParameter("name");
String value = request.getParameter("value");
String action = request.getParameter("action");
boolean isClassSelect=false;
if(action!=null && action.equals("classSelect")){
	isClassSelect=true;
}
request.setAttribute("isClassSelect", isClassSelect);
List<Student>stuList=null;
SearchManager searchManager=SearchManager.getInstance();
if(name!=null && value!=null){
	if(name.equalsIgnoreCase("nic")){
		stuList=searchManager.getStudentByNIC(value);
		request.setAttribute("stuList", stuList);
	}else if(name.equalsIgnoreCase("name")){
		stuList=searchManager.getStudentByName(value);
		request.setAttribute("stuList", stuList);
	}else if(name.equalsIgnoreCase("regNo")){
		stuList=searchManager.getStudentByRegNo(value);
		request.setAttribute("stuList", stuList);
	}
}

 if(stuList!=null){
%>
 

<table >
	<tr>
    
    <td class="body-bold-text-12px">Full Name</td>
    <td class="body-bold-text-12px">NIC</td>
    <td class="body-bold-text-12px">Gender</td>
    <td class="body-bold-text-12px"></td>
  </tr>
  <tr>
  <td colspan="4"><img src="/student/themes/default/images/common/sub_table_dot_div.gif"></td>
  </tr>
<c:forEach var="student" items="${stuList}">
        <tr>
         
          <td class="body-bold-text-12px">${student.fullName}</td>
          <td class="body-bold-text-12px">${student.nic} </td>
           <td class="body-bold-text-12px">${student.lastName}</td>
          <td class="body-bold-text-12px">
          <c:choose>
          <c:when test="${isClassSelect==true}">
         	<%if(user.getUserRole().equalsIgnoreCase("Administrator")) {%><a href="/student/control/search/EditStudent.jsp?id=${student.regNo}" class="button" >Edit Profile<% }%></a>
         	 <%if(user.getUserRole().equalsIgnoreCase("Administrator")) {%><a href="/student/control/search/assignClass.jsp?id=${student.regNo}" class="button" >Assign Class<% }%></a>
          </c:when>
          <c:otherwise>
           </c:otherwise>
          </c:choose>
         
          </td>
        </tr>
 </c:forEach>
 </table>










<%}else{%>
   <table>
	<tr>
    <td>Your Search Result Not Found</td>
  </tr>

 </table>
<%}%>