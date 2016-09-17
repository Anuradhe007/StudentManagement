package com.student.user;

import java.io.*;   
import java.sql.*;   
import java.util.*;   
   
public class ImageUpload   
{   
	Connection con=null;   
   
	public ImageUpload()   
	{   
   
	}   
	public void getFile(String filename1) throws Exception   
	{   
			System.out.println("Before DataBase Connection1");   
			PreparedStatement pst = null;   
			ResultSet rs=null;   
			String s1="gif";  
			try   
			{   
					Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");  
                                          con=DriverManager.getConnection("jdbc :-o  dbc:RT"," "," ");  
        
                         pst = con.prepareStatement("select images from pic where ftype=?");   
                         pst.setString(1,filename1);   
                        rs=pst.executeQuery();         
                        while(rs.next())   
                        {   
                        		byte[] b=rs.getBytes("images");   
                                    System.out.println("b size= "+b.length);  
                                    if(filename1.equals(s1))  
                                    {  
                                    	FileOutputStream fos=new FileOutputStream(new File(".gif ")); 
                                    	fos.write(b,0,b.length);  
                                    	fos.flush();   
                                    	fos.close();  
                                    }  
                                    else  
                                    {  
                                                      FileOutputStream fos=new FileOutputStream(new File(".jpg "));   
                                                      fos.write(b,0,b.length);  
                                                      fos.flush();   
                                                      fos.close();  
                                    }  
  
                        }   
  
                        System.out.println("File Written Successfully");   
			}   
			catch(Exception e)   
			{   
				System.out.println(" Problem : "+e);   
			}   
			finally   
			{   
				con.close();   
				pst.close();   
			}   
   
	}   
public static void main(String args[]) throws Exception   
{   
ImageUpload store1=new ImageUpload();  
System.out.println("What is The File Description ");  
String filename1 = new BufferedReader(new InputStreamReader(System.in)).readLine();   
store1.getFile(filename1);   
}   
   
}     