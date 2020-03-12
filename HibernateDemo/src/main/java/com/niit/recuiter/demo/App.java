package com.niit.recuiter.demo;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
       Configuration cfg=new Configuration();
       cfg.configure("hibernate.cfg.xml");
       SessionFactory sf=cfg.buildSessionFactory();
       Session ses=sf.openSession();
       Transaction t=ses.beginTransaction();
       Employee e1=new Employee();
       e1.setFirstName("Deepanshu");
       e1.setLastName("Gupta");
       e1.setSalary(10000);
    }
}
