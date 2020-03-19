<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page
	import="org.hibernate.*,
org.hibernate.boot.*,
org.hibernate.boot.registry.StandardServiceRegistryBuilder,
org.hibernate.cfg.Configuration,
java.util.*,
com.niit.hyberweb.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Test Job Component</title>
</head>
<body>
	<%
		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory factory = cfg.buildSessionFactory();
		Session sess = factory.openSession();
		Transaction t = sess.beginTransaction();
		Job job = new Job();
		job.setDesignation("Project Manager ");
		job.setSalary(4500);
		job.setJobDescription("Manages Team and Deliveries");
		Person person = new Person();
		person.setEmailAddress("shubham123@company.com");
		person.setJob(job);
		person.setName("Shubham");
		sess.save(person);
		t.commit();
		sess.close();
		sess = factory.openSession();
		Person p = (Person) sess.get(Person.class, person.getId());
		out.println(p);
		sess.close();
		factory.close();
	%>

</body>
</html>
