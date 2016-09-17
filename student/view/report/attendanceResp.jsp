<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.util.*,
    		com.student.user.*,
    		com.student.exception.*,
    		com.dialog.util.Utility"
    		errorPage="/view/error.jsp"	
    buffer="8kb"%>

<%
String json1 = null;
String json = null;
ArrayList<Integer> students = null;
ArrayList<String> attenDte = null;
JSONArray jarray = null;
JSONArray jarray1 = null;
     students 	  = (ArrayList<Integer>)request.getAttribute("stdNumb");
    
     attenDte 	  = (ArrayList<String>)request.getAttribute("attnDte");
     
     
    
     String stdNumb [] = new String[students.size()];
     
     Object attendanceDte [] = new Object[attenDte.size()];
     
     String longTxt    = "";
     
     Iterator listIterator 	= students.iterator();
     Iterator listIterator2 = attenDte.iterator();
	 int i=0;
	 int j =0;
     while (listIterator.hasNext()) {
            
             stdNumb[i] = listIterator.next().toString();
             i++;
     }
     while (listIterator2.hasNext()) {
    	 if(j==0){
    		 longTxt = listIterator2.next().toString();
    	 }
    	 if(j!=0){
    	 attendanceDte[j] = listIterator2.next().toString();
    	
    	 }
         j++;
 }
     jarray1 = new JSONArray();
     jarray1.addAll(students);
     json1 = jarray1.toJSONString();
    
    	jarray = new JSONArray();
      jarray.addAll(attenDte);
       json = jarray.toJSONString();
    
%>	{"students": <%=json1%>,"attenDte": <%=json%>}

