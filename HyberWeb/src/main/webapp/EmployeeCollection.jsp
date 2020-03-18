<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="org.hibernate.*,
org.hibernate.boot.*,
org.hibernate.boot.registry.StandardServiceRegistryBuilder,
org.hibernate.cfg.Configuration,
java.util.*,
com.niit.hyberweb.Employee"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		try {
			Session sess = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
			Transaction t = sess.beginTransaction();
			Employee employee = new Employee();

			employee.setEmployeeName("Deepanshu");
			Set<String> phoneNumbers = new HashSet<String>();
			phoneNumbers.add("123456789");
			phoneNumbers.add("123789456");
			phoneNumbers.add("789456123");
			employee.setPhoneNumbers(phoneNumbers);
			sess.save(employee);
			sess.getTransaction().commit();
			Query query = sess.createQuery("from Employee");
			List<Employee> list = query.list();

			Iterator<Employee> itr = list.iterator();
			while (itr.hasNext()) {
				Employee emp = itr.next();
				out.println("Employee Name: " + emp.getEmployeeName());

				// printing answers
				Set<String> set = emp.getPhoneNumbers();
				Iterator<String> itr2 = set.iterator();
				while (itr2.hasNext()) {
					out.println(itr2.next());
				}
				out.println("<br>");
			}
			sess.close();
			out.println("success");
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	%>

</body>
</html>