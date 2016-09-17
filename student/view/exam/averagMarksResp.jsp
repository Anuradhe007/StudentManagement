<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.util.*,
    		com.dialog.util.Utility"
    buffer="8kb"%><%
    
     String avg 	  = (String)request.getAttribute("avgMarks");
  	
    
%>	{"avg": "<%=avg%>"}