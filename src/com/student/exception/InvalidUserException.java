/**
 * 
 */
package com.student.exception;

/**
 * Title		: ticketing	
 * Description	: 
 * Copyright	: Copyright(c) 2012
 *  Created on	: Nov 14, 2012
 * @author 		: Veranga Sooriyabandara
 * Comments		: 
 */
public class InvalidUserException extends WebAdminException {

    /**
     * @param errorCode
     * @param e
     */
    public InvalidUserException(String errorCode, Exception e) {
        super(errorCode, e);
    }
}
