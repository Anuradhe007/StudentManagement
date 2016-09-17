<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.*" %>
<%@ page import="com.student.user.StudentManager" %>
<%@ page import="com.student.user.Student" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<link href="../../themes/default/css/default.css" rel="stylesheet" type="text/css"> 
<link href="/student/themes/default/css/default.css" rel="stylesheet" type="text/css"> 
<link type="text/css" href="/student/scripts/jquery/themes/base/ui.all.css" rel="stylesheet" />
</head>
<%
        //to get the content type information from JSP Request Header
        String contentType = request.getContentType();
        //here we are checking the content type is not equal to Null and
        String nicNo=request.getParameter("nicVal");
        StudentManager sm = StudentManager.getInstance();
        Student student=null;
        student=sm.getStudentByNIC(nicNo);
        if (nicNo!=null && student!=null && (contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
                DataInputStream in = new DataInputStream(request.getInputStream());
                //we are taking the length of Content type data
                
                
                int formDataLength = request.getContentLength();
                byte dataBytes[] = new byte[formDataLength];
                System.out.println("ddddddddd>>>>"+dataBytes.length);
                if(dataBytes!=null && dataBytes.length>0){
                	student.setImage(dataBytes);
                    sm.saveStudentInfo(student);
                }
                
                int byteRead = 0;
                //student.setImage(dataBytes);
                int totalBytesRead = 0;
                //this loop converting the uploaded file into byte code
                while (totalBytesRead < formDataLength) {
                        byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                        totalBytesRead += byteRead;
                        }
                       String file = new String(dataBytes);
                       
                //for saving the file name
                String saveFile = file.substring(file.indexOf("filename=\"") + 10);
                saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
                saveFile=nicNo+".jpg";
                int lastIndex = contentType.lastIndexOf("=");
                String boundary = contentType.substring(lastIndex + 1,contentType.length());
                int pos;
                //extracting the index of file 
                pos = file.indexOf("filename=\"");
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                int boundaryLocation = file.indexOf(boundary, pos) - 4;
                int startPos = ((file.substring(0, pos)).getBytes()).length;
                int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
                // creating a new file with the same name and writing the content in new file
				request.setAttribute("saveFile", saveFile);
                FileOutputStream fileOut = new FileOutputStream("/student/themes/default/images/"+saveFile);
                fileOut.write(dataBytes, startPos, (endPos - startPos));
             
                fileOut.flush();
                fileOut.close();
                                %><Br>
                                <table>
                               	 	<tr>
                                		<td class="body-bold-text-12px"><img alt="img" src="/student/themes/default/images/45890.jpg"/> </td>
                                	</tr>
                                </table>
 
                <%
                }else{%>
                	<Br>
                                <table>
                               	 	<tr>
                                		<td class="body-bold-text-12px">Upload is not success.Check the image and try Again..OR Continue without Image </td>
                                	</tr>
                                </table>
                <%}
%>




































<%
	
%>
















</html>