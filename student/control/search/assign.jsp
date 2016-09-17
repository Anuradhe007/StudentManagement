<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.student.exam.MarksManager"%>
<%@page import="com.student.admin.ClassCategoryManager"%>
<%@page import="com.student.admin.ClassCategory"%>

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
 <script type="text/javascript" src="/student/scripts/jquery/jquery.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/jquery.form.js"></script>
<style type="text/css">
	html .jqueryslidemenu{height: 1%;} /*Holly Hack for IE7 and below*/
</style>	
<script type="text/javascript" src="/student/scripts/menu/jqueryslidemenu.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/jquery.AddIncSearch.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/ui/ui.core.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/ui/ui.dialog.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/external/bgiframe/jquery.bgiframe.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/ui/ui.datepicker.js"></script>
    
<script type="text/javascript">
<!--
function open(){
	alert('ddd');
	 $('.popbox').popbox();
}
//-->
</script>
<%
System.out.println("class cat 13333333333333333333333333333333333333");
String selectVal = request.getParameter("valueSel");
String stuId = request.getParameter("stuId");
ClassCategoryManager classCategoryManager=ClassCategoryManager.getInstance();
System.out.println("class cat 1"+selectVal);
System.out.println("class cat 2"+stuId);
classCategoryManager.saveStudentClass(stuId,selectVal);
%>



   <table>
	<tr>
    <td>Data is Succesfully Saved</td>
  </tr>

 </table>
