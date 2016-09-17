<%@page import="java.sql.ResultSet"%>
<%@page import="com.student.exam.MarksManager"%>
<%@page import="java.io.File"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.*" %>
<%@ page import ="com.student.sms.*" %>
<%@ page import="com.student.regNo.SaveRegNo" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.util.*,
    		com.student.user.*,
    		com.student.exception.*,
    		com.student.admin.*,
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
System.out.println("<<< Change PWD >>>");
String action = request.getParameter("action");
    if(action.equalsIgnoreCase("editPwd")){
   	String msg = "";
       String status = "ERR";
      
       try {
       	
       	StudentManager sm = StudentManager.getInstance();
       
       	
       		status = "OK";
       		msg = "";		
       		String currentPwd = request.getParameter("crntpwd");
       		String newPwd = request.getParameter("newpwd");
       		String rptnewPwd = request.getParameter("repwd");
       		
       		System.out.println("current pwd >>"+currentPwd);
       		System.out.println("new pwd >>"+newPwd);
       		System.out.println("rpt pwd >>"+rptnewPwd);
       		Student st = new Student();
       		
       }
    	catch(Exception e) {
   	    e.printStackTrace();
   	    request.setAttribute("msg", msg);
       	request.setAttribute("status", status);
       	//SystemLog.getInstance().getLogger("EVENT").info("login,after_validate,"+nic+",ERR,"+msg);
       	//SystemLog.getInstance().getLogger("EVENT").error("login,after_validate,"+nic+",ERR,"+msg,e);
   	    RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/student/nicCheckResp.jsp");
   		rd.forward(request, response);
       }
       System.out.println("complete change password >>>");
    }
    
    %>