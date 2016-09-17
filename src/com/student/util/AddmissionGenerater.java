package com.student.util;

	 
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.StringBufferInputStream;
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

import com.student.admin.Addmission;
import com.student.user.IdDetails;
import com.student.user.IdDetailsManager;
	 
public class AddmissionGenerater{
	private static String dateStr;
	public static String  getDateStr() {
		return dateStr;
	}

	public static final void getPdf(List<Addmission> admList){
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
			    
			    for(Addmission adm:admList){
			    	try {
			            barcode = BarcodeFactory.createCode128A(adm.getRegNo());
			            barcode.setBarWidth(1);
			        } catch (BarcodeException e) {
			            // Error handling
			        }
			    	
			    	  try {
				           File f = new File(adm.getRegNo()+adm.getExam().getExamNumber()+".png");
				           BarcodeImageHandler.savePNG(barcode, f);
				      } catch (Exception e) {
				            // Error handling here
				       }
			    	  pngImg=adm.getRegNo()+adm.getExam().getExamNumber()+".png";
			    	  //stu.getImgName()
			    	  String naee="student.jpg";
			    	  buf.append("<h3>");
			    	  buf.append("<table background='background.jpg' style='border:1px solid blue;'>");
					  buf.append("<tr> <td colspan='3' align='center'>Victory College Acadamic Institute</td></tr>"); 
					  
					  
					  buf.append("<tr><td align='left'><div id='instituteImage' name='instituteImage' ><img src='VictoryCollege.jpg' width='50' height='50' style='border:2px solid #0B0B61'/></div></td><td class='body-bold-text-14px'>Student Admission Card</td>");
					  buf.append("<td ></td></tr>");
					  buf.append("<tr><td height='20px'></td></tr>");
					  buf.append("<tr class='gridtable' ><td class='body-bold-text-12px'>Name :</td> <td class='body-bold-text-12px'>"+adm.getStudent().getFullName()+"</td>");
					  buf.append("</tr> <tr><td class='body-bold-text-12px'>NIC  :</td> <td class='body-bold-text-12px'>"+adm.getStudent().getNic()+"</td></tr>");
					  buf.append("<tr><td class='body-bold-text-12px'>Reg No  :</td> <td class='body-bold-text-12px'>"+adm.getStudent().getRegNo()+"</td> </tr>");
					  buf.append("<tr><td class='body-bold-text-12px'>Issued Date  :</td> <td class='body-bold-text-12px'>"+new Date()+"</td></tr>");
					  buf.append("<tr><td class='body-bold-text-12px'>Exam ID  :</td> <td class='body-bold-text-12px'>"+adm.getExam().getDescription()+"</td></tr>");
					  buf.append("<tr><td height='20px'></td></tr>");
					  buf.append("<tr><td colspan='3'><table border='2'><tr><td class='body-bold-text-12px'>Subject</td><td class='body-bold-text-12px'>Date</td><td class='body-bold-text-12px'>Start time</td><td class='body-bold-text-12px'>End Time</td><td class='body-bold-text-12px'>Student's Signature</td><td class='body-bold-text-12px'>Supervisor's Signature</td></tr>");
					  buf.append("<tr><td class='body-bold-text-12px'>"+adm.getExam().getDescription()+"</td><td class='body-bold-text-12px'>"+adm.getExam().getExamDate()+"</td><td class='body-bold-text-12px'>"+ adm.getExam().getExamStartTime()+"</td><td class='body-bold-text-12px'>"+ adm.getExam().getExamEndTime()+"</td><td class='body-bold-text-12px' align='center'>....................</td><td class='body-bold-text-12px' align='center'>....................</td></tr>");
					  buf.append("</table></td></tr>");
					  buf.append("<tr><td height='20px'></td></tr>");
					  buf.append("<tr><td ><div id='barcode' name='barcode' ><img src='"+pngImg+"' width='100' height='30' style='border:2px solid #0B0B61'></img></div></td> </tr>");
					  buf.append("</table>");
					  buf.append("</h3>");
					  buf.append("<table>");
					  buf.append("<tr>");
					  buf.append("<td>..........................................................................................................................................................................................................");
					  buf.append("</td>");
					  buf.append("</tr>");
					  buf.append("<tr>");
					  buf.append("<td>..........................................................................................................................................................................................................");
					  buf.append("</td>");
					  buf.append("</tr>");
					  buf.append("</table>");
			     
					 
					  
					
					   
					  
					  
					  
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
			    idDetails.setAddmission("Y");
			    idManager.insertIdDetails(idDetails);
			    dateStr=outputFile;
			    OutputStream os = new FileOutputStream("C://Studentmgt/Admissions/"+outputFile);
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
