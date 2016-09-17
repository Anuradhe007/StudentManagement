<%@page import="com.dialog.util.SystemLog"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.util.*,
    		com.student.user.*,
    		com.student.exception.*,
    		com.dialog.util.SystemConfig,
    		com.dialog.util.exception.SystemError,
    		java.net.URLEncoder,
    		sun.misc.BASE64Encoder,
    		java.security.MessageDigest"
    buffer="8kb"
    errorPage="/view/error.jsp"%>
    <%    
    String action = request.getParameter("action");
    
    if(action.equals("login")) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
      //  SystemLog.getInstance().getLogger("EVENT").info("login,login_entry,"+username+","+password+",");
        
        String msg = "";
        String status = "ERR";
        try {
        	UserManager um = new UserManager();
        	User u = um.validateUser(username, password);
        	SystemLog.getInstance().getLogger("EVENT").info("login,after_validate,"+username+","+password+",OK,"+u);
        	status = "OK";
        	msg = "Login Successful";
        	
        	//request.setAttribute("user", u);
        	session.setAttribute("user", u);
        	request.setAttribute("msg", msg);
        	request.setAttribute("status", status);
        	//response.sendRedirect("/student/view/NewFile.html");
        	RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/login/loginResp.jsp");
    		rd.forward(request, response);
    		
        }
        catch(InvalidUserException e) {
            msg = e.getMessage();
            request.setAttribute("msg", msg);
        	request.setAttribute("status", status);
        	SystemLog.getInstance().getLogger("EVENT").info("login,after_validate,"+username+","+password+",ERR,"+msg);
        	SystemLog.getInstance().getLogger("EVENT").error("login,after_validate,"+username+","+password+",ERR,"+msg,e);
            RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/student/view/login/loginResp.jsp");
    		rd.forward(request, response);
        }
		catch(Exception e) {
		    e.printStackTrace();
		    request.setAttribute("msg", msg);
        	request.setAttribute("status", status);
        	SystemLog.getInstance().getLogger("EVENT").info("login,after_validate,"+username+","+password+",ERR,"+msg);
        	SystemLog.getInstance().getLogger("EVENT").error("login,after_validate,"+username+","+password+",ERR,"+msg,e);
		    RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/view/login/loginResp.jsp");
			rd.forward(request, response);
        }
    }
 %>
    