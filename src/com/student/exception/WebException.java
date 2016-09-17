package com.student.exception;

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
public class WebException extends WebAdminException{
	private String m_backURL = null;
	private String m_source = null;
	
	/**
	 * 
	 * @param errorCode
	 * @param e
	 */
	public WebException(String errorCode, Exception e) {
		super(errorCode, e);		
	}

	/**
	 * 
	 * @param errorCode
	 * @param backURL
	 * @param e
	 */
	public WebException(String errorCode, String backURL, Exception e){
		super(errorCode,e);
		this.m_backURL = backURL;
		this.m_source = "";
	}
	
	/**
	 * @param errorCode
	 * @param backURL
	 * @param e
	 * @param source
	 */
	public WebException(String errorCode, String backURL, Exception e, String source){
		super(errorCode,e);
		this.m_backURL = backURL;
		this.m_source = source;
	}

	/**
	 * @return Returns the m_backURL.
	 */
	public String get_backURL() {
		return m_backURL;
	}

	/**
	 * @param m_backurl The m_backURL to set.
	 */
	public void set_backURL(String backurl) {
		m_backURL = backurl;
	}
	
	/**
	 * @return Returns the m_backURL.
	 */
	public String getBackURL() {
		return m_backURL;
	}

	/**
	 * @param m_backurl The m_backURL to set.
	 */
	public void setBackURL(String backurl) {
		m_backURL = backurl;
	}

	public String getSource() {
		return m_source;
	}
}
