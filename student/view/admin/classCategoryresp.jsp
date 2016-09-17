<%@page import="com.student.admin.ClassCategory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.util.*"
    buffer="8kb"%><%

   List Category  = new ArrayList();
	
   Category = (List) session.getAttribute("CategoryList");
   
   
   %>
	
   {"Category" : <%=Category%>}