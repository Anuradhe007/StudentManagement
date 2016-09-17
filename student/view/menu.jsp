<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.util.*,
    		com.student.user.*,
    		com.student.exception.UserVerificationException"
    errorPage="/view/error.jsp"		
    buffer="8kb"%><%
    User user = (User)session.getAttribute("user");
    //User role = ((User)session.getAttribute("role"));
    
    //String newRole = role.getUserRole();
    //System.out.println(newRole+"Bla bla");
    if((user==null) || (user.getUserName()==null)) {
        throw new UserVerificationException(new Exception("You are not logged in"),"/student/view/login/login.html");
    }
%><div id="myslidemenu" class="jqueryslidemenu">
	<ul>
		<li><a id="menu1" class='gray-body-bold-text' href="#">Administrator Panel</a>
		<ul style="z-index: 10;">
			<li><a href="/student/control/admin/adminCtrl.jsp?action=changePassword" class='gray-body-bold-text'>Change Password</a></li>
		<!-- <li><a href="/student/control/admin/categoryCtrl.jsp?action=classCategory" class='gray-body-bold-text'>Class Category</a></li> -->	
		<%if(user.getUserRole().equalsIgnoreCase("Administrator")) {%><li><a href="/student/control/admin/adminCtrl.jsp?action=showUsers" class='gray-body-bold-text'>Create Users</a></li>
    	<% }%>
         	 
			<!--	<li><a href="/student/control/admin/adminCtrl.jsp?action=generateReg" class='gray-body-bold-text'>Format Reg No</a></li> -->
    	<!--  <li><a href="/student/control/admin/adminCtrl.jsp?action=classInfo" class='gray-body-bold-text'>Class Info</a></li> -->	
    		
    		<li><a href="/student/control/admin/adminCtrl.jsp?action=sendMail" class='gray-body-bold-text'>Send EMail</a></li>
		</ul>
		</li>					
		<li><a href="#" class='gray-body-bold-text'>Student</a>
		<ul style="z-index: 10;">
			<li><a href="/student/control/registration/registrationCtrl.jsp?action=showRegistration" class='gray-body-bold-text'>Registration</a></li>
			<li><a href="/student/control/admin/categoryViewCtrl.jsp?action=classCategory" class='gray-body-bold-text'>Class Category</a></li>
			<li><a href="/student/control/search/studentClassReg.jsp?action=showSearch" class='gray-body-bold-text'>View / Edit Student Profile</a></li>
			<li><a href="/student/control/payment/paymentCtrl.jsp?action=showPayment" class='gray-body-bold-text'>Payment</a></li>
			<li><a href="/student/control/admin/idGenerateCtrl.jsp?action=generateReg" class='gray-body-bold-text'>Generate ID </a></li>
    		<li><a href="/student/control/admin/idViewCtrl.jsp?action=generateReg" class='gray-body-bold-text'>View Student ID </a></li>
			<li><a href="/student/control/admission/userAttendenceCtrl.jsp?action=showSearch" class='gray-body-bold-text'>Student Attendence</a></li>
			<li><a href="/student/control/search/searchCtrl.jsp?action=showSearch" class='gray-body-bold-text'>Search Student</a></li>
			
		</ul>
		</li>
		
		<li><a id="menu1"  class='gray-body-bold-text' href="#">Exam Manager</a>
		<ul style="z-index: 10;">
			<li><a href="/student/control/admin/examViewCtrl.jsp?action=changePassword" class='gray-body-bold-text'>View/Add Exams</a></li>
			<li><a href="/student/control/admin/examRegisterViewCtrl.jsp?action=changePassword" class='gray-body-bold-text'>Register Students for Exams</a></li>
			<li><a href="/student/control/admin/studentAddmissionPdfGenerate.jsp?action=changePassword" class='gray-body-bold-text'>Generate Student Addmissions</a></li>
			<li><a href="/student/control/admin/addmissionPdfViewCtrl.jsp?action=generateReg" class='gray-body-bold-text'>View Generated Addmissions</a></li>
			<li><a href="/student/control/exam/examCtrl.jsp?action=showExam" class='gray-body-bold-text'>Exam Marks</a></li>
		
		</ul>
		</li>
		
		<li><a id="menu2" class='gray-body-bold-text' href="#">Report</a>
		<ul style="z-index: 10;">
            <li><a href="/student/control/exam/examCtrl.jsp?action=showAverage" class='gray-body-bold-text'>View Average</a></li>
            <li><a href="/student/control/report/reportCtrl.jsp?action=attendance" class='gray-body-bold-text'>Attendance Report </a></li>
            <li><a href="/student/view/report/viewAtnd.jsp?action=attendanceView" class='gray-body-bold-text'>View Attendance </a></li>
            <li><a href="/student/control/admin/monthlyRental.jsp?action=showRegistration" class='gray-body-bold-text'>Monthly Income </a></li>
		</ul>
        </li>
        
		<li><a href="/student/view/home.jsp" class='gray-body-bold-text'>Home</a></li>					
	</ul>			
</div>