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
    		javax.servlet.*"
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
function submit($id){
	//alert('sss');
	  var dd= $("#catSelect").val();
	// $ddd=dd.replace(',', '-');
	//alert(dd);
	 $.post("assign.jsp",{stuId:$id,valueSel:dd}, function(data) {
	    	$('#showReslt').show();
			$("#showReslt").html(data);
			$('#name').hide();
			$('#name1').hide();
	   }); 
}
//-->
</script>
<%


String id = request.getParameter("id");

Student student=null;

if(id!=null){
	StudentManager studentManager=StudentManager.getInstance();
	
	student=studentManager.getID(id);
	request.setAttribute("student", student);
}

 if(student!=null){
	  ClassCategoryManager classCategoryManager=ClassCategoryManager.getInstance();
	  List<ClassCategory> catList= classCategoryManager.getClassCategoryByStudent(student.getId());
	  System.out.println("inside Assignclass catList"+catList);
	  if(catList!=null && catList.size()>0){
	 
		 request.setAttribute("catList", catList);
	
%>
 

<table >
	<tr id="name1">
    <td class="body-bold-text-12px">Select classes for ${student.fullName}</td>
    <td class="body-bold-text-12px"></td>
    <td class="body-bold-text-12px"></td>
    <td class="body-bold-text-12px"></td>
  </tr>
  <tr>
  <td colspan="4"><img src="/student/themes/default/images/common/sub_table_dot_div.gif"></td>
  </tr>
  <tr id="name2">
          <td class="body-bold-text-12px">
         <!-- <select name="catSelect" id="catSelect" multiple="multiple" tabindex="1"> --> 
         <select name="catSelect" id="catSelect"  tabindex="1">
     		 <c:forEach  var="cat" items="${catList}">
       			<option value="${cat.id}">${cat.classId}</option>
        
      	    </c:forEach>
        
      		</select>
      </td>
          <td class="body-bold-text-12px"><input type="button" onclick="submit(${student.id})" value="Assign this Class"/></td>
   </tr>
   <tr id="showReslt">
   
    
   </tr>

 </table>










<%}else{ %>
   <table>
	<tr>
    <td>There are no existing class for this student.Try Again..</td>
  </tr>

 </table>
<%}}else{%>
	 <table>
	<tr>
    <td>Student is Can't view.Try Again..</td>
  </tr>
<%}%>