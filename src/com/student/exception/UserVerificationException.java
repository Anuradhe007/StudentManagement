package com.student.exception;

public class UserVerificationException extends WebException {

    /**
     * 
     * @param e
     */
    public UserVerificationException(Exception e) {
        super("GN001", e);
    }
    /**
     * 
     * @param e
     */
    public UserVerificationException(Exception e, String backURL) {
        super("GN001", backURL, e);
    }
    /**
     * @param errorCode
     * @param e
     */
    public UserVerificationException(String errorCode, Exception e) {
        super(errorCode, e);
    }

    /**
     * @param errorCode
     * @param backURL
     * @param e
     * @param source
     */
    public UserVerificationException(String errorCode, String backURL, Exception e, String source) {
        super(errorCode, backURL, e, source);
    }

    /**
     * @param errorCode
     * @param backURL
     * @param e
     */
    public UserVerificationException(String errorCode, String backURL, Exception e) {
        super(errorCode, backURL, e);
    }
}
