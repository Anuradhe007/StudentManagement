<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.util.*,
    		com.student.user.*,
    		com.dialog.util.Utility"
    buffer="8kb"%><%
 
    String fee 	  = (String)request.getAttribute("fee");
  	System.out.println("RESP "+fee);
    
%>	{"fee": "<%=fee%>"}