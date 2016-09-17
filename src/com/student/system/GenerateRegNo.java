package com.student.system;

import com.dialog.util.*;
public class GenerateRegNo {
	
	public String generateRegNo(int id,String alYear){
		
		String root 		=	 SystemConfig.getInstance().getNodeName();
		
	    String regLetter 	= 	SystemConfig.getInstance().getStr(root+"regNo.letter");
	    
	    
		String firstTwo = alYear.substring(0, 1);
		
		String regNo = firstTwo+regLetter+id;
		
		return regNo;
		
	}

}
