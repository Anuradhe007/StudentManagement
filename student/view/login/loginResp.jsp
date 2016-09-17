<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.util.*,
    		com.student.user.*,
    		com.dialog.util.Utility"
    buffer="8kb"%><%
    String msg 	  = (String)request.getAttribute("msg");
    msg 		  = Utility.isValid(msg)?msg.trim():"";
    String status = (String)request.getAttribute("status");
    status 		  = Utility.isValid(status)?status.trim():"";    
%>	{msg: "<%=msg%>", status: "<%=status%>"}