package com.student.util;

	 
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.StringBufferInputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import net.sourceforge.barbecue.Barcode;
import net.sourceforge.barbecue.BarcodeException;
import net.sourceforge.barbecue.BarcodeFactory;
import net.sourceforge.barbecue.BarcodeImageHandler;

import org.w3c.dom.Document;
import org.xhtmlrenderer.pdf.ITextRenderer;

import com.student.user.IdDetailsManager;
import com.student.user.Student;
import com.student.user.IdDetails;
	 
public class PDFGenerater{
	private static String dateStr;
	public static String  getDateStr() {
		return dateStr;
	}

	public static final void getPdf(List<Student> stuList){
		 try {
			    Barcode barcode = null;
			    StringBuffer buf = new StringBuffer();
			    buf.append("<html>");
			    
			    buf.append("<head>");
			    buf.append("<link href='default.css' rel='stylesheet' type='text/css'>");
			    buf.append("</link>");
			    buf.append("</head>");
			    
			    	    
			    
			    
			    // generate the body
			    buf.append("<body>");
			   
			    
			    String pngImg="";
			    
			    for(Student stu:stuList){
			    	try {
			            barcode = BarcodeFactory.createCode128A(stu.getRegNo());
			            barcode.setBarWidth(1);
			        } catch (BarcodeException e) {
			            // Error handling
			        }
			    	
			    	  try {
				           File f = new File(stu.getRegNo()+".png");
				           BarcodeImageHandler.savePNG(barcode, f);
				      } catch (Exception e) {
				            // Error handling here
				       }
			    	  
			    	  DateFormat df = new SimpleDateFormat("MM-dd-yyyy");

			    	// Get the date today using Calendar object.
			    	Date today = Calendar.getInstance().getTime();        
			    	// Using DateFormat format method we can create a string 
			    	// representation of a date with the defined format.
			    	String reportDate = df.format(today);
			    	
			    	
			    	  String studentImage = stu.getRegNo()+".jpg";
			    	  //stu.getImgName()
			    	  
			    	  pngImg=stu.getRegNo()+".png";
			    	  buf.append("<h3>");
			    	  buf.append("<table background='background.jpg' style='border:1px solid blue;'>");
					  buf.append("<tr> <td colspan='3' align='center'>Victory College Acadamic Institute</td></tr>"); 
					  
					  
					  buf.append("<tr><td align='left'><div id='instituteImage' name='instituteImage' ><img src='VictoryCollege.jpg' width='50' height='50' style='border:2px solid #0B0B61'/></div></td><td class='body-bold-text-14px'>Student Identity Card</td>");
					  buf.append("<td ></td></tr>");
					  buf.append("<tr class='gridtable' ><td class='body-bold-text-12px'>Name :</td> <td class='body-bold-text-12px'>"+stu.getFullName()+"</td>");
					  buf.append("<td rowspan='3'><div id='instituteImage' name='instituteImage' ><img src='"+studentImage+"' width='65' height='70' style='border:2px solid #0B0B61'/></div></td>");
					  buf.append("</tr> <tr><td class='body-bold-text-12px'>NIC  :</td> <td class='body-bold-text-12px'>"+stu.getNic()+"</td></tr>");
					  buf.append("<tr><td class='body-bold-text-12px'>Reg No  :</td> <td class='body-bold-text-12px'>"+stu.getRegNo()+"</td> </tr>");
					  buf.append("<tr><td class='body-bold-text-12px'>Date of Issue  :</td> <td class='body-bold-text-12px'>"+reportDate+"</td></tr>");
					  buf.append("<tr><td ><div id='barcode' name='barcode' ><img src='"+pngImg+"' width='150' height='40' style='border:2px solid #0B0B61'></img></div></td> </tr>");
					  buf.append("</table>");
					  buf.append("</h3>");
			    	  
			     
			    }
		        
			    buf.append("</body>");
			    buf.append("</html>");
			    
			    
			    
			    DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
			    Document doc = builder.parse(new StringBufferInputStream(buf.toString()));

			    ITextRenderer renderer = new ITextRenderer();
			    renderer.setDocument(doc, null);
			    Date dte=new  Date();
			    String outputFile = dte.getYear()+"-"+dte.getMonth()+"-"+dte.getDate()+"-"+dte.getMinutes()+".pdf";
			    
			    IdDetailsManager idManager=IdDetailsManager.getInstance();
			    IdDetails idDetails=new IdDetails();
			    idDetails.setName(outputFile);
			    idDetails.setCreatedTime(new Date());
			    idDetails.setAddmission("N");
			    idManager.insertIdDetails(idDetails);
			    dateStr=outputFile;
			    OutputStream os = new FileOutputStream("C://Studentmgt/idPdf/"+outputFile);
			    renderer.layout();
			    renderer.createPDF(os);
			    os.close();
	      }catch (Exception e) {
	    	  e.printStackTrace();
	      }
	}
	

	public static void openDoc(){
	//Document docu=	getPdf();
	//docu.open();
	}
}
