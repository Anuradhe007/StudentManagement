<%@page import="com.mysql.jdbc.ResultSet"%>
<%@page import="com.student.user.GenerateRegNo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.util.*,
    		com.student.user.*,
    		com.student.exception.*,
    		com.student.admin.*"
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


<script>

$(document).ready(function(){
	
	$('#year').hide();
	$('#selectYear').hide();
	$('#sample').hide();
	$('#exampleTxt').hide();
	$("#busyActivate").hide();
	$("#txtf").hide();
	$("#saveInfo").hide();
	$("#nobtn").hide();
	$("#saveReg").hide();
	$("#regNof").hide();
	$("#loct").hide();
	$("#txtl").hide();
	var location=null;
	var yer=null;
	$('#year').change(function() {
		
		var option1 = $("#year option:selected").text();
		 yer = $("#year option:selected").text();
		sampleRegNo = yer + location.substring(0,2).toUpperCase() + "0001";
		$('#sample').show();
		$('#exampleTxt').show();
		$("#txtf").show();
		$("#saveInfo").show();
		$("#nobtn").show();
		$("#sample").addClass("body-bold-text-12px");
		$('#sample').html(sampleRegNo);
		
	});
	
	$('#location').change(function() {
		location = $("#location option:selected").text();
		var sampleRegNo = null;
		if(location=="Location"){
		$('#year').hide();
		$('#selectYear').hide();
		$('#exampleTxt').hide();
		
		}
		else{
			
			
			$('#year').show();
			$('#selectYear').show();
			
			
		}
       
	});
	
	makeRegNo = function (){
		
	      
		$.ajax({
				type: "POST",
				url: "/student/control/admin/adminCtrl.jsp",
				data: {action: "makeRegNo" , location: location,yer: yer},
				time: 10000,
				dataType: "json",
				cache: false,
				success: function(data){
					$("#response").show();
					$("#response").html(data.msg);
					$("#busyActivate").hide();
					alert("Successfully Changed");
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
	
	
	$("#saveInfo").click(function() {
		makeRegNo();
	});
	

	 
});
function myFunction() {
    $("#saveInfo").hide();
    $("#txtf").hide();
    $("#nobtn").hide();
    $('#sample').hide();
    $('#exampleTxt').hide();
    $("#saveReg").show();
    $("#regNof").show();
    $("#loct").show();
    $("#txtl").show();
    document.getElementById("regNof").value = sampleRegNo.substring(0,4);
    document.getElementById("loct").value = sampleRegNo.substring(4,6);
}
function changeReg(){
	 var location 	= sampleRegNo.substring(4,6);
	    var yer 	= $('#regNof').val();
	$.ajax({
			type: "POST",
			url: "/student/control/admin/adminCtrl.jsp",
			data: {action: "makeRegNo" , location: location,yer: yer},
			time: 10000,
			dataType: "json",
			cache: false,
			success: function(data){
				$("#response").show();
				$("#response").html(data.msg);
				$("#busyActivate").hide();
				alert("Successfully Changed");
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

<script>


</script>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0"  bgcolor="#81BEF7" >
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
            <td class="title-14px">Generate Registration No</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>
            <table id="stepOne" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td class="body-bold-text-12px">Select Location:</td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                  <td class="body-bold-text-12px" >
					<select name="location" id="location" class="dropdown">
									<option value="Location">Location</option>
									  <option value="Matara">Matara</option>
									  <option value="Tangalle">Tangalle</option>
									  <option value="Thissa">Thissa</option>
									  <option value="Embilipitiya">Embilipitiya</option>
								</select>
				</td>
                  <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="2" class="body-bold-text-12px"><div id="dispalyRegNo" ></div><div id="tmpReg" ></div></td>
              </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
             <tr>
                <td class="body-bold-text-12px" id ="selectYear">Select Year :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
				                 <td>
				                 <select name="year" id="year" class="dropdown">
				                 	  <option value="yer">Year</option>
									  <option value="2013">2013</option>
									  <option value="2014">2014</option>
									  <option value="2015">2015</option>
									  <option value="2016">2016</option>
								</select>
								 </td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
             <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px" id= "exampleTxt">Example (Registration No) :</td>
                 <td><div  id="sample" ></div></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="4" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
               <td class="body-bold-text-12px" id="txtf">Do you like to make this default ? </td>
                <td><a href="#" id="saveInfo" name="saveInfo" class="button">Yes</a></td>
                <td id="nobtn"><a href="#" id="saveInfo" name="saveInfo" class="button" onClick="myFunction()">No</a></td>
                <td></td>
               </tr>
               <tr>
               <td class="body-bold-text-12px" id="txtl">Change the number</td>
                </tr>
                
                <tr>
                 <td class="body-bold-text-12px">&nbsp;</td>
                <td><input name="regNof" type="text"  id="regNof" size="8"></td>
             	
             
                <td><a href="#" id="saveReg" name="saveInfo" class="button" onclick="changeReg()">Save</a></td>
			    <td>&nbsp;</td>
			    
			    <td><div id="#response"> </div></td>
			    <td><div id="busyActivate"> <img src="/student/themes/default/images/common/loading.gif"></div></td>
			  </tr>
			  <tr>
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
