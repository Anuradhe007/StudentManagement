<%@page import="com.student.admin.ExamManager"%>
<%@page import="com.student.admin.Exam"%>
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
<link href="../../themes/default/css/default.css" rel="stylesheet"
	type="text/css">
<link href="/student/themes/default/css/default.css" rel="stylesheet"
	type="text/css">
<link type="text/css"
	href="/student/scripts/jquery/themes/base/ui.all.css" rel="stylesheet" />
<script type="text/javascript" src="/student/scripts/jquery/jquery.js"></script>
<script type="text/javascript"
	src="/student/scripts/jquery/jquery.form.js"></script>
<style type="text/css">
html .jqueryslidemenu {
	height: 1%;
} /*Holly Hack for IE7 and below*/
</style>
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
<script type='text/javascript'
	src='/student/scripts/jquery/jquery.autocomplete.js'></script>
<link type="text/css"
	href="/student/scripts/jquery/themes/base/jquery.autocomplete.css"
	rel="stylesheet" />
<script type="text/javascript">
 function applyDelete($delId){
	 
	 $.post("deleteExam.jsp",{ id: $delId}, function(data) {
	    	$('#showReslt').show();
			$("#showReslt").html(data);
	   }); 
	 
	 location.reload();
 }
</script>


<%
	ExamManager examManager = ExamManager.getInstance();
	List<Exam> examCategoryLst =examManager.getExistingExams();
	
	request.setAttribute("examCategoryLst", examCategoryLst);
%>




<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->

</head>
<body>
	<table width="100%" height="100%" border="0" cellspacing="0"
		cellpadding="0" bgcolor="#81BEF7" >
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
						cellpadding="0" bgcolor="#CEE3F6">
						<tr>
							<td colspan="3" height="10px"></td>
						</tr>
						<tr>
							<td width="10px">&nbsp;</td>
							<td align="left" valign="top"><table width="100%" border="0"
									cellspacing="0" cellpadding="0">
									<tr>
										<td class="title-14px">Exam View Form</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>
											<table>
												<tr><div id="showReslt"></div><br>
													<td class="body-bold-text-12px">Class Id</td>
													<td class="body-bold-text-12px">Description</td>
													<td class="body-bold-text-12px">Exam Date</td>
													<td class="body-bold-text-12px">Exam Number</td>
													<td class="body-bold-text-12px">Start Time(24H)</td>
													<td class="body-bold-text-12px">End Time(24H)</td>
													<td class="body-bold-text-12px"></td>
													<td class="body-bold-text-12px"></td>
												</tr>
												<tr>
													<td colspan="4"><img
														src="/student/themes/default/images/common/sub_table_dot_div.gif"></td>
												</tr>
												<c:if test="${examCategoryLst!=null}">
													<c:forEach var="exam" items="${examCategoryLst}">
														<tr>
															<td class="body-bold-text-12px">${exam.classCategory.classId}</td>
															<td class="body-bold-text-12px">${exam.description}</td>
															<td class="body-bold-text-12px">${exam.examDate}</td>
															<td class="body-bold-text-12px">${exam.examNumber}</td>
															<td class="body-bold-text-12px">${exam.examStartTime}</td>
															<td class="body-bold-text-12px">${exam.examEndTime}</td>
															<td class="body-bold-text-12px"><a	href="/student/control/admin/editExam.jsp?action=classCategory&name=dfrffhgfsdgdvdgdgdfgdfgdfggfdggfdggdfgfgdfgdfgdfgdfggfgfggfgfg&id=${exam.id}" class="button">Edit</a></td>
																<td class="body-bold-text-12px"></td>
																<td class="body-bold-text-12px"><a href="" onclick="applyDelete('${exam.id}')"	 class="button">Delete</a></td>
															
															<td class="body-bold-text-12px"></td>
																
														</tr>
													</c:forEach>
												</c:if>
												<tr>
															<td class="body-bold-text-12px"><a
																href="/student/control/admin/addExamCtrl.jsp?action=classCategory&name=dfrffhgfsdgdvdgdgdfgdfgdfggfdggfdggdfgfgdfgdfgdfgdfggfgfggfgfg" class="button"
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

