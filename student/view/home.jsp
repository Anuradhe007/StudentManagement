<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
     import="java.util.*,
    		com.student.user.*,
    		com.student.exception.*,
    		com.dialog.util.SystemConfig,
    		com.dialog.util.exception.SystemError,
    		java.net.URLEncoder,
    		sun.misc.BASE64Encoder,
    		java.security.MessageDigest"
    buffer="8kb"
    errorPage="/view/error.jsp"		
    buffer="8kb"%><%
    User user = (User)session.getAttribute("user");
     if((user==null) || (user.getUserName()==null)) {
        throw new UserVerificationException(new Exception("You are not logged in"),"/student/view/login/login.html");
    }
%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><!-- InstanceBegin template="/Templates/main.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- InstanceBeginEditable name="doctitle" -->
<title>Admin - Home</title>
<link href="../themes/default/css/default.css" rel="stylesheet" type="text/css">
<link href="/student/themes/default/css/default.css" rel="stylesheet" type="text/css">
<link type="text/css" href="/student/scripts/jquery/themes/base/ui.all.css" rel="stylesheet" />
<script type="text/javascript" src="/student/scripts/jquery/jquery-1.3.2.js"></script>
<script type="text/javascript">



</script>
<style type="text/css">
	html .jqueryslidemenu{height: 1%;} /*Holly Hack for IE7 and below*/
</style>	
<script type="text/javascript" src="/student/scripts/menu/jqueryslidemenu.js"></script>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<body>

<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#81BEF7">
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
              <td align="left" valign="bottom"><!-- InstanceBeginEditable name="title-region" --><span class="title-16px">Student Management System </span><!-- InstanceEndEditable --></td>
              <td align="middle" valign="bottom"><!-- InstanceBeginEditable name="userstatus-region" --><span class="user">You are logged in as <%= user.getUserName()%></span><!-- InstanceEndEditable --></td>
              <td align="right" valign="bottom"><!-- InstanceBeginEditable name="userstatus-region" --><a href="/student/view/login/login.html"><span class="logout">Sign out </span></a><!-- InstanceEndEditable --></td>
            </tr>
          </table></td>
      </tr>
      <tr>
      <td height="6px" bgcolor="#08088A"></td><!-- header boder above menu -->
      </tr>
      <tr>
        <td height="30px" bgcolor="#CEE3F6"><!-- InstanceBeginEditable name="menu-region" --><jsp:include page="menu.jsp" flush="true" /><!-- InstanceEndEditable --></td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#81BEF7">&nbsp;</td><!-- LEft Side Color  -->
    <td align="left" valign="top"><!-- InstanceBeginEditable name="body-region" -->
      <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#CEE3F6">
      <tr>
        <td colspan="3" height="10px"></td>
      </tr>
     
      <tr>
        <td width="10px">&nbsp;</td>
        <td>&nbsp;</td>
        <td width="10px">&nbsp;</td>
      </tr>
     
      <tr>
        <td colspan="3" height="1px" align="center"> <img src="/student/themes/default/images/common/Main.jpg"  width="400" height="300"></div></td>
      </tr>

        <tr>
        <td id="response2">&nbsp;</td>
      </tr>
      </table><!-- InstanceEndEditable -->
    </td>
    <td bgcolor="#81BEF7">&nbsp;</td><!-- Right Side Color -->
  </tr>
  <tr>
    <td valign="bottom" height="50px">&nbsp;</td>
    <td align="center" valign="top" width="800px">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="6px" bgcolor="#414141"></td>
      </tr>
      
      <tr>
        <td height="5px"></td>
      </tr>
      <tr>
         <td><span class="body-text-11px">All Rights Reserved.</span></td>
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
<!-- InstanceEnd --></html>
