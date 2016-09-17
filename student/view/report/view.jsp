<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.student.exam.MarksManager"%>
<%@ page import="com.student.admin.AtndnceView" %>
<%@ page import="com.student.admin.ModelAtnd" %>
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
    User user = (User)session.getAttribute("user");
    if((user==null) || (user.getUserName()==null)) {
        throw new UserVerificationException(new Exception("You are not logged in"),"/student/view/login/login.html");
    }    
    %>
    
<script type="text/javascript">

<!--
function open(){
	alert('ddd');
	 $('.popbox').popbox();
}
//-->
</script>
<%
//String name = request.getParameter("name");
String value = request.getParameter("value");
String name = "regNo";
String action = request.getParameter("action");
System.out.println("Name "+name);
System.out.println("Value "+value);
System.out.println("action "+action);
boolean isClassSelect=false;
if(action!=null && action.equals("searchAtnd")){
	isClassSelect=true;
}
request.setAttribute("isClassSelect", isClassSelect);

List<Student>stuList=null;
ArrayList<String> list1 = new ArrayList<String>();
ArrayList<String> list2 = new ArrayList<String>();
SearchManager searchManager=SearchManager.getInstance();
AtndnceView viewat = new AtndnceView();
String val1 = "";
if(name!=null && value!=null){
	if(name.equalsIgnoreCase("nic")){
		stuList=searchManager.getStudentByNIC(value);
		request.setAttribute("stuList", stuList);
	}else if(name.equalsIgnoreCase("name")){
		stuList=searchManager.getStudentByName(value);
		request.setAttribute("stuList", stuList);
	}else if(name.equalsIgnoreCase("regNo")){
		if(viewat.getStId(value)!=null){
		val1 = viewat.getStId(value);
		list1 = viewat.getAttndCls(val1);
		list2 = viewat.getAttndDate(val1);
		}
		//request.setAttribute("list1", list1);
		
		//stuList=searchManager.getStudentByRegNo(value);
		//request.setAttribute("stuList", stuList);
	}
}

 if(list1!=null){ %>
 <table>
 <tr>
		          <td class="title-14px">Class Id</td>
		          <td class="body-bold-text-12px">&nbsp;</td>
		          <td class="body-bold-text-12px">&nbsp;</td>
		          <td class="body-bold-text-12px">&nbsp;</td>
		          <td class="body-bold-text-12px">&nbsp;</td>
		          <td class="body-bold-text-12px">&nbsp;</td>
		          <td class="body-bold-text-12px">&nbsp;</td>
		          <td class="title-14px">Attended Date & Time</td>
		        </tr>
		        </table>
		         
 <%
	 for(int i=0;i<list1.size();i++) {
		 
		 %>
		<table>
		  <tr>
		  <td colspan="4"><img src="/student/themes/default/images/common/sub_table_dot_div.gif"></td>
		  </tr>
		        <tr>
		          <td class="body-bold-text-12px"><%=list1.get(i)%></td>
		          <td class="body-bold-text-12px"></td>
		          <td class="body-bold-text-12px"><%=list2.get(i)%></td>
		          
		        </tr>
		 </table>
		 <% 
	 }
%>
 












<%}else{%>
   <table>
	<tr>
    <td>Your Search Result Not Found</td>
  </tr>

 </table>
<%}%>