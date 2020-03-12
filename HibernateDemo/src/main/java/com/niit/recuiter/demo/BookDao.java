package com.niit.recuiter.demo;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class BookDao {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory sessions = cfg.buildSessionFactory();
		Session session = sessions.openSession();
		Transaction t=session.beginTransaction();
		Book book=new Book();
		book.setName("Java 8");
		book.setPrice(1000.00);
		book.setAuthor("ABC");
		session.save(book);
		t.commit();
		session.close();
		sessions.close();
	}

}
