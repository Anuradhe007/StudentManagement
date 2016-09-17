<%@page import="com.student.user.IdDetailsManager"%>
<%@page import="com.student.user.IdDetails"%>
<%@ page import="java.io.*" %>

<%

OutputStream outStream = response.getOutputStream();
String fileName=request.getParameter("name");
String admission=request.getParameter("admission");
String filePath=null;
if(admission.equals("Y")){
	filePath = "C://Studentmgt/Admissions";
}else{
	filePath = "C://Studentmgt/idPdf";
}


//String filePath = "E:\\workspace\Studentmgt\student\themes\default\images";
File f=new File(filePath, fileName);
//String fileType = fileName.substring(fileName.indexOf(".")+1,fileName.length());
response.setContentType( "application/pdf" );


/* if (fileType.trim().equalsIgnoreCase("txt")) {
    response.setContentType( "text/plain" );
} else if (fileType.trim().equalsIgnoreCase("doc")) {
    response.setContentType( "application/msword" );
} else if (fileType.trim().equalsIgnoreCase("xls")) {
    response.setContentType( "application/vnd.ms-excel" );
} else if (fileType.trim().equalsIgnoreCase("pdf")) {
    response.setContentType( "application/pdf" );
    log.debug("content type set to pdf");
} else {
    response.setContentType( "application/octet-stream" );
} */

response.setContentLength((int)f.length());
//response.setHeader("Content-Disposition","attachment; filename=\"SecurityPatterns.pdf\"");
response.setHeader("Cache-Control", "max-age=60");
//response.setHeader("Cache-Control", "no-cache");
byte[] buf = new byte[8192];
FileInputStream inStream = new FileInputStream(f);
int sizeRead = 0;
while ((sizeRead = inStream.read(buf, 0, buf.length)) > 0) {
    outStream.write(buf, 0, sizeRead);
}
inStream.close();
outStream.close();


%>

