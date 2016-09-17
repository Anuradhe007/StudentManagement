<%@page import="com.student.exam.MyMarks"%>
<%@page import="com.student.admin.MyClassCategory"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- InstanceBeginEditable name="doctitle" -->
<title>Student Management System</title>
<link class="include" rel="stylesheet" type="text/css" href="../../themes/default/css/jquery.jqplot.min.css" />
<link href="../../themes/default/css/default.css" rel="stylesheet" type="text/css"> 
<link href="/student/themes/default/css/default.css" rel="stylesheet" type="text/css"> 
<link type="text/css" href="/student/scripts/jquery/themes/base/ui.all.css" rel="stylesheet" />
<script type="text/javascript" src="/student/scripts/jquery/ui/jquery.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/ui/jquery.form.js"></script>
<style type="text/css">
	html .jqueryslidemenu{height: 1%;} /*Holly Hack for IE7 and below*/
</style>	
<style type="text/css">

.plot {
    margin-bottom: 30px;
    margin-left: auto;
    margin-right: auto;
}


#chart3 .jqplot-meterGauge-tick, #chart0 .jqplot-meterGauge-tic {
    font-size: 10pt;
}


</style>
<script class="include" type="text/javascript" src="/student/scripts/jquery/jqplot/jquery.min.js"></script>
<script type="text/javascript" src="/student/scripts/menu/jqueryslidemenu.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/jquery.AddIncSearch.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/ui/ui.core.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/ui/ui.dialog.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/external/bgiframe/jquery.bgiframe.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/ui/ui.datepicker.js"></script>
<script class="include" type="text/javascript" src="/student/scripts/jquery/jqplot/jquery.jqplot.min.js"></script>
<script class="include" type="text/javascript" src="/student/scripts/jquery/jqplot/jqplot.meterGaugeRenderer.min.js"></script>

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->


<script type="text/javascript" class="code">

function createChart(vale,chart){


 s1 = [vale];

   plot3 = $.jqplot(chart,[s1],{
       seriesDefaults: {
           renderer: $.jqplot.MeterGaugeRenderer,
           rendererOptions: {
			   label: 'Average',
               min: 0,
               max: 100,
               intervals:[25, 50, 75, 100],
               intervalColors:['#A4A4A4', '#424242', '#151515', '#0A2A0A']
           }
       }
   });



}
$(document).ready(function(){
 
  $("#examNo").change(function() {
     getAverageMarks();
		

	});
  
});


getExamNo = function (){
	
    var classID 	= $('#classId').val();
    
   		    
	$.ajax({
			type: "POST",
			url: "/student/control/exam/examCtrl.jsp",
			data: {action: "getExamNo" , classID: classID},
			time: 10000,
			dataType: "json",
			cache: false,
			success: function(data){
				var examNo	= new Array()
				examNo  = data.list;
				var i = 0;
				alert("Withing success 1");
					for(i=0;i<examNo.length;i++){
						alert("Withing success2");
						$var4 = "<option>"+exam[i]+"</option>";
						$("#examNo").append($var4);
						alert("Withing success3");
						
					}
				
				$("#classfee").val(data.fee);
				$("#busyActivate").hide();
				
			},
			error: function(data){
				
				$("#response").addClass("error-bold-text-11px");	
				$("#response").html("Oops!, Something went wrong!");
				$("#response").removeClass("error-bold-text-11px");
				$("#busyActivate").hide();
			},
			beforeSend: function(data){
				$("#busyActivate").show();
				
		
			} 
		});



}

getAverageMarks= function (){
	
    var classID 	= $('#classId').val();
    var examNo      = $('#examNo').val();
   		    
	$.ajax({
			type: "POST",
			url: "/student/control/exam/examCtrl.jsp",
			data: {action: "getAvgMarks" , classID: classID,examNo: examNo},
			time: 10000,
			dataType: "json",
			cache: false,
			success: function(data){
				createChart(data.avg,"chart1");
				$("#avgMarks").val(data.avg);
				$("#busyActivate").hide();
				
			},
			error: function(data){
				
				$("#response").addClass("error-bold-text-11px");	
				$("#response").html("Oops!, Something went wrong!");
				$("#response").removeClass("error-bold-text-11px");
				$("#busyActivate").hide();
			},
			beforeSend: function(data){
				$("#busyActivate").show();
				
		
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
            <td class="title-14px">View Average Marks</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>
            <table id="stepOne" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="body-bold-text-12px">Class Category :</td>
                 <td class="body-bold-text-12px">&nbsp;</td>
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
                 <td colspan="2" class="body-bold-text-12px"><div id="dispalyRegNo" ></div><div id="tmpReg" ></div></td>
              </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Exam No :</td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                  <td><select id="examNo" class="dropdown">
                 <option>select Exam </option>
                 <%
                	
					MyMarks myt = new MyMarks();
					String [] my = myt.getExamNo();
					
					               	
                 	
                 	for(String tt : my){
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
                 <td colspan="2" class="body-bold-text-12px"><div id="dispalyRegNo" ></div><div id="tmpReg" ></div></td>
              </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Average Marks :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="avgMarks" type="text" class="input" id="avgMarks" value="null" ></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
             <tr>
                <td colspan="7" height="10px"></td>
             </tr>
              <tr>
                <td  height="10px"></td>
                <td colspan="6" height="10px"></td>
             </tr>
             <tr>
                <td  height="10px"></td>
                <td colspan="6" height="10px"></td>
             </tr>
              <tr>
                <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td><div id="chart1" class="plot" style="width:300px;height:180px;"></div></td>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
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
          <td></td>
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
