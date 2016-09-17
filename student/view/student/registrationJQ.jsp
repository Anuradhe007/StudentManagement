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

	String message = (request.getParameter("MSG") != null ? request
			.getParameter("MSG").toString() : "");

	System.out.println("XXXXXXXXXXXXXXXX" + message);
%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<!-- InstanceBegin template="/Templates/main.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- InstanceBeginEditable name="doctitle" -->

<title>Student Management System</title>

<link rel="stylesheet" href="../../themes/default/css/jquery-ui.css" />
<script src="/student/scripts/jquery/jquery-1.9.1.js"></script>
<script src="/student/scripts/jquery/jquery-ui.js"></script>
<link rel="stylesheet" href="../../themes/default/css/style.css" />
<script>
	$(function() {
		$("#accordion").accordion();
	});
</script>

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
	$(document).ready(function() {

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

			reader.onload = function(e) {
				$('#img_prev').attr('src', e.target.result).height(100);
			};
			reader.readAsDataURL(input.files[0]);
		}
	}

	$(document).ready(
			function() {

				unloadPopupFullName();
				unloadPopupAddress();
				unloadPopupNIC();

				$('#fullName').click(function() {
					loadPopupFullName();
					unloadPopupFullNameWarning();
					unloadPopupAddress();
				});

				function unloadPopupFullName() { // TO Unload the Popupbox
					$('#popup_fullName').fadeOut(3000);

				}

				function loadPopupFullName() { // To Load the Popupbox
					$('#popup_fullName').fadeIn(3000);

				}

				function unloadPopupFullNameWarning() { // Unload the Full Name Warning 
					$('#popup_fullName_warning').fadeOut(3000);

				}

				function loadPopupFullNameWarning() { // Load the Full Name Warning
					$('#popup_fullName_warning').fadeIn(3000);

				}

				function unloadPopupAddress() { // TO Unload the Popupbox
					$('#popup_address').fadeOut(3000);

				}

				function loadPopupAddress() { // To Load the Popupbox
					$('#popup_address').fadeIn(3000);

				}

				function unloadPopupAddressWarning() { // Unload the Full Name Warning 
					$('#popup_address_warning').fadeOut(3000);

				}

				function loadPopupAddressWarning() { // Load the Full Name Warning
					$('#popup_address_warning').fadeIn(3000);

				}
				$('#address').click(function() {
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

				function unloadPopupNICWarning() { // Unload the Full Name Warning 
					$('#popup_nic_warning').fadeOut(3000);

				}

				function loadPopupNICWarning() { // Load the Full Name Warning
					$('#popup_nic_warning').fadeIn(3000);

				}

				$('#nicNo').click(function() {
					loadPopupNIC();
					unloadPopupFullName();
					unloadPopupAddress();

				});

				function unloadPopupEmail() { // TO Unload the Popupbox
					$('#popup_email').fadeOut(3000);

				}

				function loadPopupEmail() { // To Load the Popupbox
					$('#popup_email').fadeIn(3000);

				}

				function unloadPopupEmailWarning() { // Unload the Full Name Warning 
					$('#popup_email_warning').fadeOut(3000);

				}

				function loadPopupEmailWarning() { // Load the Full Name Warning
					$('#popup_email_warning').fadeIn(3000);

				}

				function unloadPopupPhoneNo() { // TO Unload the Popupbox
					$('#popup_phoneno').fadeOut(3000);

				}

				function loadPopupPhoneNo() { // To Load the Popupbox
					$('#popup_phoneno').fadeIn(3000);

				}

				function unloadPopupPhoneNoWarning() { // Unload the Full Name Warning 
					$('#popup_phoneno_warning').fadeOut(3000);

				}

				function loadPopupPhoneNoWarning() { // Load the Full Name Warning
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
						$("#validateFullName").html("");

					}

				});

				// Last Name
				$("#lastName").focusin(function() {
					$(this).css("background-color", "#CEE3F6");
				});
				$("#lastName").focusout(function() {
					$(this).css("background-color", "#E0ECF8");
					var fullName = $("#lastName").val();
					if (validateEmpty(fullName)) {
						$("#validateLastName").html(" ");

					} else {

						$("#validateLastName").html("");
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
				$("#initials").focusout(function() {
					$(this).css("background-color", "#E0ECF8");
					var fullName = $("#initials").val();
					if (validateEmpty(fullName)) {
						$("#validateInitial").html(" ");
					} else {
						$("#validateInitial").html("");
					}
				});

				//Address

				$("#address").focusin(function() {
					loadPopupAddress();
					$(this).css("background-color", "#CEE3F6");
				});
				$("#address").focusout(function() {
					unloadPopupAddress();
					$(this).css("background-color", "#E0ECF8");
					var fullName = $("#address").val();
					if (validateEmpty(fullName)) {
						unloadPopupAddressWarning();
						$("#validateAddress").html(" ");
					} else {
						loadPopupAddressWarning();
						$("#validateAddress").html(" ");
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
					} else {
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
						if ((a.length == 10)) {

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

				$('#photoimg').live(
						'change',
						function() {
							$nicVal = $('#nicNo').val();
							var form_url = $("#imageform").attr("action");
							//changing the action to google.com
							$("#imageform").attr(
									"action",
									"/student/view/upload.jsp?nicVal="
											+ $nicVal);
							//submit the form
							$nicVal = $('#nicNo').val();

							$("#preview").html('');
							$("#preview").html('<img src="loader.gif"/>');
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

		var fullName = $('#fullName').val();
		var initials = $('#initials').val();
		var lastName = $('#lastName').val();
		var nic = $('#nicNo').val();
		var address = $('#address').val();
		var district = $('#district').val();
		var phoneNo = $('#phone').val();
		var email = $('#email').val();
		var fName = $('#fName').val();
		var fJob = $('#fJob').val();
		var fPhone = $('#fPhone').val();
		var mName = $('#mName').val();
		var mJob = $('#mJob').val();
		var mPhone = $('#mPhone').val();
		var stream = $('#stream').val();
		var regNo = $('#dispalyRegNo').html();
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
				stream : stream
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

				$("#imageform").attr(
						"action",
						"/student/view/upload.jsp?regisNo=" + data.regNo
								+ "&nbsp;msg=" + data.msg);
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
	<div id="accordion">
		<h3>Section 1</h3>
		<div>
			<p>Mauris mauris ante, blandit et, ultrices a, suscipit eget,
				quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravida
				in, condimentum sit amet, nunc. Nam a nibh. Donec suscipit eros. Nam
				mi. Proin viverra leo ut odio. Curabitur malesuada. Vestibulum a
				velit eu ante scelerisque vulputate.</p>
		</div>
		<h3>Section 2</h3>
		<div>
			<p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum
				sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris
				turpis porttitor velit, faucibus interdum tellus libero ac justo.
				Vivamus non quam. In suscipit faucibus urna.</p>
		</div>
		<h3>Section 3</h3>
		<div>
			<p>Nam enim risus, molestie et, porta ac, aliquam ac, risus.
				Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in
				pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac
				felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam
				nisi, eu iaculis leo purus venenatis dui.</p>
			<ul>
				<li>List item one</li>
				<li>List item two</li>
				<li>List item three</li>
			</ul>
		</div>
		<h3>Section 4</h3>
		<div>
			<p>Cras dictum. Pellentesque habitant morbi tristique senectus et
				netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum
				primis in faucibus orci luctus et ultrices posuere cubilia Curae;
				Aenean lacinia mauris vel est.</p>
			<p>Suspendisse eu nisl. Nullam ut libero. Integer dignissim
				consequat lectus. Class aptent taciti sociosqu ad litora torquent
				per conubia nostra, per inceptos himenaeos.</p>
		</div>
	</div>
</body>
</html>
