<%@ page import="com.student.regNo.SaveRegNo" %>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- InstanceBeginEditable name="doctitle" -->
<title>Student Management System</title>
<link href="/student/themes/default/css/jsDatePick_ltr.min.css" rel="stylesheet" type="text/css"> 
<link href="../../themes/default/css/default.css" rel="stylesheet" type="text/css"> 
<link href="/student/themes/default/css/default.css" rel="stylesheet" type="text/css"> 
<link type="text/css" href="/student/scripts/jquery/themes/base/ui.all.css" rel="stylesheet" />
<script type="text/javascript" src="/student/scripts/jquery/jquery.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/jquery.form.js"></script>
<style type="text/css">
	html .jqueryslidemenu{height: 1%;} /*Holly Hack for IE7 and below*/
</style>	
<script type="text/javascript" src="/student/scripts/menu/jqueryslidemenu.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/jquery.AddIncSearch.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/ui/ui.core.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/ui/ui.dialog.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/external/bgiframe/jquery.bgiframe.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/ui/ui.datepicker.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/jsDatePick.min.1.3.js"></script>

<script>



function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#img_prev')
            .attr('src', e.target.result)
            .height(100);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

$('#photoimg')
.live(
		'change',
		function() {
			$nicVal = $('#nicNo').val();
			var form_url = $("#imageform")
					.attr("action");
			//changing the action to google.com
			$("#imageform").attr(
					"action",
					"/student/view/upload.jsp?nicVal="
							+ $nicVal);
			//submit the form
			$nicVal = $('#nicNo').val();

			$("#preview").html('');
			$("#preview")
					.html(
							'<img src="loader.gif"/>');
			$("#imageform").ajaxForm({
				target : '#preview'
			}).submit();
		});

//});


$(document).ready(function(){
	$("#busyActivate").hide();
	$('#regComp').hide();
	 $("#nicNo").focusin(function(){
		    $(this).css("background-color","#EBEBEB");
		  });
	  /*  */
	 new JsDatePick({
			useMode:2,
			target:"initials",
			dateFormat:"%d-%M-%Y"
			
		});
	 
	// Full Name  
	$("#fullName").focusin(function(){
		    $(this).css("background-color","#EBEBEB");
		  });
	 $("#fullName").focusout(function(){
		    $(this).css("background-color","#FFFFFF");
		   			
	});
	 
	 // Last Name
	 $("#lastName").focusin(function(){
		    $(this).css("background-color","#EBEBEB");
		  });
	 $("#lastName").focusout(function(){
		    $(this).css("background-color","#FFFFFF");
		   			
	});
	 
	 // Initials
	 
	 $("#initials").focusin(function(){
		    $(this).css("background-color","#EBEBEB");
		  });
	 $("#initials").focusout(function(){
		    $(this).css("background-color","#FFFFFF");
	});
	 
	 //Address
	 
	 $("#address").focusin(function(){
		    $(this).css("background-color","#EBEBEB");
		  });
	 $("#address").focusout(function(){
		    $(this).css("background-color","#FFFFFF");
	});
	 
	 // District
	 
	 $("#district").focusin(function(){
		    $(this).css("background-color","#EBEBEB");
		  });
	 $("#district").focusout(function(){
		    $(this).css("background-color","#FFFFFF");
	});
	 
	 // PhoneNo
	 
	 $("#phone").focusin(function(){
		    $(this).css("background-color","#EBEBEB");
		  });
	 $("#phone").focusout(function(){
		    $(this).css("background-color","#FFFFFF");
	});
	 
	 // Email 
	 
	 $("#email").focusin(function(){
		    $(this).css("background-color","#EBEBEB");
		  });
	 $("#email").focusout(function(){
		    $(this).css("background-color","#FFFFFF");
	});
	
	 //school
		$("#school").focusin(function(){
		    $(this).css("background-color","#EBEBEB");
		  });
	 $("#school").focusout(function(){
		    $(this).css("background-color","#FFFFFF");
		   			
	});
	 
	
});


	
		function  editPersonalInfo(regNo){
			
		    var fullName 	= $('#fullName').val();
		    var initials 	= $('#initials').val();
		    var gender 	= $('#gender').val();
		    var nic		 	= $('#nicNo').val();
		    var address	 	= $('#address').val();
		    var district 	= $('#district').val();
		    var phoneNo 	= $('#phone').val();
		    var email  		= $('#email').val();
		    var fn			= $('#FN').val();
		    var fj			= $('#FJ').val();
		    var fp			= $('#FP').val();
		    var mn			= $('#MN').val();
		    var mj			= $('#MJ').val();
		    var mp			= $('#MP').val();
		    var school			= $('#school').val();
		    var imgName = $('#photoimg').val();
			$.ajax({
					type: "POST",
					url: "/student/control/registration/registrationCtrl.jsp",
					data: {action: "editInfo" , fullName: fullName,initials: initials,gender: gender,nic: nic,address: address,district: district,phoneNo: phoneNo,email: email,regNo: regNo,fn: fn,fj: fj,fp:fp,mn:mn,mj:mj,mp:mp,school:school,imgName:imgName},
					time: 10000,
					dataType: "json",
					cache: false,
					success: function(data){
						$("#response").show();
						$("#response").html(data.msg);
						$("#busyActivate").hide();
						$('#dispalyRegNo').show();
						$('#fullName').html("jjjjjjj");
						$('#initials').html("jjjjjjjj");
						$('#gender').html("");
						$('#nicNo').html("");
						$("#imageform").attr("action", "/student/view/editUpload.jsp?regisNo=" +nic+ "&nbsp;msg="+data.msg);
						$("#imageform").submit();
						if(data.status=="OK"){
						$("#dispalyRegNo").addClass("error-bold-text-11px");	
						$('#regComp').html(data.msg);
						}
					},
					error: function(data){
						$("#response").addClass("error-bold-text-11px");	
						$("#response").html("Oops!, Something went wrong!");
						$("#response").removeClass("error-bold-text-11px");
						$("#busyActivate").hide();
					},
					beforeSend: function(data){
						//$("#busyActivate").show();
						$('#regComp').hide();
				
					} 
				});

	
	
}

	uploadImage = function (){
		var nic = $('#nicNo').val();
		alert(nic);
		$.ajax({
			type: "POST",
			url: "/student/view/upload.jsp",
			data: {
				action: "checkNIC" , 
				NIC: nic
				},
			time: 10000,
			dataType: "html",
			cache: false,
			success: function(data){
				$("#response").show();
				alert(data.vera);
				$("#response").html(data.vera);
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
	
	function submitUpload() {
		$nicVal = $('#nicNo').val();
		var form_url = $("#imageform").attr("action");
		//changing the action to google.com
		$("#imageform").attr("action",
				"/student/view/upload.jsp?nicVal=" + $nicVal);
		//submit the form
		$("#imageform").submit();

		/* 	$('#imageform').submit(function(){ //listen for submit event
		 $('<input>').attr({
		 type: 'hidden',
		 id: 'foo',
		 name: 'foo'
		 }).appendTo('#imageform');
		
		
		 return true;
		 }); */
	}
	
	
	function editNic(id){
		if(id!=$('#nicNo').val()){
			var nic = $('#nicNo').val();
			$.ajax({
			type: "POST",
			url: "/student/control/registration/registrationCtrl.jsp",
			data: {action: "checkNIC" , NIC: nic},
			time: 10000,
			dataType: "json",
			cache: false,
			success: function(data){
				$("#response").show();
				$("#response").html(data.msg);
				$("#busyActivate").hide();
				$('#dispalyRegNo').show();
				$('#dispalyRegNo').html("");
				if(data.status=="OK"){
				$("#dispalyRegNo").addClass("error-bold-text-11px");	
				$('#dispalyRegNo').html("Your Registration Number : "+data.regNo);
				$('#tmpReg').html(data.regID);
				}
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
		
	}	
	
	

</script>
<script src="/student/scripts/jquery/tabs_old.js"></script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-1332079-8']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
<link href="/student/themes/default/css/tab_style.css" rel="stylesheet" type="text/css">
<!-- Jquery Tab  ######################################################################################################################## -->



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="keywords" content="jquery,ui,easy,easyui,web">
	<meta name="description" content="easyui help you build your web page easily!">
	<title>Student Management System</title>
	<link rel="stylesheet" type="text/css" href="/student/themes/default/css/easyui.css">
	<link rel="stylesheet" type="text/css" href="/student/themes/default/css/icon.css">
	<script type="text/javascript" src="/student/scripts/menu/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="/student/scripts/menu/jquery.easyui.min.js"></script>
	
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
              <td align="left" valign="bottom"><!-- InstanceBeginEditable name="title-region" --><span class="title-17px">Student Management System </span><!-- InstanceEndEditable --></td>
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
    
    
<%
		String id = request.getParameter("id");
		String url=null;		
		 
		Student student=null;
		
		if(id!=null){
			StudentManager studentManager=StudentManager.getInstance();
			SaveRegNo srgn = new SaveRegNo();
			
			student=studentManager.getID(id);
			request.setAttribute("student", student);
			url = "/student/ProfPics/"+student.getRegNo()+".jpg";
			
			
			srgn.setRegNo(student.getRegNo());
		}
 if(student!=null){
%>
     <div id="personalInfo">
      <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#CEE3F6">
      <tr>
        <td colspan="3" height="10px"></td>
      </tr>
      <tr>
        <td width="10px">&nbsp;</td>
        <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="title-14px">Edit Student </td>
          </tr>
          <tr>
          <td><br></td>
          </tr>
          <tr>
            <td class="title-14px">Student Registration Number: ${student.regNo}</td>
          </tr>
          <tr>
          <td><br></td>
          </tr>
          <tr>
          <td class="body-bold-text-12px"><div id="response"></div></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
              	<td colspan="7"><img src="/student/themes/default/images/common/sub_table_dot_div.gif"></td>
           </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>
            <table id="stepOne" border="0" cellpadding="0" cellspacing="0" bgcolor="#CEE3F6">
              <tr>
                <td class="body-bold-text-12px">Full Name :</td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                  <td class="body-bold-text-12px" ><input name="fullName" type="text" class="input" id="fullName" value="${student.fullName}"></td>
                  <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="2" class="body-bold-text-12px"><div id="dispalyRegNo" ></div><div id="tmpReg" ></div></td>
              </tr>
              <tr>
                <td colspan="7" height="20px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Date of Birth:</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="initials" type="text" class="input" id="initials" value="${student.initials}" ></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="20px"></td>
              </tr>
             <tr>
                <td class="body-bold-text-12px">Gender :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="gender" type="text" class="input" id="gender" value="${student.sex}" ></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="20px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">NIC :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                <td><input name="nic" type="text" class="input" id="nicNo" value="${student.nic}" ></td>
                <td><div id="busyActivate"> <img src="/student/themes/default/images/common/loading.gif"></div></td>
                 
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="20px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Address :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="address" type="text" class="input" id="address"  value="${student.address}"></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="20px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">District :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="district" type="text" class="input" id="district" value="${student.district}"></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="20px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Phone No :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="phone" type="text" class="input" id="phone" value="${student.telephone}"></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="20px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Email :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="email" type="text" class="input" id="email" value="${student.email}"></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
             <tr>
                <td colspan="7" height="20px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">School :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="school" type="text" class="input" id="school" value="${student.school}"></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="20px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Father's Name :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="email" type="text" class="input" id="FN" value="${student.fatherName}"></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="20px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Father's Phone Number :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="email" type="text" class="input" id="FP" value="${student.fatherPhone}"></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="20px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Father's Job :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="email" type="text" class="input" id="FJ" value="${student.fatherJob}"></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="20px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Mother's Name :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="email" type="text" class="input" id="MN" value="${student.motherName}"></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="20px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Mother's Phone Number :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="email" type="text" class="input" id="MP" value="${student.motherPhone}"></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
             <tr>
                <td colspan="7" height="20px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Mother's Job :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="email" type="text" class="input" id="MJ" value="${student.motherJob}"></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="20px"></td>
              </tr>
              </table>
            </td>	
            <!--  -->
            <%System.out.println(url); %>
            <td><img id="img_prev" src="<%=url%>" height="150" width="150"/><form id="imageform" method="post"
															enctype="multipart/form-data"
															action='/student/view/editUpload.jsp'>
															<input type="hidden" id="regisNo"/>
															<input type="file" name="photoimg" id="photoimg"
																class="input"  onchange="readURL(this);" />
														    
														</form></td>
          </tr>
          <tr>
          <td><a href="#" id="editInfo" name="editInfo" class="button" onclick="editPersonalInfo('${student.regNo}')">Edit</a></td>
      </tr> 
        </table></td>
        <td width="10px">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3" height="10px"></td>
      </tr>
      </table>
      </div>
      
      
<%} %>      
      
      
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
