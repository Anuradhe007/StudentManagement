<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.student.admin.ClassCategory"%>
<%@page import="com.student.admin.ClassCategoryManager"%>
<%@ taglib prefix="tab" uri="http://ditchnet.org/jsp-tabs-taglib" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.util.*,
    		com.student.user.*,
    		com.student.exception.*,
    		com.dialog.util.SystemConfig,
    		com.dialog.util.exception.SystemError,
    		java.net.URLEncoder,
    		sun.misc.BASE64Encoder,
    		java.security.MessageDigest,
    		javax.servlet.*,
    		com.dialog.util.SystemLog.*"
    buffer="8kb"
    errorPage="/view/error.jsp"%>
    
		

<%
double fee=request.getParameter("feeTxt")!=null  ? Double.valueOf(request.getParameter("feeTxt")):0.0;
String classID = request.getParameter("classId");
String lecNameTxt = request.getParameter("lecNameTxt");
String subjectTxt = request.getParameter("subjectTxt");
String paymentCat = request.getParameter("paymentCat");
String idStr = request.getParameter("id");
String endTime=request.getParameter("endTime");
String startTime=request.getParameter("startTime");
int id=0;
boolean clasIdAlreadyused=false;
List<ClassCategory>catList=null;
ClassCategory classCategory=null;
ClassCategoryManager classCategoryManager=ClassCategoryManager.getInstance();
if((idStr==null || idStr.equals("")) && !classCategoryManager.isClasIdAvailable(classID)){
	clasIdAlreadyused=true;
}
if(!clasIdAlreadyused){
	classCategory=classCategoryManager.InsertClassCategory(idStr,lecNameTxt,subjectTxt,classID,fee,paymentCat,endTime,startTime) ;
	
	
}
request.setAttribute("classCategory", classCategory);
%>
<%if(clasIdAlreadyused){ %>
 Class ID is Already Assigned..Please try with another Class Id....
<%}else{ %>
<c:choose>
    <c:when test="${classCategory==null}">
       Save is not Success..Try Again.. 
    </c:when>
    <c:otherwise>
       Success Fully save Class Category....
    </c:otherwise>
</c:choose>
<%} %>
