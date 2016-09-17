<%@page import="com.student.payment.MyPayment"%>
<%@page import="com.student.admin.MyClassCategory"%>
<%@page import="com.student.payment.PaymentManager"%>
<%@page import="com.student.payment.Payment"%>
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

if(action.equalsIgnoreCase("showPayment")){
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/student/payment.jsp");
	rd.forward(request, response);
    return;   
}

if(action.equalsIgnoreCase("getClassFee")){
	
	String classId = request.getParameter("classID");
	System.out.println("########################dd"+classId);
	MyClassCategory myCategory = new MyClassCategory();
	String fee = myCategory.getClassFee(classId);
	System.out.println("FEE="+fee);
	request.setAttribute("fee",fee);
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/student/getClassFeeResp.jsp");
	rd.forward(request, response);
    return;   
}
if(action.equalsIgnoreCase("savePayment")){
	

	String regNo 	= request.getParameter("regNo");
	String classId 	= request.getParameter("classID");
	String classFee = request.getParameter("classFee");
	String payingMonth 	= request.getParameter("month");
	String paidDate = request.getParameter("paidDate");
	String year = request.getParameter("year");
	String msg = "";
	
	MyPayment pay = new MyPayment();
	PaymentManager paymentManager=PaymentManager.getInstance();
	if(pay.checkRegNoAvailable(regNo)){
		if(paymentManager.isPaymentAlreadyDone(regNo,classId,payingMonth,year)){
			msg = "Already done the payment for "+classId +" in "+payingMonth+"-"+year;
		}else{
			if(paymentManager.savePayment(regNo, classId, classFee, payingMonth, paidDate,year)){
				msg = "Successfully saved for "+regNo;
			}
			else{
				msg = "Check your payment again.";
			}
		}
		
	}
	else{
		msg = "Your registration number is not associated with the system";
	}
	
	request.setAttribute("msg",msg);
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/student/savepaymentResp.jsp");
	rd.forward(request, response);
    return;   
}

if(action.equalsIgnoreCase("checkNIC")){
	System.out.println("============Within check NIC ========");
	String nic = request.getParameter("NIC");
	String msg = "";
    String status = "ERR";
    String regNo = "";
    String regID    = "";
    try {
    	
    	StudentManager sm = StudentManager.getInstance();
    
    	
    	msg = "Your NIC is already associated with this system";
    	boolean result = sm.check(nic);
    	if(result){
    		System.out.println("######### Result is true  ######### ");
    		status = "OK";
    		msg = "";		
    		String fullName = request.getParameter("fullName");
    		String initials = request.getParameter("initials");
    		String lastName = request.getParameter("lastName");
    		Student st = new Student();
    		
    				
    		String yer 		= "2012";//SystemConfig.getInstance().getStr("root.regNo.year");
    		String symbol 	= "V";//SystemConfig.getInstance().getStr("root.regNo.symbol");
    		GenerateRegNo reg = new GenerateRegNo();
    		reg.setSymbol(symbol);
    		reg.setYer(yer);
    		
    		 regNo = GenerateRegNoManager.getInstance().generateRegNo(reg);
    		
    		st.setFullName(fullName);
    		st.setInitials(initials);
    		st.setLastName(lastName);
    		st.setNic(nic);
    		st.setRegNo(regNo);
    		
    		regID =  StudentManager.getInstance().saveStudentInfo(st);
    		
    	}
    	//SystemLog.getInstance().getLogger("EVENT").info("login,after_validate,"+nic+"OK");
    	
       	request.setAttribute("msg", msg);
    	request.setAttribute("status", status);
    	request.setAttribute("regNo", regNo);
    	
    	//response.sendRedirect("/student/view/NewFile.html");
    	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/student/nicCheckResp.jsp");
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