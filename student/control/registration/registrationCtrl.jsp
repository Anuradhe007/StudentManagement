
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
SaveRegNo saveReg = null;
String photoimg="";
  String port = "COM4"; //Modem Port.
 int bitRate = 115200; //this is also optional. leave as it is.
 String modemName = "ZTE"; //this is optional. String modemPin = "0000"; //Pin code if any have assigned to the modem.
 String SMSC = "+9477000003"; //Message Center Number ex. Mobitel 9471000003  AIRTEL   +947100003    
 String modemPin = "0000"; 
String action = request.getParameter("action");


String regNo = "";

if(action.equalsIgnoreCase("showRegistration")){
	String msg =( request.getParameter("MSG")!=null?request.getParameter("MSG"):"");
	request.setAttribute("message", msg);
	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/student/registration.jsp");
	rd.forward(request, response);
    return;   
}

if(action.equalsIgnoreCase("checkNIC")){
	
	 MarksManager mg = new MarksManager();
	String nic = request.getParameter("NIC");
	String msg = "";
    String status = "ERR";
   
    String regID    = "";
    try {
    	
    	StudentManager sm = StudentManager.getInstance();
    
    	
    	msg = "Your NIC is already associated with this system";
    	
    		status = "OK";
    		msg = "";		
    		String fullName = request.getParameter("fullName");
    		String initials = request.getParameter("initials");
    		String gender = request.getParameter("gender");
    		Student st = new Student();
    		String yer 	="";
    		String symbol = "";
    		
    		SampleRegistration sap = new SampleRegistration();
    		
    		
    		yer	= sap.sampleregNoYear(); //"2012";//SystemConfig.getInstance().getStr("root.regNo.year");
    		symbol	= sap.sampleregNoLocation();//"M";//SystemConfig.getInstance().getStr("root.regNo.symbol");
    		
    		symbol = symbol.substring(0,1);
    		if(symbol.equalsIgnoreCase("M")){
    			//StoreRegNo strg = new StoreRegNo();
    			GenerateRegNoMatara regM = new GenerateRegNoMatara();
        		regM.setSymbol(symbol);
        		regM.setYer(yer);
    		// regNo = GenerateRegNoManager.getInstance().generateRegNo(reg);
    		 regNo =   GenerateRegNoManagerMatara.getInstance().generateRegNo(regM);
    		  saveReg = new SaveRegNo();
    		  saveReg.setRegNo(regNo);
    		 //strg.setRegNo(regNo);
    		}
    		if(symbol.equalsIgnoreCase("G")){
    			//StoreRegNo strg = new StoreRegNo();
    			GenerateRegNoGalle regG = new GenerateRegNoGalle();
    			regG.setSymbol(symbol);
    			regG.setYer(yer);
    		// regNo = GenerateRegNoManager.getInstance().generateRegNo(reg);
    		 regNo =   GenerateRegNoManagerGalle.getInstance().generateRegNo(regG);
    		 //strg.setRegNo(regNo);
    		}
    		
    		if(symbol.equalsIgnoreCase("T")){
    			//StoreRegNo strg = new StoreRegNo();
    			GenerateRegNoTangalle regT = new GenerateRegNoTangalle();
    			regT.setSymbol(symbol);
    			regT.setYer(yer);
    		// regNo = GenerateRegNoManager.getInstance().generateRegNo(reg);
    		 regNo =   GenerateRegNoManagerTangalle.getInstance().generateRegNo(regT);
    		 //strg.setRegNo(regNo);
    		}
    		st.setFullName(fullName);
    		st.setInitials(initials);
    		st.setSex(gender);
    		st.setNic(nic);
    		st.setRegNo(regNo);
    		
    		regID =  StudentManager.getInstance().saveStudentInfo(st);
    		
    	
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
    System.out.println("complete nicCheckResp >>>");
	
	
}


if(action.equalsIgnoreCase("saveInfo")){
	
	
	//*****************************************************
	
		
	
	
	
	
	
	
	
	
	//******************************************************
	
	
	
	
	String regID   = "";
	String fullName = request.getParameter("fullName");
	String initials = request.getParameter("initials");
	String gender = request.getParameter("gender");
	String nic 		= request.getParameter("nic");
	String address	= request.getParameter("address");
	String school   = request.getParameter("school");
	String location = request.getParameter("district");
	String phone	= request.getParameter("phoneNo");
	String email    = request.getParameter("email");
	//String regNo    = request.getParameter("regNo");
	//*************************************************
	String fName    = request.getParameter("fName");
	String fJob     = request.getParameter("fJob");
	String fPhone   = request.getParameter("fPhone");
	String mName    = request.getParameter("mName");
	String mJob     = request.getParameter("mJob");
	String mPhone   = request.getParameter("mPhone");
	String stream   = request.getParameter("stream");
	photoimg = request.getParameter("photoimg");
	//************************************************************************* GET FROM PREVIOUS *******************************************************

	String yer 	="";
	String symbol = "";
	
	//SampleRegistration sap = new SampleRegistration();
	
	
	//yer	= sap.sampleregNoYear(); //"2012";//SystemConfig.getInstance().getStr("root.regNo.year");
	//symbol	= sap.sampleregNoLocation();//"M";//SystemConfig.getInstance().getStr("root.regNo.symbol");
	symbol = location;
	yer = Integer.toString(Calendar.getInstance().get(Calendar.YEAR));
	symbol = symbol.substring(0,2);
	if(symbol.equalsIgnoreCase("Ma")){
		//StoreRegNo strg = new StoreRegNo();
		GenerateRegNoMatara regM = new GenerateRegNoMatara();
		regM.setSymbol(symbol.toUpperCase());
		regM.setYer(yer);
	// regNo = GenerateRegNoManager.getInstance().generateRegNo(reg);
	 regNo =   GenerateRegNoManagerMatara.getInstance().generateRegNo(regM);
	 saveReg = new SaveRegNo();
	  saveReg.setRegNo(regNo);
	}
	else if(symbol.equalsIgnoreCase("Em")){
		//StoreRegNo strg = new StoreRegNo();
		GenerateRegNoGalle regG = new GenerateRegNoGalle();
		regG.setSymbol(symbol.toUpperCase());
		regG.setYer(yer);
	// regNo = GenerateRegNoManager.getInstance().generateRegNo(reg);
	 regNo =   GenerateRegNoManagerGalle.getInstance().generateRegNo(regG);
	 saveReg = new SaveRegNo();
	  saveReg.setRegNo(regNo);
	}
	
	else if(symbol.equalsIgnoreCase("Ta")){
		//StoreRegNo strg = new StoreRegNo();
		GenerateRegNoTangalle regT = new GenerateRegNoTangalle();
		regT.setSymbol(symbol.toUpperCase());
		regT.setYer(yer);
	// regNo = GenerateRegNoManager.getInstance().generateRegNo(reg);
	 regNo =   GenerateRegNoManagerTangalle.getInstance().generateRegNo(regT);
	 saveReg = new SaveRegNo();
	  saveReg.setRegNo(regNo);
	}
	
	else if(symbol.equalsIgnoreCase("Th")){
		//StoreRegNo strg = new StoreRegNo();
		GenerateRegNoThissa regT = new GenerateRegNoThissa();
		regT.setSymbol(symbol.toUpperCase());
		regT.setYer(yer);
	// regNo = GenerateRegNoManager.getInstance().generateRegNo(reg);
	regNo =   GenerateRegNoManagerThissa.getInstance().generateRegNo(regT);
	saveReg = new SaveRegNo();
	  saveReg.setRegNo(regNo);
	}
	
	
	
	//******************************************************************************************************************
	
	//Object fileup=request.getParameter("uploadFile");
	//File uplodFile=new File(fileup);
	Student student   	= null;
	String msg      = "";
	String alYear   = "";
    String status = "";
    try {
    	if(student==null){
    		student = new Student();
    	}
    	student.setRegNo(regNo);
    	student.setAddress(address);
    	student.setSchool(school);
    	student.setAlYear(alYear);
    	student.setDistrict(location);
    	student.setNic(nic);
    	student.setEmail(email);
    	student.setFullName(fullName);
    	student.setInitials(initials);
    	student.setSex(gender);
    	student.setTelephone(phone);
    	student.setFatherName(fName);
    	student.setFatherJob(fJob);
    	student.setFatherPhone(fPhone);
    	student.setMotherName(mName);
    	student.setMotherJob(mJob);
    	student.setMotherPhone(mPhone);
    	student.setSubjectStream(stream);
    	
    	
    	
    	
    	//*********************************************************************
    	 
    	          
        System.out.println("before nic>>>>");
    	
    	String contentType = request.getContentType();
        //String p1=request.getParameter("photo1");
       // System.out.println("before photo1photo1photo1photo1>>>>"+p1);
        
        if ( (contentType.indexOf("multipart/form-data") >= 0)) {
                DataInputStream in = new DataInputStream(request.getInputStream());
                
                int formDataLength = request.getContentLength();
                byte dataBytes[] = new byte[formDataLength];
                System.out.println("ddddddddd>>>>"+dataBytes.length);
                int byteRead = 0;
                int totalBytesRead = 0;
                while (totalBytesRead < formDataLength) {
                        byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                        totalBytesRead += byteRead;
                        }
                       String file = new String(dataBytes);
                       
               
                String saveFile = file.substring(file.indexOf("filename=\"") + 10);
                saveFile=regNo+".jpg";
                if(dataBytes!=null && dataBytes.length>0){
                	student.setImage(dataBytes);
                	student.setImgName(saveFile);
                    
                }
                
                int lastIndex = contentType.lastIndexOf("=");
                String boundary = contentType.substring(lastIndex + 1,contentType.length());
                int pos;
                pos = file.indexOf("filename=\"");
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                int boundaryLocation = file.indexOf(boundary, pos) - 4;
                int startPos = ((file.substring(0, pos)).getBytes()).length;
                int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
                
				request.setAttribute("saveFile", saveFile);
			
                FileOutputStream fileOut = new FileOutputStream("C://Studentmgt/student/ProfPics/"+saveFile);
                request.setAttribute("saveFile", saveFile);
                fileOut.write(dataBytes, startPos, (endPos - startPos));
                fileOut.flush();
                fileOut.close(); 
                
                
                FileOutputStream fileOut2 = new FileOutputStream(saveFile);
                fileOut2.write(dataBytes, startPos, (endPos - startPos));
                fileOut2.flush();
                fileOut2.close();
        
    	
    	
                %><Br>
                <table>
               	 	<tr>
                		<td class="body-bold-text-12px"><img alt="img" height="150" width="150" src="/student/themes/default/images/${saveFile}" ></td>
                	</tr>
                </table>

<%
}
        request.setAttribute("msg", "Successfully Registered! Please Remember Your Registration No "+regNo);
    	request.setAttribute("RegNo", regNo);
    	//response.sendRedirect("/student/view/NewFile.html");
    	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/student/registrationCompleteResp.jsp");
		rd.forward(request, response);
    	
    	//*********************************************************************
    	
    	//System.out.println("bFilefdfdfdf>>>");
    	//byte[] bFile = new byte[(int) uplodFile.length()];
    	//System.out.println("bFile>>>"+bFile);
    	
    	//student.setImage(bFile);
    	
    	//StudentManager sm = StudentManager.getInstance();
    	 //sm.check(nic);
    	//msg = "Your NIC is already associated with this system";
    	
    	//SystemLog.getInstance().getLogger("EVENT").info("login,after_validate,"+nic+"OK");
    	StudentManager.getInstance().saveStudentInfo(student);
       	request.setAttribute("msg", "Successfully Registered! Student Registration No "+regNo+". SMS has been sent to the student");
       String	myMsg = "Dear "+fullName +", You have been successfully registerd at APE ECON VIJITHAYA. Your registration number is " +regNo+" Thank You .";
    	SMS.sendSMS(phone, regNo, fullName);
  		 GsmModem g = new GsmModem();
    	//GsmModem g = new GsmModem();
    	g.configModem(port, bitRate, modemName, modemPin, SMSC);
    	g.Sender(phone, myMsg);
       	
    	request.setAttribute("RegNo", regNo);
    	RequestDispatcher rd1 = getServletConfig().getServletContext().getRequestDispatcher("/view/student/registrationCompleteResp.jsp");
		rd1.forward(request, response);
		
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

if(action.equalsIgnoreCase("editInfo")){
	
	
	System.out.println("editInfo>>>");
	
	
	
	String regID   = "";
	String fullName = request.getParameter("fullName");
	String initials = request.getParameter("initials");
	String gender = request.getParameter("gender");
	String nic 		= request.getParameter("nic");
	String address	= request.getParameter("address");
	String district = request.getParameter("district");
	String phone	= request.getParameter("phoneNo");
	String email    = request.getParameter("email");
	String fn  		= request.getParameter("fn");
	String fj  		= request.getParameter("fj");
	String fp  		= request.getParameter("fp");
	String mn  		= request.getParameter("mn");
	String mj  		= request.getParameter("mj");
	String mp  		= request.getParameter("mp");
	String school  		= request.getParameter("school");
	String imgName = request.getParameter("imgName");
	
	System.out.println("school >>>> "+school);
	System.out.println("image >>>> "+imgName);
	regNo    = request.getParameter("regNo");
	Student student   	=  StudentManager.getInstance().getID(regNo);
	String msg      = "";
	String alYear   = "";
    String status = "";
    
    
    
    
    try {
    	if(student!=null){
    		student.setAddress(address);
        	student.setDistrict(district);
        	student.setEmail(email);
        	student.setFullName(fullName);
        	student.setInitials(initials);
        	student.setSex(gender);
        	student.setNic(nic);
        	student.setTelephone(phone);
        	student.setMotherName(mn);
        	student.setMotherJob(mj);
        	student.setMotherPhone(mp);
        	student.setFatherName(fn);
        	student.setFatherJob(fj);
        	student.setFatherPhone(fp);
        	student.setSchool(school);
        	StudentManager.getInstance().saveStudentInfo(student);
        	
        
           	request.setAttribute("msg", "Successfully Updated! Please Remember Your Registration No: "+regNo);
        	request.setAttribute("RegNo", regNo);
        	//response.sendRedirect("/student/view/NewFile.html");
        	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/student/registrationCompleteResp.jsp");
    		rd.forward(request, response);
    	}
		
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

