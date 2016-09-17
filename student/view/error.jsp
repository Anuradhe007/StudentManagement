<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.util.*,
    		com.student.system.*,
    		com.student.user.*,
    		com.student.util.*,
    		com.student.exception.*"
    isErrorPage="true"
    buffer="8kb"%><%
    String msg  = "Request failed. Please retry.";
    String back = "history.go(-1)";
    if(exception instanceof WebException) {
        msg  = ((WebException)(exception)).getMessage();
        back = ((WebException)(exception)).getBackURL();
    }
%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><!-- InstanceBegin template="/Templates/main.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- InstanceBeginEditable name="doctitle" -->
<title>Admin - </title>
<link href="../themes/default/css/default.css" rel="stylesheet" type="text/css">
<link href="/student/themes/default/css/default.css" rel="stylesheet" type="text/css">
<link type="text/css" href="/student/scripts/jquery/themes/base/ui.all.css" rel="stylesheet" />
<script type="text/javascript" src="/student/scripts/jquery/jquery-1.3.2.js"></script>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<body>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="75px"></td>
    <td valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">

            <tr>
              <td align="left" valign="bottom"><!-- InstanceBeginEditable name="title-region" --><span class="title-16px">Student Management System</span><!-- InstanceEndEditable --></td>
              <td align="right" valign="bottom"><!-- InstanceBeginEditable name="userstatus-region" --><!-- InstanceEndEditable --></td>
            </tr>
          </table></td>
      </tr>
      <tr>
        <td height="4px"></td>
      </tr>
      <tr>
        <td height="30px" bgcolor="#414141"><!-- InstanceBeginEditable name="menu-region" -->&nbsp;<!-- InstanceEndEditable --></td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#e4e4e4">&nbsp;</td>
    <td align="left" valign="top"><!-- InstanceBeginEditable name="body-region" -->
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="3" height="10px"></td>
      </tr>
      <tr>
        <td width="10px">&nbsp;</td>
        <td align="center" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center"><div align="center"><img class="error_img" border="0" width="90px" height="75px" src="/ticket/themes/default/images/common/b.gif"></div></td>
          </tr>
          <tr>
            <td align="center" height="10px"></td>
          </tr>
          <tr>
            <td align="center" class="error-bold-text-11px"><%=msg%></td>
          </tr>
          <tr>
            <td align="center" height="10px"></td>
          </tr>
          <tr>
            <td align="center"><a href="<%=back%>" class="body-bold-text-12px">Back</a></td>
          </tr>
        </table></td>
        <td width="10px">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3" height="10px"></td>
      </tr>
      </table><!-- InstanceEndEditable -->
    </td>
    <td bgcolor="#e4e4e4">&nbsp;</td>
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
        <td><span class="body-text-11px">Victory College</span></td>
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
