<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.student.payment.Payment"%>
<%@page import="com.student.payment.PaymentManager"%>

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
$('#popupBoxClose').click( function() {           
    unloadPopupBox();
}); 

 function unloadPopupBox() {    // TO Unload the Popupbox
     $('#popup_box').fadeOut("slow");
     $('#popup_box').hide();
    
}   

function loadPopupBox(classId) {    // To Load the Popupbox
  $.post("classCatPopUpView.jsp",{ classId:classId}, function(data) {
	    	$('#popup_box').show();
			$("#popup_box").html(data);
	   }); 
   $('#popup_box').fadeIn("slow");
            
}    


function unload(){
	unloadPopupBox();
}


//-->
</script>
<%
String year = request.getParameter("year");
String month = request.getParameter("month");
List<Payment> pmntLst=null;
PaymentManager paymentManager=PaymentManager.getInstance();
pmntLst=paymentManager.getPaymentByMonthAndYear(year,month);
request.setAttribute("pmntLst", pmntLst);
request.setAttribute("year", year);
request.setAttribute("month", month);
/* if(name!=null && value!=null){
		stuList=paymentManager.getPaymentByMonthAndYear(year,month);
		request.setAttribute("pmntLst", pmntLst);
	
} */

 if(pmntLst!=null){
%>
 

<table >
	<tr>
    <td class="body-bold-text-12px">Class Id</td>
    <td class="body-bold-text-12px">Total Income Amount</td>
    <td class="body-bold-text-12px">Year & Month</td>
    <td class="body-bold-text-12px"></td>
  </tr>
  <tr>
  <td colspan="4"><img src="/student/themes/default/images/common/sub_table_dot_div.gif"></td>
  </tr>
<c:forEach var="payment" items="${pmntLst}">
        <tr>
          <td class="body-bold-text-12px"><a onclick="loadPopupBox('${payment.classId}')"><u>${payment.classId}</u></a></td>
          <td class="body-bold-text-12px">${payment.fee}</td>
          <td class="body-bold-text-12px">${year}-${month} </td>
        </tr>
 </c:forEach>
 </table>
 <br>
 <input type="Button" name="print" value="Print"/>



 





<%}else{%>
   <table>
	<tr>
    <td>Your Search Result Not Found</td>
  </tr>

 </table>
<%}%>