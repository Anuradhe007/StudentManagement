package com.student.exception;

import com.dialog.util.exception.SystemError;

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
public abstract class WebAdminException extends Exception{
	
	private String m_errorCode;
	private String m_source;
	private String m_info1;
	private String m_info2;
	
	public WebAdminException(String errorCode,Exception e){		
		super(e);
		this.m_errorCode = errorCode;
	}

	/**
	 * 
	 */
	public String getMessage() {
		return SystemError.getErrorMessage(m_errorCode);		
	}
	
	/**
	 * 
	 * @return
	 */
	public String getErrorCode() {
		return m_errorCode;
	}

	/**
	 * @return
	 * String Parent Exception's Message.
	 */
	public String getParentMessage() {		
		return this.getCause() != null ? this.getCause().getMessage() : getMessage();
	}
	
	@Override
	public String toString() {
	    return m_errorCode+","+m_source+","+m_info1+","+m_info2;
	}
}
