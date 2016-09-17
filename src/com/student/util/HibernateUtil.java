package com.student.util;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

/**
 * Title		: Hibernate Configuration 
 * Description	: Configuration File 
  * Created on	: Aug 11, 2012
 * @author 		: Veranga Sooriyabandara
 * Comments		: 
 */

public class HibernateUtil {
    private static final SessionFactory sessionFactory;
    
    static {
        try {
        	
        	sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        	
            }  catch (Throwable ex) {
                System.err.println("Initial SessionFactory creation failed." + ex);
                throw new ExceptionInInitializerError(ex);
            }
    }
    /**
     * 
     */
    public HibernateUtil() {
        
    }
    /**
     * 
     * @return
     * @throws HibernateException
     */
    public static Session getSession() throws HibernateException {
        return sessionFactory.openSession();
    }
}
