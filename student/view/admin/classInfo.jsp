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
%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><!-- InstanceBegin template="/Templates/main.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- InstanceBeginEditable name="doctitle" -->
<title>Student Management System</title>
<link href="../../themes/default/css/default.css" rel="stylesheet" type="text/css"> 
<link href="/student/themes/default/css/default.css" rel="stylesheet" type="text/css"> 
<link type="text/css" href="/student/scripts/jquery/themes/base/ui.all.css" rel="stylesheet" />
<script type="text/javascript" src="/student/scripts/jquery/jquery.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/jquery.form.js"></script>
<style type="text/css">
	html .jqueryslidemenu{height: 1%;} /*Holly Hack for IE7 and below*/
</style>	
<script type="text/javascript" src="/student/scripts/menu/jqueryslidemenu.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/jquery.AddIncSearch.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/ui/ui.core.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/ui/ui.dialog.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/external/bgiframe/jquery.bgiframe.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/ui/ui.datepicker.js"></script>


<link rel="stylesheet" href="../../themes/datepicker/include/ui-1.10.0/ui-lightness/jquery-ui-1.10.0.custom.min.css" type="text/css" />
    <link rel="stylesheet" href="../../themes/datepicker/jquery.ui.timepicker.css?v=0.3.3" type="text/css" />

    <script type="text/javascript" src="../../themes/datepicker/include/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="../../themes/datepicker/include/ui-1.10.0/jquery.ui.core.min.js"></script>
    <script type="text/javascript" src="../../themes/datepicker/include/ui-1.10.0/jquery.ui.widget.min.js"></script>
    <script type="text/javascript" src="../../themes/datepicker/include/ui-1.10.0/jquery.ui.tabs.min.js"></script>
    <script type="text/javascript" src="../../themes/datepicker/include/ui-1.10.0/jquery.ui.position.min.js"></script>

    <script type="text/javascript" src="../../themes/datepicker/jquery.ui.timepicker.js?v=0.3.3"></script>

   
    <style type="text/css">
        /* some styling for the page */
        body { font-size: 10px; /* for the widget natural size */ }
        #content { font-size: 1.0em; /* for the rest of the page to show at a normal size */
                   font-family: "Lucida Sans Unicode", "Lucida Grande", Verdana, Arial, Helvetica, sans-serif;
                   width: 950px; margin: auto;
        }
        .code { margin: 6px; padding: 9px; background-color: #3333FF; border: 1px solid #0000CC; }
        fieldset { padding: 0.5em 2em }
        hr { margin: 0.5em 0; clear: both }
        a { cursor: pointer; }
        #requirements li { line-height: 1.6em; }
    </style>

    <script type="text/javascript">

      

        $(document).ready(function() {
        	
        	
        	
            $("#saveInfo").click(function() {
            	
            	
        	    var discription = $('#discription').val();
        	    var subject 	= $('#subject').val();
        	    var stream    	= $('#stream').val();
        	    var year		= $('#year').val();
        	    var day			= $('#day').val();
        	    var startTime	= $('input:text[name=startTime]').val();
        	    var endTime		= $('input:text[name=endTime]').val();
        	    var selected 	= $("input[type='radio'][name='classType']:checked");
        	    var classType1	= selected.val();
        	   		   alert(classType1);
        		$.ajax({
        				type: "POST",
        				url: "/student/control/admin/classInfoCtrl.jsp",
        				data: {action: "saveClassInfo" , discription: discription,subject: subject,stream: stream ,year: year,day: day,startTime: startTime,endTime: endTime,classType1: classType1},
        				time: 10000,
        				dataType: "json",
        				cache: false,
        				success: function(data){
        					$("#response").show();
        					$("#response").html(data.msg);
        					$("#busyActivate").hide();
        					
        				},
        				error: function(data){
        					$("#response").addClass("error-bold-text-11px");	
        					$("#response").html("Oops!, Something went wrong!");
        					$("#response").removeClass("error-bold-text-11px");
        					$("#busyActivate").hide();
        				},
        				beforeSend: function(data){
        					$("#busyActivate").show();
        					
        			
        				} 
        			});
            	
            	
            	
            	
        	});
               
        	
        	
        	  test = function (){
        			
        	    	var selectedVal = "";
        	    	var selected = $("input[type='radio'][name='classType']:checked");
        	    	
        	    	    selectedVal = selected.val();
        	    	    alert(selectedVal);
        	    	
        	    	
        		}
        
        	
        	
            $('#floating_timepicker').timepicker({
                onSelect: function(time, inst) {
                    $('#floating_selected_time').html('You selected ' + time);
                }
            });

            $('#tabs').tabs();

        });


    </script>

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<body>
 <script type="text/javascript">
            $(document).ready(function() {
                $('#timepicker\\.\\[1\\]').timepicker( {
                    showAnim: 'blind'
                } );
				
				 $('#timepicker\\.\\[2\\]').timepicker( {
                    showAnim: 'blind'
                } );
            });
        </script>
        
        
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#81BEF7">
  <tr>
    <td height="75px"></td>
    <td valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>
          <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#CEE3F6">
          	<tr>
            <td colspan="3"><img src="/student/themes/default/images/common/header.jpg"  height="120" width="800"></td>
            </tr>
			<tr>
              <td align="left" valign="bottom"><!-- InstanceBeginEditable name="title-region" --><span class="title-16px">Student Management System </span><!-- InstanceEndEditable --></td>
              <td align="right" valign="bottom"><!-- InstanceBeginEditable name="userstatus-region" --><span class="user">You are logged in as <%= user.getUserName()%></span><!-- InstanceEndEditable --></td>
              <td align="right" valign="bottom"><!-- InstanceBeginEditable name="userstatus-region" --><a href="/student/view/login/login.html"><span class="logout">Sign out </span></a><!-- InstanceEndEditable --></td>
            </tr>
          </table></td>
      </tr>
      <tr>
        <td height="6px" bgcolor="#08088A"></td><!-- header boder above menu -->
      </tr>
      <tr>
         <td height="30px" bgcolor="#CEE3F6"><!-- InstanceBeginEditable name="menu-region" --><jsp:include page="/view/menu.jsp" flush="true" /><!-- InstanceEndEditable --></td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#81BEF7">&nbsp;</td><!-- LEft Side Color  -->
    <td align="left" valign="top"><!-- InstanceBeginEditable name="body-region" -->
     <div id="personalInfo">
      <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#CEE3F6">
      <tr>
        <td colspan="3" height="10px"></td>
      </tr>
      <tr>
        <td width="10px">&nbsp;</td>
        <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="title-14px">Class Information</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>
            <table id="stepOne" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td class="body-bold-text-12px">Class Id :</td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                  <td class="body-bold-text-12px" ><input name="classId" type="text" class="input" id="classId" ></td>
                  <td class="body-bold-text-12px">&nbsp;</td>
                  <td colspan="2" class="body-bold-text-12px"></td>
              </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
             <tr>
                <td class="body-bold-text-12px">Description :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="discription" type="text" class="input" id="discription" ></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
             <tr>
                <td colspan="7" height="10px"></td>
              </tr>
               <tr>
                <td class="body-bold-text-12px">Subject :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="subject" type="text" class="input" id="subject" ></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Stream :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="stream" type="text" class="input" id="stream" ></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Year :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="year" type="text" class="input" id="year" ></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Day :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><select name="day" type="text" class="input"
														id="day">
															<option id="Day" name="Day">Day</option>
															<option id="Monday" name="Monday">Monday</option>
															<option id="Tuesday" name="Tuesday">Tuesday</option>
															<option id="Wednesday" name="Wednesday">Wednesday</option>
															<option id="Thursday" name="Thursday">Thursday</option>
															<option id="Friday" name="Friday">Friday</option>
															<option id="Saturday" name="Female">Saturday</option>
															<option id="Sunday" name="Female">Sunday</option></select></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Start Time :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="startTime" type="text" class="input" id="timepicker.[1]" ></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">End Time :</td>
                <td class="body-bold-text-12px">&nbsp;</td>
                 <td><input name="endTime" type="text" class="input" id="timepicker.[2]" ></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Theroy :</td>
                 <td><input name="classType" type="radio" class="input" id="theory" value="Theory"></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Revision :</td>
                 <td><input name="classType" type="radio" class="input" id="revision" value="Revision" ></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Group :</td>
                 <td><input name="classType" type="radio" class="input" id="group" value="Group" ></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td class="body-bold-text-12px">Tute :</td>
                 <td><input name="classType" type="radio" class="input" id="tute" value="Tute" ></td>
                 <td class="body-bold-text-12px">&nbsp;</td>
                 <td colspan="3" class="body-bold-text-12px">&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7" height="10px"></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td></td>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			  </tr>
              <tr>
                <td colspan="7"><img src="/student/themes/default/images/common/sub_table_dot_div.gif"></td>
              </tr>
           </table>
            </td>	
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td id="response">&nbsp;</td>
          </tr>
          <tr>
          <td><a href="#" id="saveInfo" name="saveInfo" class="button" >Save</a></td>
      	<td></td>
      	<td></td>
      </tr> 
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td id="response2">&nbsp;</td>
          </tr>
          <tr>
          	<td><div id="regComp" ></div></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td id="response3">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>                             
        </table></td>
        <td width="10px">&nbsp;</td>
      </tr>
      <tr>
      	<td></td>
      	<td></td>
      	<td></td>
      </tr> 
      <tr>
        <td colspan="3" height="10px"></td>
      </tr>
      </table>
      </div>
      <!-- InstanceEndEditable -->
    </td>
    <td bgcolor="#81BEF7">&nbsp;</td><!-- Right Side Color -->
  </tr>
  <tr>
    <td valign="bottom" height="50px">&nbsp;</td>
    <td align="center" valign="top" width="800px">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="6px" bgcolor="#08088A"></td><!-- Foter border -->
      </tr>
      <tr>
        <td height="5px"></td>
      </tr>
      <tr>
        <td><span class="body-text-11px"> All Rights Reserved.</span></td>
      </tr>
      <tr>
        <td height="5px"></td>
      </tr>
    </table>
    </td>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
