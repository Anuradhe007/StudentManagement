<%@page import="java.sql.ResultSet"%>
<%@page import="com.student.admin.AttendenceManager"%>
<%@page import="com.student.admin.MyUser"%>
<%@page import="com.student.DB.ExecuteData"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="com.student.DB.DBCon"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.student.admin.ClassCategoryManager"%>
<%@page import="com.student.admin.ClassCategory"%>


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
    		com.dialog.util.SystemLog.*,
    		java.sql.Statement.*"
    buffer="8kb"
    errorPage="/view/error.jsp"%>
    
<%

String action = request.getParameter("action");

if(action.equalsIgnoreCase("attendance")){
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/report/studentAttendance.jsp");
	rd.forward(request, response);
    return;   
}

//*************************************************************************


if(action.equalsIgnoreCase("generateAttnGraph")){
	String classID = request.getParameter("classID");
	String msg   = "";
	
	
	
	
	String sql = "SELECT count(regNo) as students, substr(attendTIme,6,6) as mydate FROM attendence where classId='"+classID+"' group by substr(attendTIme,1,10)";
	 ResultSet rst = null;
	 Connection con = null;
	 Statement st = null;
	 ArrayList<Integer> stdNumb = null;
	 ArrayList<String> attnDte = null;
	    try {
	        con = DBCon.getConnection();
	         st =(Statement) con.createStatement();
	        
	        rst =  st.executeQuery(sql);

	   	  	stdNumb=new ArrayList<Integer>();
	   		attnDte=new ArrayList<String>();
	   	 
	   	 while(rst.next()){
	   		stdNumb.add(new Integer(rst.getString("students")));
	   		attnDte.add(rst.getString("mydate"));
	   		//System.out.println(rst.getString("mydate")+" "+rst.getString("students"));
	   	 }
	   	 
	      con.close();

	    } catch (Exception ex) {
	        ex.printStackTrace();

	    } 
	
	
	request.setAttribute("stdNumb",stdNumb);
	request.setAttribute("attnDte",attnDte);
	
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/report/attendanceResp.jsp");
	rd.forward(request, response);
    return;
}





//****************************************************************************

if(action.equalsIgnoreCase("generateReg")){
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/admin/selectRegNo.jsp");
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