<%@page import="com.student.communication.SendMail"%>
<%@page import="com.student.admin.MyUser"%>
<%@page import="com.student.DB.ExecuteData"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="com.student.DB.DBCon"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.student.admin.ClassCategoryManager"%>
<%@page import="com.student.admin.ClassCategory"%>
<%@page import="com.student.admin.Password"%>


<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.util.*,
    		com.student.user.*,
    		com.student.exception.*,
    		com.student.communication.*,
    		com.dialog.util.SystemConfig,
    		com.dialog.util.exception.SystemError,
    		java.net.URLEncoder,
    		com.student.admin.MetaClassYearManager,
    		sun.misc.BASE64Encoder,
    		java.security.MessageDigest,
    		javax.servlet.*,
    		com.dialog.util.SystemLog.*"
    buffer="8kb"
    errorPage="/view/error.jsp"%>
    
<%

String action = request.getParameter("action");

if(action.equalsIgnoreCase("changePassword")){
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/admin/changepwd.jsp");
	rd.forward(request, response);
    return;   
}

if(action.equalsIgnoreCase("generateReg")){
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/admin/selectRegNo.jsp");
	rd.forward(request, response);
    return;   
}

if(action.equalsIgnoreCase("classInfo")){
	List myClassYear  = new MetaClassYearManager().getCalssYears();
	request.setAttribute("myClassYear", myClassYear);
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/admin/classInfo.jsp");
	rd.forward(request, response);
    return;   
}

if(action.equalsIgnoreCase("sendMail")){
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/admin/sendMail.jsp");
	rd.forward(request, response);
    return;   
}

if(action.equalsIgnoreCase("sending")){
	String to = request.getParameter("to");
	String file = request.getParameter("path");
	String subject = request.getParameter("subject");
	String message = request.getParameter("message");
	//file = file;
	String msg   = "";
	SendMail mail = new SendMail();
	if(mail.mailSend(to, subject, message, file)){
		msg = "OK";
	}
	else{
		msg = "";
	}
	request.setAttribute("msg", msg);
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/admin/checkUserNameResp.jsp");
	rd.forward(request, response);
    return; 
}

if(action.equalsIgnoreCase("groupMail")){
	String to = request.getParameter("to");
	String file = request.getParameter("path");
	String subject = request.getParameter("subject");
	String message = request.getParameter("message");
	//file = file;
	String msg   = "";
	SendMail mail = new SendMail();
	String classId = mail.getClassId(to);
	if(classId!=null) {
		ArrayList<String> stId = new ArrayList<String>();
				stId = mail.getStudentId(classId);
				if(!stId.isEmpty()) {
					ArrayList<String> stMail = new ArrayList<String>();
					stMail = mail.getStudentEmail(stId);
					
					if(mail.sendEmailGroup(stMail, subject, message, file)) {
						msg = "OK";
					}
				}
	}
	
	request.setAttribute("msg", msg);
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/admin/checkUserNameResp.jsp");
	rd.forward(request, response);
    return; 
}

if(action.equalsIgnoreCase("classCategory")){
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/admin/classCategory.jsp");
	rd.forward(request, response);
    return;   
}
if(action.equalsIgnoreCase("showUsers")){
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/admin/users.jsp");
	rd.forward(request, response);
    return;   
}

if(action.equalsIgnoreCase("getClassCategory")){
	List lst = ClassCategoryManager.getInstance().getClassCategory();
	
	session.setAttribute("CategoryList", lst);
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/admin/classCategoryresp.jsp");
	rd.forward(request, response);
    return;
}

if(action.equalsIgnoreCase("checkUserName")){
	String uname = request.getParameter("uname");
	String msg   = "";
	MyUser us = new MyUser();
	if(us. checkUserName(uname).equals("No")){
		msg = "Your can use this username";
	}
	else{
		msg = "Someone already has that username. Try another?";
	}
	request.setAttribute("msg", msg);
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/admin/checkUserNameResp.jsp");
	rd.forward(request, response);
    return;
}


if(action.equalsIgnoreCase("createUsers")){
	String uname = request.getParameter("uname");
	String password = request.getParameter("password");
	String userrole = request.getParameter("userrole");
	String createdUsr = request.getParameter("createdUsr");
	
	String msg   = "";
	MyUser us = new MyUser();
	if(us.createUsers(uname, password, userrole, createdUsr)){
		msg = "User created successfully";
	}
	else{
		msg = "";
	}
	request.setAttribute("msg", msg);
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/admin/checkUserNameResp.jsp");
	rd.forward(request, response);
    return;
}

if(action.equalsIgnoreCase("editPwd")){
	System.out.println("<<<Change PWD>>>");
	String currentPwd = request.getParameter("crntpwd");
		String newPwd = request.getParameter("newpwd");
		String rptnewPwd = request.getParameter("repwd");
		String msg   = "";
		boolean rst;
		
		Password pwd = new Password();
		
	    User user = (User)session.getAttribute("user");
	    
	     if(pwd.checkUserName(user.getUserName()) && newPwd.equals(rptnewPwd)) {
	    	rst= pwd.changePwd(currentPwd, newPwd, user.getUserName());
	    	if(rst==true) {
	    		msg="OK";
	    	}
	     } 
	     
	request.setAttribute("msg", msg);
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/admin/checkUserNameResp.jsp");
	rd.forward(request, response);
    return;
}

if(action.equalsIgnoreCase("makeRegNo")){
	
	String regID    = "";
	String location = request.getParameter("location");
	String yer      = request.getParameter("yer");
	
	String sql      = "UPDATE sampleregno SET Location='"+location+"', Yer='"+yer+"'";
	
	boolean result  = ExecuteData.updateMyData(sql);


    	//StudentManager sm = StudentManager.getInstance();
    	//sm.check(nic);
    	//msg = "Your NIC is already associated with this system";
    	
    	//SystemLog.getInstance().getLogger("EVENT").info("login,after_validate,"+nic+"OK");
    	if(result)
       	request.setAttribute("msg", "Successfully INSERTED");
    	else
    		request.setAttribute("msg", "Please Enter Again");
    	
    	//response.sendRedirect("/student/view/NewFile.html");
    	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/admin/makeRegNoResp.jsp");
		rd.forward(request, response);
	
	
	
	
}




if(action.equalsIgnoreCase("saveInfo")){
	
	
	
	
	
	String regID   = "";
	String fullName = request.getParameter("fullName");
	String initials = request.getParameter("initials");
	String lastName = request.getParameter("lastName");
	String nic 		= request.getParameter("nic");
	String address	= request.getParameter("address");
	String district = request.getParameter("district");
	String phone	= request.getParameter("phone");
	String email    = request.getParameter("email");
	String regNo    = request.getParameter("regNo");
	Student st   	=  StudentManager.getInstance().getID(regNo);
	regID 			= st.getId();
	String msg      = "";
	String alYear   = "";
    String status = "";
    try {
    	
    	Student student = new Student();
    	student.setAddress(address);
    	student.setAlYear(alYear);
    	student.setDistrict(district);
    	student.setEmail(email);
    	student.setFullName(fullName);
    	student.setId(regID);
    	student.setInitials(initials);
    	student.setLastName(lastName);
    	student.setNic(nic);
    	student.setRegNo(regNo);
    	student.setTelephone(phone);
    	
    	//StudentManager sm = StudentManager.getInstance();
    	//sm.check(nic);
    	//msg = "Your NIC is already associated with this system";
    	
    	//SystemLog.getInstance().getLogger("EVENT").info("login,after_validate,"+nic+"OK");
    	StudentManager.getInstance().saveStudentInfo(student);
       	request.setAttribute("msg", "Successfully Registered! Please Remember Your Registration No"+regNo);
    	request.setAttribute("RegNo", regNo);
    	//response.sendRedirect("/student/view/NewFile.html");
    	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/student/registrationCompleteResp.jsp");
		rd.forward(request, response);
		
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
    
    
    
    
	
	
	
}



%>