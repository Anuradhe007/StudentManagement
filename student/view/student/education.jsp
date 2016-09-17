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
	<script type="text/javascript">
	
	doPost = function() {
		$("#infoDIV").html("");
		$("#infoDIV").hide();
		
		var un = $("#username");
		var pw = $("#password");
		
		if((un.attr("value")=='') && (pw.attr("value")=='')) {			
			$("#infoDIV").show();
			$("#infoDIV").addClass("error-bold-text-11px");
			$("#infoDIV").html("Username & Password both are required fields");
			$("#username").focus();
			return;
		}
		else if(un.attr("value")=='') {			
			$("#infoDIV").show();
			$("#infoDIV").addClass("error-bold-text-11px");
			$("#infoDIV").html("Username cannot be empty");
			$("#username").focus();
			return;
		}	
		else if(pw.attr("value")=='') {			
			$("#infoDIV").show();
			$("#infoDIV").addClass("error-bold-text-11px");
			$("#infoDIV").html("Password cannot be empty");
			$("#password").focus();
			return;
		}

		$.ajax({
			type: "POST",
			url: "/student/control/user/loginCtrl.jsp",
			data: {action: "login", username: un.attr("value"), password: pw.attr("value")},
			time: 10000,
			dataType: "json",
			cache: false,
			success: function(data){
				if(data.status=="OK") {
					pw.attr("value","");				
					$("#submitButtonDIV").hide();
					$("#loadingDIV").show();	
					$("#infoDIV").show();	
					$("#infoDIV").addClass("body-bold-text-11px");			
					$("#infoDIV").html(data.msg);
					window.location = "/student/view/login/login.html";					
					//window.location = "/ticket/ctrl/booking/bookingCtrl.jsp?action=showBookTicket";
				} else {
					pw.attr("value","");				
					$("#submitButtonDIV").show();
					$("#loadingDIV").hide();
					$("#infoDIV").show();
					$("#infoDIV").addClass("error-bold-text-11px");	
					$("#infoDIV").html(data.msg);
				}				
			},
			error: function(data){	
				pw.attr("value","");				
				$("#submitButtonDIV").show();
				$("#loadingDIV").hide();
				$("#infoDIV").show();
				$("#infoDIV").addClass("error-bold-text-11px");	
				$("#infoDIV").html("Oops!, Something went wrong!");				
			},
			beforeSend: function(data){				
				$("#submitButtonDIV").hide();
				$("#loadingDIV").show();
			} 
		});
	}
	
	</script>

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
                <td class="body-bold-text-12px" width="70px">A/L Stream </td>
                <td width="10px">&nbsp;</td>
                <td><select> <option value="Mathematics">Combined Maths </option>
                				<option value="Biology">Biology </option>
                				<option value="Commerce">Commerce</option>
                				<option value="Art">Art</option>
                     </select>	
               </td>
              </tr>
              <tr>
                <td colspan="3" height="10px"></td>
              </tr>
              <tr>
              	<td><table border="0" id="SubjectTable"></td>
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
        <td><span class="body-text-11px">created by Veranga Sooriyabandara.</span></td>
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