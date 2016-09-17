<%@page import="com.student.admin.ClassCategoryManager"%>
<%@page import="com.student.admin.ExamManager"%>
<%@page import="com.student.admin.Exam"%>
<%@page import="com.student.payment.Payment"%>
<%@page import="com.student.user.StudentManager"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.student.admin.ClassCategory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.util.*,
    		com.student.user.*,
    		com.student.exception.*"
    errorPage="/view/error.jsp"		
    buffer="8kb"%><%
    User user = (User)session.getAttribute("user");
    if((user==null) || (user.getUserName()==null)) {
        throw new UserVerificationException(new Exception("You are not logged in"),"/student/view/login/login.html");
    }    
    
    //ArrayList<Location> locations = (ArrayList<Location>)request.getAttribute("locations");
   // locations = locations==null?new ArrayList<Location>():locations;
%>


<style type="text/css">
/* popup_box DIV-Styles*/
#popup_box {
    display:none; /* Hide the DIV */
    position:fixed;  
    _position:absolute; /* hack for internet explorer 6 */  
    height:300px;  
    width:600px;  
    background:#FFFFFF;  
    left: 300px;
    top: 150px;
    z-index:100; /* Layering ( on-top of others), if you have lots of layers: I just maximized, you can change it yourself */
    margin-left: 15px;  
   
    
   
}

#container {
    background: #d2d2d2; /*Sample*/
    width:100%;
    height:100%;
}

a{ 
cursor: pointer; 
text-decoration:none; 
}

/* This is for the positioning of the Close Link */
#popupBoxClose {
    font-size:20px;  
    line-height:15px;  
    right:5px;  
    top:5px;  
    position:absolute;  
    color:#6fa5e2;  
    font-weight:500;      
}
</style>   



<script type="text/javascript">
   
   // $(document).ready( function() {
   
        // When site loaded, load the Popupbox First
        
   
        $('#popupBoxClose').click( function() {           
            unloadPopupBox();
        }); 
       
         function unloadPopupBox() {    // TO Unload the Popupbox
             $('#popup_box').fadeOut("slow");
             $('#popup_box').hide();
            
        }   
       
        function loadPopupBox(regNo,id) {    // To Load the Popupbox
          $.post("examStudentPopUpView.jsp",{ regNo: regNo,classId:id}, function(data) {
     	    	$('#popup_box').show();
     			$("#popup_box").html(data);
     	   }); 
           $('#popup_box').fadeIn("slow");
                    
        }    
        
        
        function unload(){
        	unloadPopupBox();
        }
        
        function addAddmission(regNo,id,examnum){
        	
        	
        	$.post("addAdmission.jsp",{ regNo: regNo,classId:id,examNo:examnum,action:'save'}, function(data) {
     	    	$('#result_'+regNo).show();
     			$("#result_"+regNo).html(data);
     			
     	   }); 
        }
        
  //  });
</script>  






<%
String examNum = request.getParameter("examNum").toString();
List<Payment>paymntLst= ExamManager.getInstance().getPaymentByExamNo(examNum);
request.setAttribute("paymntLst", paymntLst);
request.setAttribute("examNum", examNum);
%>
<div id="result"></div>
<c:choose>
	<c:when test="${paymntLst==null}">
		No Students for this Exam
	</c:when>
	
	<c:otherwise>
	<table bgcolor="#CEE3F6" width="800" >
	<tr>
    <td class="body-bold-text-12px">Registration Number</td>
    <td class="body-bold-text-12px">Class Id</td>
  </tr>
  <tr>
  <td colspan="4"><img src="/student/themes/default/images/common/sub_table_dot_div.gif"></td>
  </tr>
	<c:forEach var="payment" items="${paymntLst}">
	        <tr>
	          <td class="body-bold-text-12px"><a onclick="loadPopupBox('${payment.regNo}','${payment.classId}')"><u>${payment.regNo}</u></a></td>
	          <td class="body-bold-text-12px">${payment.classId}</td>
	          <td class="body-bold-text-12px"><a  onclick="addAddmission('${payment.regNo}','${payment.classId}','${examNum}')"><div id="result_${payment.regNo}"><u>Add To Exam</u></div></a></td>
	        </tr>
	        
	 </c:forEach>
	 <tr>
	 <td>
	 </td>
	 </tr>
 </table>
	</c:otherwise>
	
	
</c:choose>
 
 

 <div id="popup_box">    
   	    <a id="popupBoxClose" >Close</a>
</div>
 