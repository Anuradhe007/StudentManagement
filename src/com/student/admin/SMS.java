package com.student.admin;




import org.apache.commons.httpclient.*;
import org.apache.commons.httpclient.methods.*;

public class SMS {
 public static boolean sendSMS(String msisdn, String regNo,String name) {
	 boolean result = false;
	 String msgText = "Hi "+name+ " Your Registration on Victory College is Successfull . Your Registration No : "+regNo;
   String url = "http://127.0.0.1:9333/ozeki";
   String wapPush= " <si>"+
                   "    <indication href=\"http://wap.yahoo.com/\" action=\"signal-high\">"+
                   "        A WAP Push message, that sends the browser to wap.yahoo.com."+
                   "    </indication>"+
                   "</si>";
   try {
    HttpClient client = new HttpClient();
    PostMethod method = new PostMethod( url );

  // Configure the form parameters
  method.addParameter( "login", "admin" );
  method.addParameter( "password", "abc123" );
  // method.addParameter( "operator", "Vodafone" );
  method.addParameter( "action", "sendMessage" );
  method.addParameter( "messageType", "SMS:TEXT" );
  method.addParameter( "recepient", msisdn );
  method.addParameter( "messageData", msgText );

  // Execute the POST method
    int statusCode = client.executeMethod( method );
    if( statusCode != -1 ) {
      String contents = method.getResponseBodyAsString();
      method.releaseConnection();
      System.out.println( contents );
      result = true;
      
    }
   }
   catch( Exception e ) {
    e.printStackTrace();
   }
   return result;
 }
 
 public static void main (String aaa[]){
	 sendSMS("0783861241","2013V0012","Sirisena");
 }
}