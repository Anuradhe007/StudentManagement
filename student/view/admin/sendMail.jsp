<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.util.*,
    		com.student.user.*,
    		com.student.admin.*,
    		com.student.exception.*"
    errorPage="/view/error.jsp"		
    buffer="8kb"%><%
    User user = (User)session.getAttribute("user");
    if((user==null) || (user.getUserName()==null)) {
        throw new UserVerificationException(new Exception("You are not logged in"),"/student/view/login/login.html");
    }    
    
    //ArrayList<Location> locations = (ArrayList<Location>)request.getAttribute("locations");
   // locations = locations==null?new ArrayList<Location>():locations;
%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><!-- InstanceBegin template="/Templates/main.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->

<script type="text/javascript" class="code">
$(document).ready(function(){
	 $("#loadingDIV").hide();
  
	 
	 
  $("#group").click(function() {
	  $('#to').hide();
	  $('#classId').show();
	 
	  $("#send").click(function() {
		  sendGroupMail();
		 
		});

	});
  $("#ind").click(function() {
	  $('#classId').hide();
	  $('#to').show();
	  $("#send").click(function() {
		  getAttendance(); 
		});
	});
  
  
});

getAttendance = function (){
	
   
    var to			= $('#to').val();	
    var path		= $('#file').val();
    
    var subject		=  $('#subject').val();
    var message		=  $('#message').val();
    if(path=="") {
    	path = "No";
    }
      
	$.ajax({
			type: "POST",
			url: "/student/control/admin/adminCtrl.jsp",
			data: {action: "sending" , to: to , path: path,subject:subject,message: message},
			time: 60000,
			dataType: "json",
			cache: false,
			success: function(data){
				$("#dispalyRegNo").html("Your message has been sent");
				$("#loadingDIV").hide();
				
			},
			error: function(data){
				alert("ERROR");
				$("#response").addClass("error-bold-text-11px");	
				$("#response").html("Oops!, Something went wrong!");
				$("#response").removeClass("error-bold-text-11px");
				$("#busyActivate").hide();
				$("#loadingDIV").hide();
			},
			beforeSend: function(data){
				$("#loadingDIV").show();
				
				
				
		
			} 
		});



}
sendGroupMail = function (){
	
	   
    var to			= $('#classId').val();	
    var path		= $('#file').val();
    
    var subject		=  $('#subject').val();
    var message		=  $('#message').val();
    if(path=="") {
    	path = "No";
    }
	$.ajax({
			type: "POST",
			url: "/student/control/admin/adminCtrl.jsp",
			data: {action: "groupMail" , to: to , path: path,subject:subject,message: message},
			time: 60000,
			dataType: "json",
			cache: false,
			success: function(data){
				$("#dispalyRegNo").html("Your message has been sent");
				$("#loadingDIV").hide();
				
			},
			error: function(data){
				alert("ERROR");
				$("#response").addClass("error-bold-text-11px");	
				$("#response").html("Oops!, Something went wrong!");
				$("#response").removeClass("error-bold-text-11px");
				$("#busyActivate").hide();
				$("#loadingDIV").hide();
			},
			beforeSend: function(data){
				$("#loadingDIV").show();
				
				
				
		
			} 
		});



}
</script>

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
              <td align="right" valign="bottom"><!-- InstanceBeginEditable name="userstatus-region" --><span class="user">You are logged in as <%= user.getUserName()%></span><!-- InstanceEndEditable --></td>
              <td align="right" valign="bottom"><!-- InstanceBeginEditable name="userstatus-region" --><a href="/student/view/login/login.html"><span class="logout">Sign out </span></a><!-- InstanceEndEditable --></td>
            </tr>
          </table></td>
      </tr>
      <tr>
        <td height="6px" bgcolor="#08088A"></td><!-- header boder above menu -->
      </tr>
      <tr>
         <td height="30px" bgcolor="#CEE3F6"><!-- InstanceBeginEditable name="menu-region" --><jsp:include page="/view/menu.jsp" flush="true" /><!-- InstanceEndEditable --></td>
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
            <td class="title-14px">Sending Email</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>
            <table id="stepOne" border="0" cellpadding="0" cellspacing="0">
               <tr>
                <td class="body-bold-text-12px">To (Individual):</td>
                <td class="body-bold-text-12px"><input type="radio" name="common" id="ind"></td>
                 <td><input name="to" type="text" class="input" id="to" ></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
             <tr>
                <td colspan="7" height="10px"></td>
              </tr>
               <tr>
                <td class="body-bold-text-12px">To (Group):</td>
                <td class="body-bold-text-12px"><input type="radio" name="common" id="group"></td>
                  <td><select id="classId" class="dropdown">
                 <option>select class </option>
                 <%
                
					MyClassCategory ct = new MyClassCategory();
					String [] myar = ct.getClassCategory();
					
					               	
                 	
                 	for(String tt : myar){
                 		if(tt!=null){
                 	%>
                 	<option>
                 	   <%=tt %>
                 	</option>
                 	<% 
                 	}
                 	}
					
					%>
	
					</select></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
             <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Subject :</td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                  <td class="body-bold-text-12px" ><input name="subject" type="text" class="input" id="subject" ></td>
                  <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="2" class="body-bold-text-12px"><div id="dispalyRegNo" ></div><div id="tmpReg" ></div></td>
              </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
             <tr>
                <td class="body-bold-text-12px">Attach a file :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="file" type="file" class="input" id="file" ></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
             <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Message :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="message" type="textarea" class="input" id="message" ></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td><div align="left" id="loadingDIV"><img src="/student/themes/default/images/common/emailLoad.gif" alt="Loading..."></div></td>
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
          <tr>
            <td id="response5">&nbsp;</td>
          </tr>
          <tr>
          <td><a href="#" id="send" name="send" class="button">send</a></td>
      	<td></td>
      	<td></td>
      </tr> 
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td id="response2">&nbsp;</td>
          </tr>
          <tr>
          	<td><div id="regComp" ></div></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td id="response3">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>                             
        </table></td>
        <td width="10px">&nbsp;</td>
      </tr>
      <tr>
      	<td></td>
      	<td></td>
      	<td></td>
      </tr> 
      <tr>
        <td colspan="3" height="10px"></td>
      </tr>
      </table>
      </div>
      <!-- InstanceEndEditable -->
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
        <td><span class="body-text-11px"> All Rights Reserved.</span></td>
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
