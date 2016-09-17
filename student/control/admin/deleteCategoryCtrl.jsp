<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.student.admin.ExamManager"%>
<%@page import="com.student.admin.Exam"%>
<%@page import="com.student.admin.ClassCategoryManager"%>
<%@page import="com.student.admin.ClassCategory"%>
<%@ taglib prefix="tab" uri="http://ditchnet.org/jsp-tabs-taglib" %>
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
    		java.text.SimpleDateFormat,
    		javax.servlet.*,
    		com.dialog.util.SystemLog.*"
    buffer="8kb"
    errorPage="/view/error.jsp"%>

<%

String idStr = request.getParameter("id");
ClassCategoryManager classCategoryManager = ClassCategoryManager
.getInstance();
 boolean check=classCategoryManager.deleteClassCategory(idStr);
 System.out.println("check>>>>>"+check);
 request.setAttribute("check", check);
%>

<c:choose>
    <c:when test="${check!=null && check}">
       Success Fully delete Class Category....
    </c:when>
    <c:otherwise>
       OOPS Can't delete this Class .There are students already registerd for this class
    </c:otherwise>
</c:choose>