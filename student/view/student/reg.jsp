<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- InstanceBeginEditable name="doctitle" -->
<title>Student Management System </title>
<link href="../../themes/default/css/default.css" rel="stylesheet" type="text/css">
<link href="/student/themes/default/css/default.css" rel="stylesheet" type="text/css">
<link type="text/css" href="/student/scripts/jquery/themes/base/ui.all.css" rel="stylesheet" />
<script type="text/javascript" src="/student/scripts/jquery/jquery-1.3.2.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/jquery.dropshadow.js"></script>
<title>Student Registration Form</title>
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
      <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="3" height="10px"></td>
      </tr>
      <tr>
        <td width="10px">&nbsp;</td>
        <td align="center" valign="middle">
        
        <div id="logindiv" style="background-color:#666666;width:350px" class="box">
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
          <tr>
            <td colspan="3" height="10px"></td>
          </tr>
          <tr>
            <td width="10px"></td>
            <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td colspan="3" class="title-14px">Student Registration Form </td>
              </tr>
              <tr>
                <td colspan="3" height="10px"></td>
              </tr>
              <tr>
                <td colspan="3"><div id="infoDIV"></div></td>
              </tr>
              <tr>
                <td colspan="3" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px" width="70px">Full Name</td>
                <td width="10px">&nbsp;</td>
                <td><input name="fullName" id="fullName" type="text" class="input" /></td>
              </tr>
              <tr>
                <td colspan="3" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Initials</td>
                <td width="10px">&nbsp;</td>
                <td><input name="initialName" type="text" class="input" id="initialName" /></td>
              </tr>
              <tr>
                <td colspan="3" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px" width="70px">Last Name</td>
                <td width="10px">&nbsp;</td>
                <td><input name="lastName" id="lastName" type="text" class="input" /></td>
              </tr>
              <tr>
                <td colspan="3" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Title</td>
                <td width="10px">&nbsp;</td>
                <td><input name="initialName" type="text" class="input" id="initialName" /></td>
              </tr>
              <tr>
                <td colspan="3" height="10px"></td>
              </tr>
              <tr>
                <td colspan="3" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Sex</td>
                <td colspan="2" class="body-bold-text-12px"><input type="radio" name="Sex" id="male" >Male <input type="radio" name="sex" id="female" >Female</td>
               
             </tr>
              <tr>
                <td colspan="3" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px" width="70px">NIC</td>
                <td width="10px">&nbsp;</td>
                <td><input name="nic" id="nic" type="text" class="input" /></td>
              </tr>
              <tr>
                <td colspan="3" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Date of Birth</td>
                <td width="10px">&nbsp;</td>
                <td><input name="dob" type="text" class="input" id="dob" /></td>
              </tr>
              <tr>
                <td colspan="3" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Address </td>
                <td width="10px">&nbsp;</td>
                <td><input name="dob" type="text" class="input" id="dob" /></td>
              </tr>
              <tr>
                <td colspan="3" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">District</td>
                <td width="10px">&nbsp;</td>
                <td><input name="dob" type="text" class="input" id="dob" /></td>
              </tr>
              <tr>
                <td colspan="3" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Telephone</td>
                <td width="10px">&nbsp;</td>
                <td><input name="dob" type="text" class="input" id="dob" /></td>
              </tr>
              <tr>
                <td colspan="3" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Email </td>
                <td width="10px">&nbsp;</td>
                <td><input name="dob" type="text" class="input" id="dob" /></td>
              </tr>
              <tr>
                <td colspan="3" height="10px"></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                	<div align="left" id="submitButtonDIV"><a id="submitIco" href="javascript:doPost();" class="button">Sign In</a></div>
	                <div align="left" id="loadingDIV"><img src="../../themes/default/images/common/loading.gif" alt="Loading..."></div>
                </td>
              </tr>
            </table></td>
            <td width="10px">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="3" height="10px"></td>
          </tr>
        </table>
        </div>
                
        
        </td>
        <td width="10px">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3" height="10px"></td>
      </tr>
      </table>
      <script language="javascript" type="text/javascript">
	  $("#logindiv").dropShadow( {
	  		left:4, 
			top:1, 
			blur:3, 
			opacity:0.3, 
			color:"#414141"
		});
      </script>
	  <!-- InstanceEndEditable -->
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
        <td><span class="body-text-11px">Veranga Sooriyabandara.</span></td>
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