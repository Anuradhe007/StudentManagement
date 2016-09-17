<%@page import="com.student.admin.ClassCategoryManager"%>
<%@page import="com.student.user.StudentManager"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.student.admin.ClassCategory"%>
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
<script type="text/javascript" src="/student/scripts/jquery/jsDatePick.min.1.3.js"></script>


<link href="/student/themes/default/css/jsDatePick_ltr.min.css" rel="stylesheet" type="text/css"> 
<link type="text/css" href="/student/scripts/jquery/themes/base/ui.all.css" rel="stylesheet" />
<script type="text/javascript" src="/student/scripts/jquery/jquery.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/jquery.form.js"></script>


<link type="text/css" href="/student/scripts/jquery/themes/base/jquery.autocomplete.css" rel="stylesheet" />
<script type="text/javascript">
   
$(document).ready(function() {
	 	   
	   new JsDatePick({
			useMode:2,
			target:"startTime",
			dateFormat:"%Y-%m-%d"
			
		});
	   new JsDatePick({
			useMode:2,
			target:"endTime",
			dateFormat:"%Y-%m-%d"
			
		});
		
	   
});
   
   
   
   function saveClasCategory($id){
	   
	   
	   $selectVal = $('#payment_category_selector').val();
	   if($("#lecNameTxt").val()=='' || $("#lecNameTxt").val().length <=0){
		   alert("Please enter Lecture Name!!!!");
		   return;
	   }
	   
	   if($("#feeTxt").val()=='' || $("#feeTxt").val().length <=0){
		   alert("Please enter the class fee");
		   return;
	   }
	   
	   if($selectVal==0 || $selectVal=='0'){
		   alert("Please select the Payment Category!!!!");
		   return;
	   }
	   if($("#classIdTxt").val()=='' || $("#classIdTxt").val().length <=0){
		   alert("Please enter the class ID");
		   return;
	   }
	  
	   if($("#startTime").val()=='' || $("#startTime").val().length <=0){
		   alert("Please enter Start Date !!!");
		   return;
	  }
	   if($("#endTime").val()=='' || $("#endTime").val().length <=0){
		   alert("Please enter End Date !!!");
		   return;
	  }
 		
	   if(new Date($("#endTime").val()).getTime() < new Date($("#startTime").val()).getTime()){
		   alert('Start date must be before end date!!!');
		   return;
	   }
	    $.post("saveClassCategory.jsp",{ classId: $("#classIdTxt").val(),feeTxt:$("#feeTxt").val(),lecNameTxt:$("#lecNameTxt").val(),subjectTxt:$("#subjectTxt").val(),paymentCat:$selectVal,id:$id,endTime:$("#endTime").val(),startTime:$("#startTime").val()}, function(data) {
	    	$('#showReslt').show();
			$("#showReslt").html(data);
	   }); 
	   
   }
   
   function isNumberKey(evt)
   {
      var charCode = (evt.which) ? evt.which : event.keyCode;
     // alert(charCode);
      if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)){
    	  return false;
      }
         

      return true;
   }
    
   
  
   
    
</script>


<%
String id = request.getParameter("id");

ClassCategory classCategory=new ClassCategory();
boolean isEdit=false;;
if(id!=null){
	ClassCategoryManager classCategoryManager=ClassCategoryManager.getInstance();
	classCategory=classCategoryManager.getCategoryById(id);
	if(classCategory!=null && classCategory.getClassId()!=null){
		isEdit=true;
	}
	request.setAttribute("classCategory", classCategory);
	request.setAttribute("isEdit", true);
}
%>



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
          <table width="100%" border="0" cellspacing="0" cellpadding="0"  bgcolor="#CEE3F6">
			<tr>
            <td colspan="3"><img src="/student/themes/default/images/common/header.jpg"  height="120" width="800"></td>
            </tr>
			<tr>
              <td align="left" valign="bottom"><!-- InstanceBeginEditable name="title-region" --><span class="title-17px">Student Management System </span><!-- InstanceEndEditable --></td>
              <td align="right" valign="bottom"><!-- InstanceBeginEditable name="userstatus-region" --><span class="user">You are logged in as <%= user.getUserName()%></span><!-- InstanceEndEditable --></td>
              <td align="right" valign="bottom"><!-- InstanceBeginEditable name="userstatus-region" --><a href="/student/view/login/login.html"><span class="logout">Sign out </span></a><!-- InstanceEndEditable --></td>
            </tr>
          </table></td>
      </tr>
      <tr>
       <td height="6px" bgcolor="#08088A"></td>
      </tr>
      <tr>
        <td height="30px" bgcolor="#414141"><!-- InstanceBeginEditable name="menu-region" --><jsp:include page="/view/menu.jsp" flush="true" /><!-- InstanceEndEditable --></td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#81BEF7">&nbsp;</td>
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
            <td class="title-14px">Class Category Form</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>
            <table id="stepOne" border="0" cellpadding="0" cellspacing="0">
            
              <tr><div id="showReslt"></div><br>
	              <td class="body-bold-text-12px">Enter Lecture Name :</td>
	              <td>
	    			  <input class="input" type="text" id="lecNameTxt" value="${classCategory.lectureName}"/>
	    		   </td>
	              <td height="5px"></td>
              </tr>
              <tr>
              <td colspan="4" height="7px"></td>
              </tr>
              <tr>
	              <td class="body-bold-text-12px">Subject :</td>
	              <td>
	    			  <input class="input" type="text" id="subjectTxt" value="${classCategory.subject}"/>
	    		   </td>
	              <td height="5px"></td>
              </tr>
              <tr>
              <td colspan="4" height="7px"></td>
              </tr>
               <tr>
	              <td class="body-bold-text-12px">Class Id :</td>
	              <td>
	    			  <input class="input" type="text" id="classIdTxt" value="${classCategory.classId}"/><div class="body-bold-text-12px">  </div>
	    		   </td>
	              <td height="5px"></td>
              </tr>
              <tr>
              <td colspan="4" height="7px"></td>
              </tr>
               <tr>
	              <td class="body-bold-text-12px">Class Fee(LKR) :</td>
	              <td>
	    			  <input class="input" type="text" id="feeTxt" onkeypress="return isNumberKey(event)" value="${classCategory.fee}" />
	    		   </td>
	              <td height="5px"></td>
              </tr>
              <tr>
              <td colspan="4" height="7px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Payment Category :</td>
                 <td class="body-bold-text-12px" >
                 
                 <select name="category_selector" id="payment_category_selector" class="dropdown" >  
                    <option VALUE="0">Select Category</option>
					<option VALUE="M">Monthly</option>
					<option VALUE="I">Installment</option>
				</select> 
                  </td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                  <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="2" class="body-bold-text-12px"></td>
              </tr>
              <tr>
              <td colspan="4" height="7px"></td>
              </tr>
               <tr>
	              <td class="body-bold-text-12px">Class Start Date :</td>
	              <td>
	    			  <input name="startTime" type="text" class="input" id="startTime" value="${classCategory.startTime}" readonly>
	    		   </td>
	              <td height="5px"></td>
              </tr>
              <tr>
              <td colspan="4" height="7px"></td>
              </tr>
              <tr>
	              <td class="body-bold-text-12px">Class End Date :</td>
	              <td>
	    			  <input name="endTime" type="text" class="input" id="endTime"  value="${classCategory.endTime}" readonly>
	    		   </td>
	              <td height="5px"></td>
              </tr>
              
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
          		<td><a href="#" id="saveInfo" name="saveInfo" class="button" onclick="saveClasCategory('${classCategory.id}')">Save</a></td>
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

 