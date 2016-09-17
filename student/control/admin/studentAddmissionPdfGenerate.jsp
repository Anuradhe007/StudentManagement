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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><!-- InstanceBegin template="/Templates/main.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv='Content-type' content='text/html; charset=utf-8'>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Student Management System</title>
<link href="../../themes/default/css/default.css" rel="stylesheet" type="text/css"> 
<link href="/student/themes/default/css/default.css" rel="stylesheet" type="text/css"> 
<link type="text/css" href="/student/scripts/jquery/themes/base/ui.all.css" rel="stylesheet" />
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
<script type='text/javascript' src='/student/scripts/jquery/jquery.autocomplete.js'></script>
<link type="text/css" href="/student/scripts/jquery/themes/base/jquery.autocomplete.css" rel="stylesheet" />

<script type="text/javascript">


$(document).ready(function(){
	 $("#loadingDIV").hide();

});
 function apply(){
	 $("#loadingDIV").show();
	  $.post("studentAddmissionGenerator.jsp",{ generate: 'id'}, function(data) {
	    	$('#showReslt').show();
			$("#showReslt").html(data);
			
	   });  
	  
	  $("#loadingDIV").hide();  
	 
	  
	 
 }
 

 
	
</script>


</head>
<body>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#81BEF7" >
  <tr>
    <td height="75px"></td>
    <td valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>
          <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#CEE3F6">
            <tr>
            <td colspan="3"><img src="/student/themes/default/images/common/header.jpg"  height="120" width="800"></td>
            </tr>
			<tr>
              <td align="left" valign="bottom"><span class="title-16px">Student Management System </span></td>
              <td align="right" valign="bottom"><span class="user">You are logged in as <%= user.getUserName()%></span></td>
            </tr>
          </table></td>
      </tr>
      <tr>
        <td height="6px" bgcolor="#08088A"></td><!-- header boder above menu -->
      </tr>
      <tr>
        <td height="30px" bgcolor="#CEE3F6"><jsp:include page="/view/menu.jsp" flush="true" /></td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
  
  <tr>
    <td bgcolor="#81BEF7">&nbsp;</td><!-- LEft Side Color  -->
    <td align="left" valign="top"><!-- InstanceBeginEditable name="body-region" -->
     <div id="personalInfo">
      <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#CEE3F6">
      <tr>
        <td colspan="3" height="10px"></td>
      </tr>
      <tr>
        <td width="10px">&nbsp;</td>
        <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="title-14px">Exam Select</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td>
            <table id="stepOne" border="0" cellpadding="0" cellspacing="0">
            
              <tr><div id="showReslt"></div>
                <td colspan="7" height="10px">This will generate the all Future exam's admissions </td>
              </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
          		<td><input type="button" onclick="apply()" value="generate Admission"/></td>
      			<td></td>
      			<td><div align="left" id="loadingDIV"><img src="/student/themes/default/images/common/emailLoad.gif" alt="Loading..."></div></td>
      		  </tr> 
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td></td>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			  </tr>
              <tr>
                <td colspan="7"><img src="/student/themes/default/images/common/sub_table_dot_div.gif"></td>
              </tr>
           </table>
            </td>	
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table></td>
        <td width="10px">&nbsp;</td>
      </tr>
      </table>
      </div>
      <div id="showReslt"></div>
    </td>
    <td bgcolor="#81BEF7">&nbsp;</td><!-- Right Side Color -->
  </tr>
  <tr>
    <td valign="bottom" height="50px">&nbsp;</td>
    <td align="center" valign="top" width="800px">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="6px" bgcolor="#08088A"></td><!-- Foter border -->
      </tr>
      <tr>
        <td height="5px"></td>
      </tr>
      <tr>
       <td><span class="body-text-11px">@2013 Victory College . All Rights Reserved.</span></td>
      </tr>
      <tr>
        <td height="5px"></td>
      </tr>
    </table>
    </td>
    <td>&nbsp;</td>
  </tr>
</table>

</body>
</html>
  
