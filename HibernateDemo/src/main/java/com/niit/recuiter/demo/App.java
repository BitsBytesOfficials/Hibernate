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
       cfg.configure("hibernate.cfg.xml");//Physically connect with the hibernate.cfg.xml file
       SessionFactory sf=cfg.buildSessionFactory();//SEssion is created
       Session ses=sf.openSession();
       Transaction t=ses.beginTransaction();
       Employee e1=new Employee();
       e1.setFirstName("Shubham");
       e1.setLastName("Dubey1");
       e1.setSalary(10000);
       ses.save(e1); //Inserts the Object(record)
       t.commit();
       System.out.println("Sucessfully Saved");
       ses.close();
       sf.close();
    }
}
