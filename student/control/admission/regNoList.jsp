<%@page import="com.student.admin.ClassCategoryManager"%>
<%@page import="com.student.user.StudentManager"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.student.admin.ClassCategory"%>
<%@ page import="java.util.List" %>

<%
List<String>regNolst=StudentManager.getInstance().getAllRegNo();
request.setAttribute("regNolst", regNolst);

%>
<c:forEach var="reg" items="${regNolst}">
    ${reg},
</c:forEach>