package com.student.communication;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.student.DB.DBCon;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class SendMail {

	 public String getClassId(String className) {
		 String sql = "SELECT id FROM classcategory where classId='"+className+"'";
			String classId = null;
			Connection con = null;
		    Statement st = null;
		    ResultSet rst = null;


		    try {
		        con = DBCon.getConnection();
		        st = con.createStatement();
		       rst =  st.executeQuery(sql);
		      
		      
		      while(rst.next())
		    	  classId =  rst.getString("id");
		    	
		      con.close();

		    } catch (Exception ex) {
		        ex.printStackTrace();

		    } 
		    return classId;
	 }
	 
	 public ArrayList<String> getStudentId(String classId){
		 ArrayList<String> idList = new ArrayList<String>();
		 
		 String sql = "SELECT studentId FROM student_class where classId='"+classId+"'";
			Connection con = null;
		    Statement st = null;
		    ResultSet rst = null;


		    try {
		        con = DBCon.getConnection();
		        st = con.createStatement();
		       rst =  st.executeQuery(sql);
		      
		      
		      while(rst.next())
		    	  idList.add(rst.getString("studentId")); 
		    	
		      con.close();

		    } catch (Exception ex) {
		        ex.printStackTrace();
		    } 
		    return idList;
	 }
	 
	 public ArrayList<String> getStudentEmail(ArrayList<String> list) throws SQLException {
		 
		 ArrayList<String> emails = new ArrayList<String>();
		 for(String id:list) {
			 String sql = "SELECT EMAIL FROM studentinfo where ID='"+id+"'";
			Connection con = null;
		    Statement st = null;
		    ResultSet rst = null;


		    try {
		        con = DBCon.getConnection();
		        st = con.createStatement();
		       rst =  st.executeQuery(sql);
		      
		      
		      while(rst.next())
		    	  emails.add(rst.getString("EMAIL").toLowerCase()); 
		    	
		      

		    } catch (Exception ex) {
		        ex.printStackTrace();
		    }
		    con.close();
		 }
		 
		 return emails;
	 }
	
	 /**
	  * This method is used to send mails
	  * @param receiverAddress
	  * @param Subject
	  * @param message
	  * @param filePath
	  * @return true if successfully sending mails
	  */
		public boolean mailSend(String receiverAddress,String Subject , String messageBody ,String filePath) {
			boolean result = false;
			//final String username = "gmherath@gmail.com";
			//final String password = "gayannisa";
	 
			final String username = "anu.bab007@gmail.com";
			final String password = "19920218";
			
			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");
	 
			Session session = Session.getInstance(props,
			  new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			  });
	 
			try {
	 
				
				
				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress("VictoryCollege@gmail.com"));
				message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(receiverAddress));
				message.setSubject(Subject);
				//message.setText( messageBody);
				//message.setFileName(filePath);
				
				 BodyPart messageBodyPart = new MimeBodyPart();

		         // Now set the actual message
		         messageBodyPart.setText(messageBody);

		         // Create a multipar message
		         Multipart multipart = new MimeMultipart();

		         // Set text message part
		         multipart.addBodyPart(messageBodyPart);

		         // Part two is attachment
		        
		         if(filePath.equals("No")) {
		        	
		        	 System.out.println("No attachment");
		         } else {
		        	 messageBodyPart = new MimeBodyPart();
			         DataSource source = new FileDataSource(filePath);
			         messageBodyPart.setDataHandler(new DataHandler(source));
		        	 messageBodyPart.setFileName(filePath);
		        	 multipart.addBodyPart(messageBodyPart);
		         }
		         

		         // Send the complete message parts
		         message.setContent(multipart);


				
				System.out.println(receiverAddress);
				System.out.println(Subject);
				System.out.println(messageBody);
				System.out.println(filePath);
				System.out.println("Trying ........");
				Transport.send(message);
	 
				
				result= true;
	 
			} catch (MessagingException e) {
				throw new RuntimeException(e);
			}
			return result;
		}
		
		public boolean sendEmailGroup(ArrayList<String> list,String Subject , String messageBody ,String filePath) {
			final String username = "anu.bab007@gmail.com";
			final String password = "19920218";

			boolean result = false;
			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");

			Session session = Session.getInstance(props,
			  new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			  });
			
			try {
				for (String s : list) {
					
					Message message = new MimeMessage(session);
					message.setFrom(new InternetAddress("VictoryCollege@gmail.com"));
					message.setRecipients(Message.RecipientType.TO,
						InternetAddress.parse(s));
					message.setSubject(Subject);
					//message.setText( messageBody);
					//message.setFileName(filePath);
					
					 BodyPart messageBodyPart = new MimeBodyPart();

			         // Now set the actual message
			         messageBodyPart.setText(messageBody);

			         // Create a multipar message
			         Multipart multipart = new MimeMultipart();

			         // Set text message part
			         multipart.addBodyPart(messageBodyPart);

			         // Part two is attachment
			         
			         if(filePath.equals("No")) {
				        	
			        	 System.out.println("No attachment");
			         } else {
			        	 messageBodyPart = new MimeBodyPart();
				         DataSource source = new FileDataSource(filePath);
				         messageBodyPart.setDataHandler(new DataHandler(source));
			        	 messageBodyPart.setFileName(filePath);
			        	 multipart.addBodyPart(messageBodyPart);
			         }
			         

			         // Send the complete message parts
			         message.setContent(multipart);  
			         Transport.send(message);
			    }
				result = true;
				
			} catch (MessagingException e) {
				throw new RuntimeException(e);
			}
			return result;
		}
/*		
		public static void main (String aaa[]) throws SQLException{
			SendMail mail = new SendMail();
			//boolean check = mail.mailSend("gmherath@gmail.com","Student Registration","You successfully registered", "E:\\oui_mem_leak.txt");
			//if(check){
				//System.out.println("Successfully  sent .....");
			//}
			String a = mail.getClassId("Physics_2014");
			System.out.println(a);
			System.out.println(mail.getStudentId(a));
			System.out.println(mail.getStudentEmail(mail.getStudentId(a)));
			System.out.println(mail.sendEmailGroup(mail.getStudentEmail(mail.getStudentId(a)), "Test","Test", "C://Users/Prabhath/Downloads/bird.jpg"));
		} 
	*/
}
