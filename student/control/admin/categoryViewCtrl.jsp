<%@page import="com.student.admin.ClassCategoryManager"%>
<%@page import="com.student.user.StudentManager"%>
<%@page import="com.student.util.PDFGenerater"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.student.admin.ClassCategory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.*,com.student.user.*,com.student.exception.*"
	errorPage="/view/error.jsp" buffer="8kb"%>
<%
	User user = (User) session.getAttribute("user");
	if ((user == null) || (user.getUserName() == null)) {
		throw new UserVerificationException(new Exception(
				"You are not logged in"),
				"/student/view/login/login.html");
	}

	//ArrayList<Location> locations = (ArrayList<Location>)request.getAttribute("locations");
	// locations = locations==null?new ArrayList<Location>():locations;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<!-- InstanceBegin template="/Templates/main.dwt" codeOutsideHTMLIsLocked="false" -->
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
 function applyDelete($delId){
	 
	 $.post("deleteCategoryCtrl.jsp",{ id:$delId}, function(data) {
	    // alert(data);
		 $('#showReslt').show();
		 $("#showReslt").html(data);
	   }); 
	 
 }
</script>


<%
	ClassCategoryManager classCategoryManager = ClassCategoryManager
			.getInstance();
	List<ClassCategory> classCategoryLst = classCategoryManager
			.getAllClassCategory();
	
	request.setAttribute("classCategoryLst", classCategoryLst);
%>




<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->

</head>
<body>
	<table width="100%" height="100%" border="0" cellspacing="0"
		cellpadding="0"  bgcolor="#81BEF7" >
		<tr>
			<td height="75px"></td>
			<td valign="bottom"><table width="100%" border="0"
					cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#CEE3F6">
								<tr>
            						<td colspan="3"><img src="/student/themes/default/images/common/header.jpg"  height="120" width="800"></td>
            					</tr>
								<tr>
									<td align="left" valign="bottom">
										<!-- InstanceBeginEditable name="title-region" -->
										<span class="title-16px">Student Management System </span>
									<!-- InstanceEndEditable -->
									</td>
									<td align="right" valign="bottom">
										<!-- InstanceBeginEditable name="userstatus-region" -->
										<span class="user">You are logged in as <%=user.getUserName()%></span>
									<!-- InstanceEndEditable -->
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="6px" bgcolor="#08088A"></td><!-- header boder above menu -->
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
			 <td bgcolor="#81BEF7">&nbsp;</td><!-- LEft Side Color  -->
			<td align="left" valign="top">
				<!-- InstanceBeginEditable name="body-region" -->
				<div id="personalInfo">
					<table width="100%" height="100%" border="0" cellspacing="0"
						cellpadding="0" bgcolor="#CEE3F6" >
						<tr>
							<td colspan="3" height="10px"></td>
						</tr>
						<tr>
							<td width="10px">&nbsp;</td>
							<td align="left" valign="top"><table width="100%" border="0"
									cellspacing="0" cellpadding="0">
									<tr>
										<td class="title-14px">Class Category Form</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>
											<table>
											
												<tr><div id="showReslt"></div><br>
													<td class="body-bold-text-12px">Class Id</td>
													<td class="body-bold-text-12px">Lecture Name</td>
													<td class="body-bold-text-12px">Subject</td>
													<td class="body-bold-text-12px">Payment Category</td>
													<td class="body-bold-text-12px">Class Fee</td>
													<td class="body-bold-text-12px"></td>
													<td class="body-bold-text-12px"></td>
												</tr>
												<tr>
													<td colspan="4"><img
														src="/student/themes/default/images/common/sub_table_dot_div.gif"></td>
												</tr>
												<c:if test="${classCategoryLst!=null}">
													<c:forEach var="classCategory" items="${classCategoryLst}">
														<tr>
															<td class="body-bold-text-12px">${classCategory.classId}</td>
															<td class="body-bold-text-12px">${classCategory.lectureName}</td>
															<td class="body-bold-text-12px">${classCategory.subject}</td>
															<td class="body-bold-text-12px">${classCategory.paymentCategory}</td>
															<td class="body-bold-text-12px">${classCategory.fee}</td>
															<td class="body-bold-text-12px"><%if(user.getUserRole().equalsIgnoreCase("Administrator")){ %><a
																href="/student/control/admin/categoryCtrl.jsp?id=${classCategory.id}"
																class="button">Edit</a><%} %></td>
																<td class="body-bold-text-12px"></td>
																<td class="body-bold-text-12px"><%if(user.getUserRole().equalsIgnoreCase("Administrator")){ %><a
																href="#" onclick="applyDelete('${classCategory.id}')"
																class="button">Delete</a><%} %></td>
															
															<td class="body-bold-text-12px"></td>
																
														</tr>
													</c:forEach>
												</c:if>
												<tr>
															<td class="body-bold-text-12px"><a
																href="/student/control/admin/categoryCtrl.jsp?action=classCategory" class="button"
																>Add New</a></td>
															<td class="body-bold-text-12px"></td>
															<td class="body-bold-text-12px"></td>
															<td class="body-bold-text-12px"></td>
															<td class="body-bold-text-12px"></td>
															<td class="body-bold-text-12px"></td>
														</tr>
												
											</table>
										</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
								</table></td>
							<td width="10px">&nbsp;</td>
						</tr>
					</table>
				</div> <!-- InstanceEndEditable -->
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
<!-- InstanceEnd -->
</html>

