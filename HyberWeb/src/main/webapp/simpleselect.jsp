<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
   <%@page import ="com.niit.hyberweb.*,org.hibernate.cfg.Configuration,java.util.*,org.hibernate.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HSQL SELECT</title>
</head>
<body>
<%
Configuration cfg=new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory factory=cfg.buildSessionFactory();
Session sess=factory.openSession();
sess.beginTransaction();
Query query=sess.createQuery("from User");
List<User>list=query.list();
out.println("List of Employee::"+"<br/>");
for(User st:list){
	out.println(st.getId()+","+st.getName()+","+st.getEmail()+"<br/>");
}
out.println("<br/>");
String hql="Select U.name from User U";
query=sess.createQuery(hql);
List<String> list1=query.list();
out.println("List Of Names:-");
for(String name:list1){
	out.println(name+"<br/>");
}
out.println("<br/>");

/****************************************************
//Aggregate Function
*****************************************************/
query=sess.createQuery("select count(*) from User");
List<Integer> list2=query.list();
out.println("Total Names::"+"<br/>");
out.println(list2.get(0)+"<br/>");
out.println("<br/>");

/***************************************************
	Parameter Queries
***************************************************/
query=sess.createQuery("from User U where U.id=:id");
query.setInteger("id",2);
list=query.list();
out.println("List of Employee with Criteria::"+"<br/>");
for(User st:list){
	out.println(st.getId()+" , " +st.getName()+" , "+st.getEmail()+" <br/>");
}

sess.getTransaction().commit();
sess.close();
factory.close();
%>
</body>
</html>