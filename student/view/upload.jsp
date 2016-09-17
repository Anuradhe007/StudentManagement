<%@ page import="java.io.*" %>
<%@ page import="com.student.user.StudentManager" %>
<%@ page import="com.student.user.Student" %>
<%@ page import="com.student.regNo.SaveRegNo" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<html>
<head>
<link href="../../themes/default/css/default.css" rel="stylesheet" type="text/css"> 
<link href="/student/themes/default/css/default.css" rel="stylesheet" type="text/css"> 
<link type="text/css" href="/student/scripts/jquery/themes/base/ui.all.css" rel="stylesheet" />
<script type="text/javascript" src="/student/scripts/jquery/jquery.js"></script>
<script type="text/javascript" src="/student/scripts/jquery/jquery.form.js"></script>
</head>
<%
        //to get the content type information from JSP Request Header
     String message = "";
                //we are taking the length of Content type data
                ///////////////////////////////////////////////////////////////////
            /*     try
            	{
            			String ImageFile="";
            			String itemName = "";
            			
            			FileItemFactory factory = new DiskFileItemFactory();
            			ServletFileUpload upload = new ServletFileUpload(factory);
            			List items = null;
            			try
            			{
            				items = upload.parseRequest(request);
            			}
            			catch (FileUploadException e)
            			{
            				e.getMessage();
            			}
            			 
            			Iterator itr = items.iterator();
            			while (itr.hasNext())
            			{
            				FileItem item = (FileItem) itr.next();
            				if (item.isFormField())
            					{
            					String name = item.getFieldName();
            					String value = item.getString();
            		
            					if(name.equals("ImageFile"))
            					{
            					ImageFile=value;
            					}
            					 
            				}else{
            					try
            					{
            					itemName = item.getName();
            					
            					File savedFile = new File("/student/themes/default/images/"+itemName);
            					System.out.println("savedFile.getPath()>>>>"+savedFile.getPath());
            					item.write(savedFile);
            					}
            					catch (Exception e)
            					{
            					out.println("Error  savinggggg--"+e.getMessage());
            					}
            				}
            			}
            	
            }
            catch (Exception e){
            out.println(e.getMessage());
            }
                
                 */
                
                
                
                
                
                
                
                
                
                //////////////////////////////////////////////////////////////////////////////////
           System.out.println("<<<<<<<<<<<<kad>>>>>>>>>>>>");
           
                 SaveRegNo saveReg = new SaveRegNo();
        String contentType = request.getContentType();
        //String nicNo=request.getParameter("regisNo");
       String nicNo = saveReg.getRegNo();
       //String nicNo = "2016MA0019";
        StudentManager sm = StudentManager.getInstance();
        Student student=null;
        student=sm.getStudentByNIC(nicNo);
        System.out.println("before nicccccccc>>>>");
        System.out.println("contentType"+contentType);
        System.out.println("iss multi part>>"+contentType.indexOf("multipart/form-data"));
        if (nicNo!=null &&  (contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
        	System.out.println("regNo nicccccccc>>>>"+nicNo);    
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
                saveFile=nicNo+".jpg";
                /* if(dataBytes!=null && dataBytes.length>0){
                	student.setImage(dataBytes);
                	student.setImgName(saveFile);
                    sm.saveStudentInfo(student);
                } */
                
                
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
			
                FileOutputStream fileOut = new FileOutputStream("C://Studentmgt/student/ProfPics/"+saveFile,false);
                request.setAttribute("saveFile", saveFile);
                fileOut.write(dataBytes, startPos, (endPos - startPos));
                fileOut.flush();
                fileOut.close(); 
                
                
                FileOutputStream fileOut2 = new FileOutputStream(saveFile,false
                		);
                fileOut2.write(dataBytes, startPos, (endPos - startPos));
                fileOut2.flush();
                fileOut2.close(); 
                
               message = "Successfully Registered! Student Registration No "+nicNo;
                               
                }
        
%>

<body onload="readyFunction()">

	<script>
	
		function readyFunction(){
//your js function
			
			$("#imageform").attr("action", '/student/control/registration/registrationCtrl.jsp?action=showRegistration&MSG=<%=message%>');
			$("#imageform").submit();
			
}
</script>


<form id="imageform" method="post" action='/student/control/registration/registrationCtrl.jsp?action=showRegistration&MSG=<%=message%>'>
 																											    
</form>
   
</body>
</html>