<%@page import="com.student.admin.ClassCategoryManager"%>
<%@page import="com.student.admin.MyClassCategory"%>
<%@page import="com.student.user.StudentManager"%>
<%@page import="com.student.admin.ExamManager"%>
<%@page import="com.student.admin.Exam"%>
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


<%
String id=request.getParameter("id");
Exam exam=ExamManager.getInstance().getExamByExamId(id);
String startH=exam.getExamStartTime().split(":")[0];
String startM=exam.getExamStartTime().split(":")[1];
String endH=exam.getExamEndTime().split(":")[0];
String endM=exam.getExamEndTime().split(":")[1];


request.setAttribute("startH", startH);
request.setAttribute("startM", startM);
request.setAttribute("endH", endH);
request.setAttribute("endM", endM);

List<String> hourLst=new ArrayList();
request.setAttribute("exam", exam);
for(int i=0;i<=24 ;i++){
	if(i<10){
		hourLst.add("0"+new Integer(i).toString());
	}else{
		hourLst.add(new Integer(i).toString());
	}
	
}

request.setAttribute("hourLst", hourLst);

List<String> minLst=new ArrayList();
for(int i=1;i<=60 ;i++){
	if(i<10){
		minLst.add("0"+new Integer(i).toString());
	}else{
		minLst.add(new Integer(i).toString());
	}
	
}

request.setAttribute("minLst", minLst);
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
	
	/* css for timepicker */
.ui-timepicker-div .ui-widget-header { margin-bottom: 8px; }
.ui-timepicker-div dl { text-align: left; }
.ui-timepicker-div dl dt { height: 25px; margin-bottom: -25px; }
.ui-timepicker-div dl dd { margin: 0 10px 10px 65px; }
.ui-timepicker-div td { font-size: 90%; }
.ui-tpicker-grid-label { background: none; border: none; margin: 0; padding: 0; }

.ui-timepicker-rtl{ direction: rtl; }
.ui-timepicker-rtl dl { text-align: right; }
.ui-timepicker-rtl dl dd { margin: 0 65px 10px 10px; }
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
			target:"examDate",
			dateFormat:"%Y-%m-%d"
			
		});
	    
	    
		 
	   
});
   

   
   function saveExams(id){
	 
	   if($("#examNumber").val()=='' || $("#examNumber").val().length <=0){
		   alert("Please enter the Exam Number !!!!");
		   return;
	   }
	  	   
	   if($("#examDate").val()=='' || $("#examDate").val().length <=0){
		   alert("Please enter Exam Start Date !!!");
		   return;
	  }
	   if($("#startHour").val()=='' || $("#startHour").val().length <=0){
		   alert("Please select Exam Start Hour!!!");
		   return;
	  }
	 
	  if($("#endHour").val()=='' || $("#endHour").val().length <=0){
		   alert("Please select Exam End Hour!!!");
		   return;
	  }
 		
	   if( new Date($("#examDate").val()).getTime()   < new Date().getTime()){
		   alert('Date must be a Coming date!!!');
		   return;
	   }
	    $.post("saveExam.jsp",{ examNum:$("#examNumber").val(),description:$("#description").val(),startDate:$("#examDate").val(),startHour:$("#startHour").val(),startMin:$("#startMin").val(),endHour:$("#endHour").val(),endMin:$("#endMin").val(),action:'edit',id:id}, function(data) {
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
    
   function checkExamNum(){
	   var check=true;
	   $.post("saveExam.jsp",{ examNum: $('#examNumber').val(),action:'check'}, function(data) {
	    	if(data=='true' || data){
	    		
	    		check=true;
	    	}else{
	    		alert('ddd');
	    		check=false;
	    	}
	   }); 
	   
	   return check;
   }
  
   
    
</script>


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
              <td align="left" valign="bottom"><!-- InstanceBeginEditable name="title-region" --><span class="title-16px">Student Management System </span><!-- InstanceEndEditable --></td>
              <td align="right" valign="bottom"><!-- InstanceBeginEditable name="userstatus-region" --><span class="user">You are logged in as <%= user.getUserName()%></span><!-- InstanceEndEditable --></td>
            </tr>
          </table></td>
      </tr>
      <tr>
        <td height="4px"></td>
      </tr>
      <tr>
        <td height="30px" bgcolor="#414141"><!-- InstanceBeginEditable name="menu-region" --><jsp:include page="/view/menu.jsp" flush="true" /><!-- InstanceEndEditable --></td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#e4e4e4">&nbsp;</td>
    <td align="left" valign="top"><!-- InstanceBeginEditable name="body-region" -->
     <div id="personalInfo">
     <c:choose>
     	<c:when test="${exam==null }">
     	 Can't find the entry.Please try again..
     	</c:when>
     </c:choose>
     
     
     
     
      <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="3" height="10px"></td>
      </tr>
      <tr>
        <td width="10px">&nbsp;</td>
        <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="title-14px">Edit Exam Form</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>
            <table id="stepOne" border="0" cellpadding="0" cellspacing="0">
            
              <tr><div id="showReslt"></div>
	           		<td class="body-bold-text-12px">Class :</td>
                    <td class="body-bold-text-12px" >
                 		${exam.classCategory.classId}
                   </td>
                   <td class="body-bold-text-12px">&nbsp;</td>
                  <td class="body-bold-text-12px">&nbsp;</td>
              </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
	              <td class="body-bold-text-12px">Description :</td>
	              <td>
	    			  <input class="body-bold-text-12px" type="text" id="description" value="${exam.description}"/>
	    		   </td>
	               <td class="body-bold-text-12px">&nbsp;</td>
                  <td class="body-bold-text-12px">&nbsp;</td>
              </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
	              <td class="body-bold-text-12px">Exam Number :</td>
	              <td>
	    			  <input class="body-bold-text-12px" type="text" id="examNumber" value="${exam.examNumber}"/>(Must be Unique)
	    		   </td>
	               <td class="body-bold-text-12px">&nbsp;</td>
                  <td class="body-bold-text-12px">&nbsp;</td>
              </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
               <tr>
	              <td class="body-bold-text-12px">Exam  Date :</td>
	              <td>
	    			 <input name="examDate" type="text" class="input" id="examDate" value="${exam.examDate}" readonly>
	    		   </td>
	               <td class="body-bold-text-12px">&nbsp;</td>
                  <td class="body-bold-text-12px">&nbsp;</td>
              </tr>
              
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
	              <td class="body-bold-text-12px">Exam Start Time :</td>
	              <td><font class="body-bold-text-12px" >HH</font>
	    			 <select name="startHour" id="startHour" class="body-bold-text-12px" >  
							<option VALUE="">HH</option>
							<c:forEach items="${hourLst}" var="hour">
							<c:if test='${startH==hour }'><option VALUE="${hour}" selected="selected">${hour}</option></c:if>
							<c:if test='${startH!=hour }'><option VALUE="${hour}" >${hour}</option></c:if>
							
							</c:forEach>
						</select>
						<font class="body-bold-text-12px" >MM</font>
	    			 <select name="startMin" id="startMin" class="body-bold-text-12px">  
							<c:forEach items="${minLst}" var="min">
							<c:if test='${startM==min }'><option VALUE="${min}" selected="selected">${min}</option></c:if>
							<c:if test='${startM!=min }'><option VALUE="${min}" >${min}</option></c:if>
							<option VALUE="${min}">${min}</option>
							</c:forEach>
						</select>
	    		   </td>
	               	<td>
	    		   </td>
                  <td class="body-bold-text-12px">&nbsp;</td>
              </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
            
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
               <tr>
	              <td class="body-bold-text-12px">Exam End Time :</td>
	              <td class="body-bold-text-12px">
	                <font class="body-bold-text-12px" >HH</font>
	    			 <select name="endHour" id="endHour" class="body-bold-text-12px">  
							<option VALUE="">HH</option>
							<c:forEach items="${hourLst}" var="hour">
							<c:if test='${endH==hour }'><option VALUE="${hour}" selected="selected">${hour}</option></c:if>
							<c:if test='${endH!=hour }'><option VALUE="${hour}" >${hour}</option></c:if>
							</c:forEach>
						</select>
						<font class="body-bold-text-12px" >MM</font>
	    			 <select name="endMin" id="endMin" class="body-bold-text-12px">  
							<c:forEach items="${minLst}" var="min">
							<c:if test='${endM==min }'><option VALUE="${min}" selected="selected">${min}</option></c:if>
							<c:if test='${endM!=min }'><option VALUE="${min}" >${min}</option></c:if>
							</c:forEach>
						</select>
	    		   </td>
	               	<td class="body-bold-text-12px">
	    		   </td>
                  <td class="body-bold-text-12px">&nbsp;</td>
                  
              </tr>
              
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
               <tr>
	              <td class="body-bold-text-12px">Exam Hall :</td>
	              <td>
	    			 <input name="hall" type="text" class="input" id="hall" disabled>
	    		   </td>
	               <td class="body-bold-text-12px">&nbsp;</td>
                  <td class="body-bold-text-12px">&nbsp;</td>
              </tr>
               
                            
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
          		<td><a href="#" id="saveInfo" name="saveInfo" class="button" onclick="saveExams('${exam.id}')">Save</a></td>
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
<!-- InstanceEnd --></html>

 