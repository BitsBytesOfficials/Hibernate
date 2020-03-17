<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import ="com.niit.hyberweb.User
  ,org.hibernate.cfg.Configuration,java.util.*,org.hibernate.*" %>
   <%
   	/*****************************************************************
   		Query Object learning
   		1.) Normal Select Query
		2.) Aggregate Function
		3.)	Parameter Queries [list.get(),query.list() ,query.setInteger(Integer)]
   	****************************************************************/
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
Configuration cfg=new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory factory=cfg.buildSessionFactory();
Session sess=factory.openSession();
sess.beginTransaction();
String hql="update User set password=:password where id=:id";
Query query=sess.createQuery(hql);
query.setParameter("password","testing123");
query.setParameter("id",1);
int rowAffected=query.executeUpdate();
if(rowAffected>0){
	out.println("Updated"+rowAffected+" rows.");
}
/*
->Delete Query
String hql1="delete from User where id=:id";
Query query1=sess.createQuery(hql1);
query1.setParameter("id",3);
rowAffected=query1.executeUpdate();
if(rowAffected>0){
	out.println("Number of Record Deleted "+rowAffected);
}
*/
String hql2="select count(*) from User";
Query query2=sess.createQuery(hql2);
List result=query2.list();
out.println(result.get(0));
sess.getTransaction().commit();
sess.close();factory.close();
}catch(Exception e){out.println(e.getMessage());}
%>
</body>
</html>