<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.*,
org.hibernate.cfg.Configuration,
com.niit.hyberweb.Person1,
com.niit.hyberweb.Employee1,
java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
Configuration cfg = new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory factory = cfg.buildSessionFactory();
Session sess= factory.openSession();
sess.beginTransaction();
Person1 person=new Person1("Nitesh","Kumar");
sess.save(person);
Employee1 employee=new Employee1("Deepanshu","Gupta",new Date("2020/01/17"),"JAVA");
 sess.save(employee);
 sess.getTransaction().commit();
 sess.close();
 }catch(Exception e){out.println(e.getMessage());}
%>
</body>
</html>