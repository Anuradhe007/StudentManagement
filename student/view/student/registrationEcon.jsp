<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.*,
    		com.student.user.*,
    		com.student.exception.*"
	errorPage="/view/error.jsp" buffer="8kb"%>
<%
	User user = (User) session.getAttribute("user");
	if ((user == null) || (user.getUserName() == null)) {
		throw new UserVerificationException(new Exception(
				"You are not logged in"),
				"/student/view/login/login.html");
	}
	
	
	String message = (request.getParameter("MSG")!=null?request.getParameter("MSG").toString():"");
	
	System.out.println("XXXXXXXXXXXXXXXX"+message);
%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<!-- InstanceBegin template="/Templates/main.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- InstanceBeginEditable name="doctitle" -->

<title>Student Management System</title>
<link href="../../themes/default/css/css.css" rel="stylesheet"
	type="text/css">
<link href="../../themes/default/css/bootstrap.css" rel="stylesheet"
	type="text/css">
<link href="../../themes/default/css/default.css" rel="stylesheet"
	type="text/css">
	<link href="../../themes/default/css/popup.css" rel="stylesheet"
	type="text/css">
<link href="/student/themes/default/css/default.css" rel="stylesheet"
	type="text/css">
<link type="text/css"
	href="/student/scripts/jquery/themes/base/ui.all.css" rel="stylesheet" />
<script type="text/javascript" src="/student/scripts/jquery/jquery.js"></script>
<script type="text/javascript"
	src="/student/scripts/jquery/jquery.form.js"></script>
<script type="text/javascript"
	src="/student/scripts/jquery/jsDatePick.min.1.3.js"></script>
<link href="/student/themes/default/css/jsDatePick_ltr.min.css"
	rel="stylesheet" type="text/css">

<script type="text/javascript"
	src="/student/scripts/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript"
	src="/student/scripts/menu/jqueryslidemenu.js"></script>
<script type="text/javascript"
	src="/student/scripts/jquery/jquery.AddIncSearch.js"></script>
<script type="text/javascript"
	src="/student/scripts/jquery/ui/ui.core.js"></script>
<script type="text/javascript"
	src="/student/scripts/jquery/ui/ui.dialog.js"></script>
<script type="text/javascript"
	src="/student/scripts/jquery/external/bgiframe/jquery.bgiframe.js"></script>
<script type="text/javascript"
	src="/student/scripts/jquery/ui/ui.datepicker.js"></script>

<script type="text/javascript">
   
    $(document).ready( function() {
   
        // When site loaded, load the Popupbox First
         
        
    });
</script>    



<script>
	function dispalyPhoto() {
		document.getElementById("filess").innerHTML = "<img src='"+document.r.files.value+"' width='150' height='150'>"
		return true;
	}
	
	
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
	
	

	$(document)
			.ready(
					function() {
						
						
						
						unloadPopupFullName();
				         unloadPopupAddress();
				         unloadPopupNIC();
				       
				       
				        $('#fullName').click( function() {
				        	loadPopupFullName();
				        	unloadPopupFullNameWarning();
				        	unloadPopupAddress();
				        });

				        function unloadPopupFullName() {    // TO Unload the Popupbox
				            $('#popup_fullName').fadeOut(3000);
				           
				        }   
				       
				        function loadPopupFullName() {    // To Load the Popupbox
				            $('#popup_fullName').fadeIn(3000);
				                   
				        } 
				        
				        
				        function unloadPopupFullNameWarning() {    // Unload the Full Name Warning 
				            $('#popup_fullName_warning').fadeOut(3000);
				           
				        }   
				       
				        function loadPopupFullNameWarning() {    // Load the Full Name Warning
				            $('#popup_fullName_warning').fadeIn(3000);
				                   
				        } 
				        
				        
				        
				       function unloadPopupAddress() {    // TO Unload the Popupbox
				            $('#popup_address').fadeOut(3000);
				           
				        }   
				       
				        function loadPopupAddress() {    // To Load the Popupbox
				            $('#popup_address').fadeIn(3000);
				                   
				        } 
				        
				        function unloadPopupAddressWarning() {    // Unload the Full Name Warning 
				            $('#popup_address_warning').fadeOut(3000);
				           
				        }   
				       
				        function loadPopupAddressWarning() {    // Load the Full Name Warning
				            $('#popup_address_warning').fadeIn(3000);
				           
				        }
				        $('#address').click( function() {
				        	loadPopupAddress();
				        	 unloadPopupFullName();
				        	 unloadPopupNIC();
				        	 unloadPopupAddressWarning();
				        });

				       
				        
				        
				        
				      

				    	function unloadPopupNIC() { // TO Unload the NIC Popupbox
				    		$('#popup_nic').fadeOut(3000);
				    		$('#popup_nic').hide();

				    	}

				    	function loadPopupNIC() { // To Load the NIC Popupbox

				    		$('#popup_nic').show(3000);
				    		$('#popup_nic').fadeIn(3000);

				    	}
				    	
				    	function unloadPopupNICWarning() {    // Unload the Full Name Warning 
				            $('#popup_nic_warning').fadeOut(3000);
				           
				        }   
				       
				        function loadPopupNICWarning() {    // Load the Full Name Warning
				            $('#popup_nic_warning').fadeIn(3000);
				           
				        }
				        
				    	
				    	   $('#nicNo').click( function() {
				           	loadPopupNIC();
				            unloadPopupFullName();
				            unloadPopupAddress();
				            
				           });

						
				    	   
				    	   function unloadPopupEmail() {    // TO Unload the Popupbox
					            $('#popup_email').fadeOut(3000);
					           
					        }   
					       
					        function loadPopupEmail() {    // To Load the Popupbox
					            $('#popup_email').fadeIn(3000);
					                   
					        } 
					        
					        function unloadPopupEmailWarning() {    // Unload the Full Name Warning 
					            $('#popup_email_warning').fadeOut(3000);
					           
					        }   
					       
					        function loadPopupEmailWarning() {    // Load the Full Name Warning
					            $('#popup_email_warning').fadeIn(3000);
					           
					        }
					        
					        
					        
					        
					        function unloadPopupPhoneNo() {    // TO Unload the Popupbox
					            $('#popup_phoneno').fadeOut(3000);
					           
					        }   
					       
					        function loadPopupPhoneNo() {    // To Load the Popupbox
					            $('#popup_phoneno').fadeIn(3000);
					                   
					        } 
					        
					        function unloadPopupPhoneNoWarning() {    // Unload the Full Name Warning 
					            $('#popup_phoneno_warning').fadeOut(3000);
					           
					        }   
					       
					        function loadPopupPhoneNoWarning() {    // Load the Full Name Warning
					            $('#popup_phoneno_warning').fadeIn(3000);
					           
					        }
					        
					        
					        
					        
				    	   
						
						

						function getBirthDayFromNIC(nic) {

							var year = nic.substring(0, 2);
							var dte = parseInt(nic.substring(2, 5));
							var gender = "";
							var bday = "";
							var month = "";

							if (dte > 500) {
								dte = dte - 500;
								gender = "Female";
							} else {
								gender = "Male";
							}

							if (dte < 31) {
								bday = dte;
								month = "JAN";
							} else if (dte < 60) {
								bday = dte - 31;
								month = "FEB";
							} else if (dte < 91) {
								bday = dte - 60;
								month = "MAR";
							} else if (dte < 121) {
								bday = dte - 91;
								month = "APR";
							} else if (dte < 152) {
								bday = dte - 121;
								month = "MAY";
							} else if (dte < 182) {
								bday = dte - 152;
								month = "JUN";
							} else if (dte < 213) {
								bday = dte - 182;
								month = "JUL";
							} else if (dte < 244) {
								bday = dte - 213;
								month = "AUG";
							} else if (dte < 274) {
								bday = dte - 244;
								month = "SEP";
							} else if (dte < 305) {
								bday = dte - 274;
								month = "OCT";
							} else if (dte < 335) {
								bday = dte - 305;
								month = "NOV";
							} else if (dte < 366) {
								bday = dte - 335;
								month = "DEC";
							}

							if (year < 13) {
								year = "20" + year;
							} else {
								year = "19" + year;
							}
							if(bday<10){
								bday = "0"+bday;
							}
							
							document.getElementById('initials').value =bday+"-"+month+"-"+year;
							document.getElementById('lastName').value = gender;
							

						}

						$("#busyActivate").hide();
						$('#regComp').hide();
						$("#nicNo").focusin(function() {
							loadPopupNIC();
							unloadPopupNICWarning();
							$(this).css("background-color", "#CEE3F6");
						});

						$("#nicNo").focusout(function() {
							
							$(this).css("background-color", "#E0ECF8");
							var nic = $('#nicNo').val();
							getBirthDayFromNIC(nic);
							unloadPopupNIC();
							if (validateEmpty(nic)) {
								$("#validateNIC").html(" ");
								if (nic.length != 10) {
									loadPopupNICWarning();
									$("#validateNIC").html("");
								} else {
									unloadPopupNICWarning();
									$("#validateNIC").html(" ");
									//checkNicAvailability();
								}
							}

						});

						// Full Name  
						$("#fullName").focusin(function() {
							//$(this).css("background-color", "#CEE3F6");
						});
						$("#fullName").focusout(
								
								function() {
									
									//$(this).css("background-color", "#E0ECF8");
									var fullName = $("#fullName").val();
									if (validateEmpty(fullName)) {
										unloadPopupFullName();
										$("#validateFullName").html(" ");
									} else {
										loadPopupFullNameWarning();
										$("#validateFullName").html(
												"");
										
									}
									
									var myArray = fullName.split(" ");
									var initials = "";
									var i=0
									for(i=0;i<myArray.length-1;i++){
										initials = initials + myArray[i].charAt(0) + " ";
									}
									initials = initials+myArray[i];
									
									document.getElementById('myInitials').value =initials.toUpperCase();

								});

						// Last Name
						$("#lastName").focusin(function() {
							$(this).css("background-color", "#CEE3F6");
						});
						$("#lastName").focusout(
								function() {
									$(this).css("background-color", "#E0ECF8");
									var fullName = $("#lastName").val();
									if (validateEmpty(fullName)) {
										$("#validateLastName").html(" ");
										
									} else {
										
										$("#validateLastName").html(""
												);
									}

								});

						// Initials

						$("#initials").focusin(function() {
							new JsDatePick({
								useMode : 2,
								target : "initials",
								dateFormat : "%d-%M-%Y"

							});
							$(this).css("background-color", "#CEE3F6");
							getBirthDayFromNIC($("#nicNo").val());
							$("#initials").html("GGGGGGGGGGG");

							var initial = $("#initials").val();
							if (validateEmpty(initial)) {
							
							} else {
								$("#initials").html("GGGGGGGGGGG");
							}

						});
						$("#initials").focusout(
								function() {
									$(this).css("background-color", "#E0ECF8");
									var fullName = $("#initials").val();
									if (validateEmpty(fullName)) {
										$("#validateInitial").html(" ");
									} else {
										$("#validateInitial").html(
												"");
									}
								});

						//Address

						$("#address").focusin(function() {
							loadPopupAddress();
							$(this).css("background-color", "#CEE3F6");
						});
						$("#address").focusout(
								function() {
									unloadPopupAddress();
									$(this).css("background-color", "#E0ECF8");
									var fullName = $("#address").val();
									if (validateEmpty(fullName)) {
										unloadPopupAddressWarning();
										$("#validateAddress").html(" ");
									} else {
										loadPopupAddressWarning();
										$("#validateAddress").html(
												" ");
									}

								});

						// District

						$("#district").focusin(function() {
							$(this).css("background-color", "#CEE3F6");
						});
						$("#district").focusout(function() {
							$(this).css("background-color", "#E0ECF8");
						});

						// PhoneNo

						$("#phone").focusin(function() {
							loadPopupPhoneNo();
							unloadPopupPhoneNoWarning();
							$(this).css("background-color", "#CEE3F6");
						});
						$("#phone").focusout(function() {
							unloadPopupPhoneNo();
							$(this).css("background-color", "#E0ECF8");
							var txtPhone = $("#phone").val();
							if (validatePhone(txtPhone)) {
								unloadPopupPhoneNoWarning();
								$("#validatePhone").html("");
							}
							else{
								loadPopupPhoneNoWarning();
							}

						});

						// Email 

						$("#email").focusin(function() {
							loadPopupEmail();
							unloadPopupEmailWarning();
							$(this).css("background-color", "#CEE3F6");
						});
						$("#email").focusout(function() {
							unloadPopupEmail();
							$(this).css("background-color", "#E0ECF8");
							var email = $('#email').val();
							validateEmail(email);

						});

						$("#saveInfo").click(function() {
							savePersonalInfo();
						});

						//Email Validation
						function validateEmail(emailaddress) {
							if (emailaddress != null) {
								var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
								if (!emailReg.test(emailaddress)) {
									loadPopupEmailWarning();
									$("#validateEmail").html(
											"Please enter valid email ");
								} else {
									unloadPopupEmail();
									$("#validateEmail").html(" ");
								}
							}
						}

						function validatePhone(txtPhone) {
							var a = txtPhone;
							var filter = /^[0-9-+]+$/;
							if (filter.test(a)) {
								if ((a.length < 10) || (a.length > 11)) {
									return false;
								} else {
									return true;
								}
								if ((a.length == 10) ) {
									
								    return true
								}
							} else {
								return false;
							}
						}

						function validateEmpty(txt) {
							var a = txt;

							if ((a.length < 1)) {
								return false;
							} else {
								return true;
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

					});

	checkNicAvailability = function() {

		var nic = $('#nicNo').val();
		$.ajax({
			type : "POST",
			url : "/student/control/registration/registrationCtrl.jsp",
			data : {
				action : "checkNIC",
				NIC : nic
			},
			time : 10000,
			dataType : "json",
			cache : false,
			success : function(data) {
				$("#response").show();
				$("#response").html(data.msg);
				$("#busyActivate").hide();
				$('#dispalyRegNo').show();
				$('#dispalyRegNo').html("");
				if (data.status == "OK") {
					$("#dispalyRegNo").addClass("error-bold-text-11px");
					$('#dispalyRegNo').html(
							"Your Registration Number : " + data.regNo);
					$('#tmpReg').html(data.regID);
				}
			},
			error : function(data) {
				$("#response").addClass("error-bold-text-11px");
				$("#response").html("Oops!, Something went wrong!");
				$("#response").removeClass("error-bold-text-11px");
				$("#busyActivate").hide();
			},
			beforeSend : function(data) {
				$("#busyActivate").show();

			}
		});

	}
	savePersonalInfo = function() {

		var fullName 	= $('#fullName').val();
		var initials 	= $('#initials').val();
		var lastName 	= $('#lastName').val();
		var nic 		= $('#nicNo').val();
		var address 	= $('#address').val();
		var district 	= $('#district').val();
		var phoneNo 	= $('#phone').val();
		var email 		= $('#email').val();
		var fName 		= $('#fName').val();
		var fJob 		= $('#fJob').val();
		var fPhone 		= $('#fPhone').val();
		var mName 		= $('#mName').val();
		var mJob 		= $('#mJob').val();
		var mPhone 		= $('#mPhone').val();
		var stream 		= $('#stream').val();
		var school		= $('#school').val();
		var regNo 		= $('#dispalyRegNo').html();
		
		regNo = regNo.substring(27, 37);
		$.ajax({
			type : "POST",
			url : "/student/control/registration/registrationCtrl.jsp",
			data : {
				action : "saveInfo",
				fullName : fullName,
				initials : initials,
				lastName : lastName,
				nic : nic,
				address : address,
				district : district,
				phoneNo : phoneNo,
				email : email,
				regNo : regNo,
				fName : fName,
				fJob : fJob,
				fPhone : fPhone,
				mName : mName,
				mJob : mJob,
				mPhone : mPhone,
				stream : stream,
				school	:school
			},
			time : 10000,
			dataType : "json",
			cache : false,
			success : function(data) {
				$("#response").show();
				$("#response").html(data.msg);
				$("#busyActivate").hide();
				$('#dispalyRegNo').show();
				$('#fullName').val("");
				$('#initials').val("");
				$('#lastName').val("");
				$('#nicNo').val("");
				$('#address').val("");
				$('#phone').val("");
				$('#email').val("");
				$('#fName').val("");
				$('#fJob').val("");
				$('#fPhone').val("");
				$('#mName').val("");
				$('#mJob').val("");
				$('#mPhone').val("");
				$('#fullName').html("jjjjjjj");
				$('#initials').html("jjjjjjjj");
				$('#lastName').html("");
				$('#nicNo').html("");
				
				////////////////////////////////////////
				
				$("#imageform").attr("action", "/student/view/upload.jsp?regisNo=" + data.regNo+ "&nbsp;msg="+data.msg);
    			$("#imageform").submit();
				
				//$("#regisNo").val(data.msg);
				//$("#imageform").submit();
				//////////////////////////////////////////
				//alert(data.msg);
				if (data.status == "OK") {
					$("#dispalyRegNo").addClass("error-bold-text-11px");
					
					$('#regComp').html(data.msg);
				}
			},
			error : function(data) {
				$("#response").addClass("error-bold-text-11px");
				$("#response").html("Successfully Saved");
				$("#response").removeClass("error-bold-text-11px");
				$("#busyActivate").hide();
			},
			beforeSend : function(data) {
				$("#busyActivate").show();
				$('#regComp').hide();

			}
		});
		
		

	}

	uploadImage = function() {
		var nic = $('#nicNo').val();
		alert(nic);
		$.ajax({
			type : "POST",
			url : "/student/view/upload.jsp",
			data : {
				action : "checkNIC",
				NIC : nic
			},
			time : 10000,
			dataType : "html",
			cache : false,
			success : function(data) {
				$("#response").show();
				alert(data.vera);
				$("#response").html(data.vera);
				$("#busyActivate").hide();
			},
			error : function(data) {
				$("#response").addClass("error-bold-text-11px");
				$("#response").html("Oops!, Something went wrong!");
				$("#response").removeClass("error-bold-text-11px");
				$("#busyActivate").hide();
			},
			beforeSend : function(data) {
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

	////////popup box//////////////

	

	
	////////////popup box/////////////
</script>
<script src="/student/scripts/jquery/tabs_old.js"></script>
<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'UA-1332079-8' ]);
	_gaq.push([ '_trackPageview' ]);

	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
</script>
<link href="/student/themes/default/css/tab_style.css" rel="stylesheet"
	type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="jquery,ui,easy,easyui,web">
<meta name="description"
	content="easyui help you build your web page easily!">
<title>jQuery EasyUI Demo</title>
<link rel="stylesheet" type="text/css"
	href="/student/themes/default/css/easyui.css">
<link rel="stylesheet" type="text/css"
	href="/student/themes/default/css/icon.css">
<script type="text/javascript"
	src="/student/scripts/menu/jquery-1.4.4.min.js"></script>
<script type="text/javascript"
	src="/student/scripts/menu/jquery.easyui.min.js"></script>
<script>
	$(window).load(function() {
		addTab('google', 'http://www.google.com');
		addTab('jquery', 'http://jquery.com/');
	});

	function addTab(title, url) {
		if ($('#tt').tabs('exists', title)) {
			$('#tt').tabs('select', title);
		} else {
			var content = '<iframe scrolling="auto" frameborder="0"  src="'
					+ url + '" style="width:100%;height:100%;"></iframe>';
			$('#tt').tabs('add', {
				title : title,
				content : content,
				closable : true
			});
		}
	}
</script>
<link rel="stylesheet" href="table.css" type="text/css" />
</head>
<body>






	<table width="100%" height="100%" border="0" cellspacing="0"
		cellpadding="0" bgcolor="#81BEF7">
		<!-- header blue#08088A -->
		<tr>
			<td height="75px"></td>
			<td valign="bottom"><table width="100%" border="0"
					cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								bgcolor="#CEE3F6">
								<tr>
									<td colspan="3"><img
										src="/student/themes/default/images/common/header.jpg"
										height="120" width="800"></td>
								</tr>
								<tr>
									<td align="left" valign="bottom">
										<!-- InstanceBeginEditable name="title-region" -->
										<span class="title-17px">Student Management System </span>
									<!-- InstanceEndEditable -->
									</td>
									<td align="right" valign="bottom">
										<!-- InstanceBeginEditable name="userstatus-region" -->
										<span class="user">You are logged in as <%=user.getUserName()%></span>
									<!-- InstanceEndEditable -->
									</td>
									<td align="right" valign="bottom">
										<!-- InstanceBeginEditable name="userstatus-region" -->
										<a href="/student/view/login/login.html"><span
											class="logout">Sign out </span></a>
									<!-- InstanceEndEditable -->
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="6px" bgcolor="#08088A"></td>
						<!-- header boder above menu -->
					</tr>
					<tr>
						<td height="30px" bgcolor="#CEE3F6">
							<!-- InstanceBeginEditable name="menu-region" --><jsp:include
								page="/view/menu.jsp" flush="true" /><!-- InstanceEndEditable -->
						</td>
					</tr>
				</table></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td bgcolor="#81BEF7">&nbsp;</td>
			<!-- LEft Side Color  -->
			<td align="left" valign="top">
				<!-- InstanceBeginEditable name="body-region" -->
				<div id="personalInfo" class="body-bold-text-12px">
					<table width="100%" height="100%" border="0" cellspacing="0"
						cellpadding="0" bgcolor="#CEE3F6">
						<tr>
							<td colspan="3" height="20px"></td>
						</tr>
						<tr >
							<td width="10px">&nbsp;</td>
							<td align="left" valign="top"><table width="100%" border="0"
									cellspacing="0" cellpadding="0">
									<tr>
										<td class="title-14px">Student Registration Form</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td colspan="7"><img
											src="/student/themes/default/images/common/sub_table_dot_div.gif"></td>
									</tr>

									<tr>
										<td>
											<table id="stepOne" border="0" cellpadding="0"
												cellspacing="0">
												<tr>
													<td colspan="7" height="10px"></td>
												</tr>
												<tr height="40px">
													<div id="response" class="body-bold-text-12px"></div>
													<br>
													<td class="body-bold-text-12px">Full Name :</td>
													<td class="body-bold-text-12px">&nbsp;<b>*</b></td>
													<td class="body-bold-text-12px" height="20"><input
														name="fullName" 
														type="text" width="500" id="fullName" onblur="javascript:{this.value = this.value.toUpperCase(); }"></td>
													<td height="20px"><div id="popup_fullName">    <!-- OUR PopupBox DIV-->
    Eg. Veranga Sooriyabandara Pallawela
      
</div><div id="popup_fullName_warning">Full Name Cannot be Empty </div></td>
													<td colspan="2" class="body-bold-text-12px"><div
															id="validateFullName" class="body-bold-text-12px"></div></td>

												</tr>
												
												
												<tr>
													<td colspan="7" height="20px"></td>
												</tr>
												<tr>
													<td class="body-bold-text-12px">Name with Initials :</td>
													<td class="body-bold-text-12px">&nbsp;</td>
													<td><input name="nic" type="text" class="input"
														id="myInitials"></td>
													<td>  
 
      

      </td>
													<td class="body-bold-text-12px"></td>
													<td colspan="3" class="body-bold-text-12px">
														</td>

												</tr>
												
												
												

												<tr>
													<td colspan="7" height="10px"></td>
												</tr>

												<tr height="40px" >
													<td class="body-bold-text-12px">Address :</td>
													<td class="body-bold-text-12px">&nbsp;<b>*</b></td>
													<td><input name="address" class="input-large"
													type="text" 
														id="address" onblur="javascript:{this.value = this.value.toUpperCase(); }"></td>
													<td height="20px"><div id="popup_address">    
    Eg. No: 66 Town Hall , Elakiri Lane , Colombo 07.
      
</div><div id="popup_address_warning">Address  Cannot be Empty </div></td>
													<td colspan="3" ><div
															id="validateAddress" class="body-bold-text-12px"></div></td>
												</tr>
												<tr>
													<td colspan="7" height="20px"></td>
												</tr>
												<tr>
													<td class="body-bold-text-12px">NIC :</td>
													<td class="body-bold-text-12px">&nbsp;</td>
													<td><input name="nic" type="text" class="input"
														id="nicNo"></td>
													<td><div id="popup_nic">   
    Eg. 123456789V
      
</div><div id="popup_nic_warning">   
    Invalid NIC.
      
</div></td>
													<td class="body-bold-text-12px"></td>
													<td colspan="3" class="body-bold-text-12px"><div
															id="validateNIC" class="body-bold-text-12px"></div>
														<div id="dispalyRegNo" class="body-bold-text-12px"><%=message %></div></td>

												</tr>
												<tr>
													<td colspan="7" height="10px"></td>
												</tr>
												<tr height="40px">
													<td class="body-bold-text-12px">Birthday :</td>
													<td class="body-bold-text-12px">&nbsp;<b>*</b></td>
													<td><input name="initials" type="text" class="input"
														id="initials"/></td>
													<td class="body-bold-text-12px">&nbsp;</td>
													<td colspan="3" class="body-bold-text-12px"><div
															id="validateInitial" class="body-bold-text-12px"></div></td>
												</tr>
												<tr>
													<td colspan="7" height="10px"></td>
												</tr>
												<tr height="40px">
													<td class="body-bold-text-12px">Gender :</td>
													<!-- Last Name Replace as Gender -->
													<td class="body-bold-text-12px">&nbsp;<b>*</b></td>
													<td><select name="lastName" type="text" class="input"
														id="lastName">
															<option id="First" name="First">I am ..</option>
															<option id="Male" name="Male">Male</option>
															<option id="Female" name="Female">Female</option>
													</select></td>
													<td class="body-bold-text-12px">&nbsp;</td>
													<td colspan="3" class="body-bold-text-12px"><div
															id="validateLastName" class="body-bold-text-12px"></div></td>
													<!--    <td><input name="lastName" type="text" class="input" id="lastName" ></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px"><div id="validateLastName"  class="body-bold-text-12px"></div></td>
                 
                 -->
												</tr>
												<tr>
													<td colspan="7" height="10px"></td>
												</tr>
												<tr height="40px">
													<td class="body-bold-text-12px">Email :</td>
													<td class="body-bold-text-12px">&nbsp;</td>
													<td><input name="email" type="text" class="input"
														id="email" onblur="javascript:{this.value = this.value.toUpperCase(); }"></td>
													<td class="body-bold-text-12px">&nbsp;</td>
													<td colspan="3" class="body-bold-text-12px"><div id="popup_email">   
    Eg. vsooriyabandara@gmail.com
      
</div><div id="popup_email_warning">   
    Invalid Email .
      
</div></td>
												</tr>
												<tr>
													<td colspan="7" height="10px"></td>
												</tr>

												<tr height="40px">
													<td class="body-bold-text-12px">Phone No :</td>
													<td class="body-bold-text-12px">&nbsp;</td>
													<td><input name="phone" type="text" class="input"
														id="phone"></td>
													<td class="body-bold-text-12px">&nbsp;</td>
													<td colspan="3" class="body-bold-text-12px">
													<div id="popup_phoneno">   
    Eg. 0777123456
      
</div><div id="popup_phoneno_warning">   
    Invalid Phone Number .
      
</div>
													</td>
												</tr>

												<tr>
													<td colspan="7" height="10px"></td>
												</tr>

												<tr height="40px">
													<td class="body-bold-text-12px">School :</td>
													<td class="body-bold-text-12px">&nbsp;</td>
													<td><input name="school" type="text" class="input"
														id="school" onblur="javascript:{this.value = this.value.toUpperCase(); }"></td>
													<td class="body-bold-text-12px">&nbsp;</td>
													<td colspan="3" class="body-bold-text-12px">
													
													</td>
												</tr>
												<tr>
													<td colspan="7" height="10px"></td>
												</tr>
												<tr height="40px">
													<td class="body-bold-text-12px">District :</td>
													<td class="body-bold-text-12px">&nbsp;<b>*</b></td>
													<td><select name="district" id="district"
														class="dropdown" width="500">
															<option value="District">District</option>
															<option value="Galle">Galle</option>
															<option value="Hambantota">Hambantota</option>
															<option value="Matara">Matara</option>
															<option value="Ratnapura">Ratnapura</option>
														</select></td>
													<td class="body-bold-text-12px">&nbsp;</td>
													<td colspan="2" class="body-bold-text-12px">&nbsp;</td>
												</tr>

												<tr>
													<td colspan="7" height="10px"></td>
												</tr>
												<tr height="40px">
													<td class="body-bold-text-12px">A/L Stream :</td>
													<td class="body-bold-text-12px">&nbsp;</td>

													<td><select name="stream" id="stream" class="dropdown">
															<option value="stream">stream</option>
															<option value="Agriculture">Agriculture</option>
															<option value="Art">Art</option>
															<option value="Commerce">Commerce</option>
															<option value="ICT">ICT</option>
															<option value="Languages">Languages</option>
															<option value="Mathematics">Mathematics</option>
															<option value="Science">Science</option>
													</select></td>



													<td class="body-bold-text-12px">&nbsp;</td>
													<td colspan="3" class="body-bold-text-12px">&nbsp;</td>
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td colspan="7"><img
														src="/student/themes/default/images/common/sub_table_dot_div.gif"></td>
												</tr>
												<tr>
												<tr>
													<td>&nbsp;</td>
												</tr>

												<tr>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td class="body-bold-text-12px">Parents Information</td>
												</tr>
												<tr>
													<td colspan="7" height="10px"></td>
												</tr>
												<tr height="40px">
													<td class="body-bold-text-12px">Father's Name :</td>
													<td class="body-bold-text-12px">&nbsp;</td>
													<td><input name="fName" type="text" class="input"
														id="fName" onblur="javascript:{this.value = this.value.toUpperCase(); }"></td>
													<td class="body-bold-text-12px">&nbsp;</td>
													<td colspan="3" class="body-bold-text-12px">&nbsp;</td>
												</tr>
												<tr>
													<td colspan="7" height="10px"></td>
												</tr>
												<tr height="40px">
													<td class="body-bold-text-12px">Father's Job :</td>
													<td class="body-bold-text-12px">&nbsp;</td>
													<td><input name="fJob" type="text" class="input"
														id="fJob" onblur="javascript:{this.value = this.value.toUpperCase(); }"></td>
													<td class="body-bold-text-12px">&nbsp;</td>
													<td colspan="3" class="body-bold-text-12px">&nbsp;</td>
												</tr>
												<tr>
													<td colspan="7" height="10px"></td>
												</tr>
												<tr height="40px">
													<td class="body-bold-text-12px">Father's PhoneNo :</td>
													<td class="body-bold-text-12px">&nbsp;</td>
													<td><input name="fPhone" type="text" class="input"
														id="fPhone"></td>
													<td class="body-bold-text-12px">&nbsp;</td>
													<td colspan="3" class="body-bold-text-12px">&nbsp;</td>
												</tr>
												<tr>
													<td colspan="7" height="10px"></td>
												</tr>
												<tr height="40px">
													<td class="body-bold-text-12px">Mother's Name :</td>
													<td class="body-bold-text-12px">&nbsp;</td>
													<td><input name="mName" type="text" class="input"
														id="mName" onblur="javascript:{this.value = this.value.toUpperCase(); }"></td>
													<td class="body-bold-text-12px">&nbsp;</td>
													<td colspan="3" class="body-bold-text-12px">&nbsp;</td>
												</tr>
												<tr>
													<td colspan="7" height="10px"></td>
												</tr>
												<tr height="40px">
													<td class="body-bold-text-12px">Mother's Job :</td>
													<td class="body-bold-text-12px">&nbsp;</td>
													<td><input name="mJob" type="text" class="input"
														id="mJob" onblur="javascript:{this.value = this.value.toUpperCase(); }"></td>
													<td class="body-bold-text-12px">&nbsp;</td>
													<td colspan="3" class="body-bold-text-12px">&nbsp;</td>
												</tr>
												<tr>
													<td colspan="7" height="10px"></td>
												</tr>
												<tr height="40px">
													<td class="body-bold-text-12px">Mother's PhoneNo :</td>
													<td class="body-bold-text-12px">&nbsp;</td>
													<td><input name="mPhone" type="text" class="input"
														id="mPhone" ></td>
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
												
												
												<!--  <tr>
                <td colspan="7"><img src="/student/themes/default/images/common/sub_table_dot_div.gif"></td>
              </tr>
              -->
												<tr>
													<td colspan="7" height="10px"></td>
												</tr>
												<tr>
													<td class="body-bold-text-12px">Photograph :</td>
													<td class="body-bold-text-12px">&nbsp;</td>
													<td>
														<form id="imageform" method="post"
															enctype="multipart/form-data"
															action='/student/view/upload.jsp'>
															<input type="hidden" id="regisNo"/>
															<input type="file" name="photoimg" id="photoimg"
																class="input"  onchange="readURL(this);" />
														    
														</form>
													</td>
													<td>
														<img id="img_prev" src="#"  /><div id='preview'></div>
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
										<td><a href="#" id="saveInfo" name="saveInfo"
											class="button">Save</a></td>
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
										<td><div id="regComp" class="body-bold-text-12px"></div></td>
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
				</div> <!-- InstanceEndEditable -->
			</td>
			<td bgcolor="#81BEF7">&nbsp;</td>
			<!-- Right Side Color -->
		</tr>
		<tr>
			<td valign="bottom" height="50px">&nbsp;</td>
			<td align="center" valign="top" width="800px">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="6px" bgcolor="#08088A"></td>
						<!-- Foter border -->
					</tr>
					<tr>
						<td height="5px"></td>
					</tr>
					<tr>
						<td><span class="body-text-11px"> 
								. All Rights Reserved.</span></td>
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
