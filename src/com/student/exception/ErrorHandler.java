package com.student.exception;

import java.io.File;
import java.io.FileInputStream;
import java.util.Properties;

import com.dialog.util.SystemLog;
import com.dialog.util.Utility;

/**
 * 
 * Title		: ticketing	
 * Description	: 
 * Copyright	: Copyright(c) 2010
 * Company		: Dialog Telekom PLC.
 * Created on	: Jan 15, 2010
 * @author 		: charith
 * Comments		:
 */
public class ErrorHandler {
	private static Properties s_prop;
	public static String DEFAULT_ERROR_FILE;
	public volatile static ErrorHandler s_systemErr;
	
	/**
	 * @return
	 */
	public static ErrorHandler getInstance() {
		if( s_systemErr == null ) {			
		    s_systemErr = new ErrorHandler();
		}
		return s_systemErr;
	}	
	/**
	 * 
	 */
	private ErrorHandler() {
	    ErrorHandler.init();
	}
	
	/**
	 * 
	 * @throws Exception
	 */
	public static void init() {
		try {
			s_prop = new  Properties();
			File file = new File(DEFAULT_ERROR_FILE);
			s_prop.loadFromXML(new FileInputStream(file));
			System.out.println(Utility.formatToScreen("Initializing Error configuration")+"[OK]");
		} catch (Exception e) {
		    System.out.println(Utility.formatToScreen("Initializing Error configuration")+"[FAILED]");
		    SystemLog.getInstance().getLogger("PORTAL").error("ErrorHandler initilizing failed",e);
		}
	}
	/**
	 * 	
	 * @param code
	 * @return
	 */
	public static String getErrorMessage(String code) {
		return s_prop.getProperty(code);
	}
}
