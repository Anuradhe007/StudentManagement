<%@page import="com.student.exam.MyMarks"%>
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

String action = request.getParameter("action");

if(action.equalsIgnoreCase("showExam")){
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/exam/exam.jsp");
	rd.forward(request, response);
    return;   
}
if(action.equalsIgnoreCase("viewExamMarks")){
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/exam/viewStudentExamMark.jsp");
	rd.forward(request, response);
    return;   
}
if(action.equalsIgnoreCase("showAverage")){
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/exam/averageMarks.jsp");
	rd.forward(request, response);
    return;   
}
if(action.equalsIgnoreCase("getExamNo")){
	MyMarks mk = new MyMarks();
	String classId 	= request.getParameter("classID");
	mk.getExamNo();
	
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/exam/averagMarksResp.jsp");
	rd.forward(request, response);
    return;   
}

if(action.equalsIgnoreCase("getAvgMarks")){
	MyMarks mk = new MyMarks();
	String classId 	= request.getParameter("classID");
	String examNo 	= request.getParameter("examNo");
	String avgMarks = mk.getAvgMarks(classId, examNo);
	request.setAttribute("avgMarks", avgMarks);
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/exam/averagMarksResp.jsp");
	rd.forward(request, response);
    return;   
}
if(action.equalsIgnoreCase("examMarks")){
	String classId 	= request.getParameter("classID");
	String regNo 	= request.getParameter("regNo");
	String examNo 	= request.getParameter("examNo");
	String marks	= request.getParameter("marks");
	String msg      = "";
	
	
	MyMarks mk = new MyMarks();
	if(mk.checkRegNoAvailable(regNo)){
	boolean result = mk.saveExamMarks(regNo, classId, examNo,Double.parseDouble(marks));
	if(result){
		msg = "Successfully Saved for "+regNo;
	}
	else {
		msg = "oops! something went wrong "+regNo;
	}
	}
	else{
		msg = "This "+regNo +" registrtion number is not associated with the system";
	}
	request.setAttribute("msg", msg);
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/exam/examMarksResp.jsp");
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