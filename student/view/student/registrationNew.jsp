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
<link href="../../themes/default/css/default.css" rel="stylesheet" type="text/css"> 
<link href="/student/themes/default/css/default.css" rel="stylesheet" type="text/css"> 
<link type="text/css" href="/student/scripts/jquery/themes/base/ui.all.css" rel="stylesheet" />
<script type="text/javascript" src="/student/scripts/jquery/jquery.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/jquery.form.js"></script>
<style type="text/css">
	html .jqueryslidemenu{height: 1%;} /*Holly Hack for IE7 and below*/
</style>	

<script type="text/javascript" src="/student/scripts/jquery/jquery.AddIncSearch.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/ui/ui.core.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/ui/ui.dialog.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/external/bgiframe/jquery.bgiframe.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/ui/ui.datepicker.js"></script>

<script>
$(document).ready(function(){
	$("#busyActivate").hide();
	$('#regComp').hide();
	 $("#nicNo").focusin(function(){
		    $(this).css("background-color","#EBEBEB");
		  });
	 $("#nicNo").focusout(function(){
		    $(this).css("background-color","#FFFFFF");
		    var nic = $('#nicNo').val();
			 checkNicAvailability();
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
	 
	 $("#saveInfo").click(function() {
		 savePersonalInfo();
	});
	 
	 $('#photoimg').live('change', function()
			 {
			 $("#preview").html('');
			 $("#preview").html('<img src="loader.gif" alt="Uploading...."/>');
			 $("#imageform").ajaxForm(
			 {
			 target: '#preview'
			 }).submit();
	 });
	 
	
});


checkNicAvailability = function (){
	
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
		savePersonalInfo = function (){
			
		    var fullName 	= $('#fullName').val();
		    var initials 	= $('#initials').val();
		    var lastName 	= $('#lastName').val();
		    var nic		 	= $('#nicNo').val();
		    var address	 	= $('#address').val();
		    var district 	= $('#district').val();
		    var phoneNo 	= $('#phone').val();
		    var email  		= $('#email').val();
		    var regNo       = $('#dispalyRegNo').html();
		    	regNo = 			regNo.substring(27,37);
		    
			$.ajax({
					type: "POST",
					url: "/student/control/registration/registrationCtrl.jsp",
					data: {action: "saveInfo" , fullName: fullName,initials: initials,lastName: lastName,nic: nic,address: address,district: district,phoneNo: phoneNo,email: email,regNo: regNo},
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
						$('#lastName').html("");
						$('#nicNo').html("");
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
						$("#busyActivate").show();
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
			data: {action: "checkNIC" , NIC: nic},
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
	<title>jQuery EasyUI Demo</title>
	<link rel="stylesheet" type="text/css" href="/student/themes/default/css/easyui.css">
	<link rel="stylesheet" type="text/css" href="/student/themes/default/css/icon.css">
	<script type="text/javascript" src="/student/scripts/menu/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="/student/scripts/menu/jquery.easyui.min.js"></script>
	<script>
	 $(window).load(function () { 
   		addTab('google','http://www.google.com');
		addTab('jquery','http://jquery.com/');
 });
  
		function addTab(title, url){
			if ($('#tt').tabs('exists', title)){
				$('#tt').tabs('select', title);
			} else {
				var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
				$('#tt').tabs('add',{
					title:title,
					content:content,
					closable:true
				});
			}
		}
	</script>




<!-- Jquery Tab  ######################################################################################################################## -->


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
              <td align="right" valign="bottom"><!-- InstanceBeginEditable name="userstatus-region" --><a href="/student/view/login/login.html"><img src="/student/themes/default/images/common/logout.gif" ></a><!-- InstanceEndEditable --></td>
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
      <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="3" height="10px"></td>
      </tr>
      <tr>
        <td width="10px">&nbsp;</td>
        <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="title-14px">Student Registration Form </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>
            <table id="stepOne" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td class="body-bold-text-12px">Full Name :</td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                  <td class="body-bold-text-12px" ><input name="fullName" type="text" class="input" id="fullName" ></td>
                  <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="2" class="body-bold-text-12px"><div id="dispalyRegNo" ></div><div id="tmpReg" ></div></td>
              </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Initials :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="initials" type="text" class="input" id="initials" ></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
             <tr>
                <td class="body-bold-text-12px">Last Name :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="lastName" type="text" class="input" id="lastName" ></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">NIC :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                <td><input name="nic" type="text" class="input" id="nicNo" ></td>
                <td><div id="busyActivate"> <img src="/student/themes/default/images/common/loading.gif"></div></td>
                 <td class="body-bold-text-12px"><div id="response"></div></td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Address :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="address" type="text" class="input" id="address" ></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">District :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="district" type="text" class="input" id="district" ></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Phone No :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="phone" type="text" class="input" id="phone" ></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Email :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="email" type="text" class="input" id="email" ></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="10px"></td>
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
              <tr>
                <td colspan="7" height="10px"></td>
                </tr>
                <tr>
                <td class="body-bold-text-12px">Photograph :</td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                <td>
               <form id="imageform" method="post" enctype="multipart/form-data" action='/student/view/upload.jsp'>
				 <input type="file" name="photoimg" id="photoimg" />
			</form>
				</td>
				<td>
			<div id='preview'>
			</div>
			</td>
               
                
				</td>
				<td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
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
          <td><a href="#" id="saveInfo" name="saveInfo" class="button">Save</a></td>
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
      	<td><a id="resetIco" href="javascript:newOrder();" class="button">Reset Page</a></td>
      	<td></td>
      </tr> 
      <tr>
        <td colspan="3" height="10px"></td>
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
        <td><span class="body-text-11px">Victory College.</span></td>
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
