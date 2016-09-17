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
%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><!-- InstanceBegin template="/Templates/main.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv='Content-type' content='text/html; charset=utf-8'>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Student Management System</title>
<link href="../../themes/default/css/default.css" rel="stylesheet" type="text/css"> 
<link href="/student/themes/default/css/default.css" rel="stylesheet" type="text/css"> 
<link href="/student/themes/default/css/jsDatePick_ltr.min.css" rel="stylesheet" type="text/css"> 
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
<script type="text/javascript" src="/student/scripts/jquery/jsDatePick.min.1.3.js"></script>

<script type="text/javascript">
   function studentSearch(){
	   if($("#createdFromDate").val()=='' || $("#createdFromDate").val().length <=0){
		   alert("Please Select From Date To Filter!!!");
		   return;
	  }
	   if($("#createdToDate").val()=='' || $("#createdToDate").val().length <=0){
		   alert("Please Select From Date To Filter!!!");
		   return;
	  }
	   if(new Date($("#createdToDate").val()).getTime() < new Date($("#createdFromDate").val()).getTime()){
		   alert('From date must be before To date!!!');
		   return;
	   }
	    $.post("manageIdView.jsp",{ fromDate:$("#createdFromDate").val(),toDate:$("#createdToDate").val(),action:'N'}, function(data) {
	    	$('#showReslt').show();
			$("#showReslt").html(data);
	   }); 
	   
   }
   $(document).ready(function() {
	   $('#searchBx').change(function() {
		  	   // assign the value to a variable, so you can test to see if it is working
		   	 var selectVal = $('#searchBx :selected').val();
		   	 if(selectVal==0 || selectVal=='0' ){
		   		$('#searchText').hide();
		   	 }else{
		   		$('#searchText').show();
		   	 }
		  	    
		});
	   
	   new JsDatePick({
			useMode:2,
			target:"createdFromDate",
			dateFormat:"%Y-%m-%d"
			
		});
	   new JsDatePick({
			useMode:2,
			target:"createdToDate",
			dateFormat:"%Y-%m-%d"
			
		});
		
	   
   });
    
</script>






<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
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
              <td align="left" valign="bottom"><!-- InstanceBeginEditable name="title-region" --><span class="title-16px">Student Management System </span><!-- InstanceEndEditable --></td>
              <td align="right" valign="bottom"><!-- InstanceBeginEditable name="userstatus-region" --><span class="user">You are logged in as <%= user.getUserName()%></span><!-- InstanceEndEditable --></td>
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
            <td class="title-14px">Student ID Filter</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>
            <table id="stepOne" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td class="body-bold-text-12px">From Date :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="createdFromDate" type="text" class="input" id="createdFromDate" readonly></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
                 
                 <td class="body-bold-text-12px">To Date :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="createdToDate" type="text" class="input" id="createdToDate" readonly></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              
              
              <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              </tr>
              
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
          		<td><a href="#" id="saveInfo" name="saveInfo" class="button" onclick="studentSearch()">Filter</a></td>
      			<td></td>
      			<td></td>
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
            <td>
            
            &nbsp;</td>
          </tr>
        </table></td>
        <td width="10px">&nbsp;</td>
      </tr>
      </table>
      </div>
      <div id="showReslt"></div>
      
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
<!-- InstanceEnd --></html>

 