<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import ="com.niit.hyberweb.User,java.util.Iterator,
     org.hibernate.criterion.*,
     org.hibernate.cfg.Configuration,
     java.util.*,org.hibernate.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Configuration cfg=new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory factory=cfg.buildSessionFactory();
Session sess=factory.openSession();
sess.beginTransaction();

/******************************
  Criteria Object with Restriction
******************************/
Criteria cr=sess.createCriteria(User.class);
//cr.add(Restrictions.like("name","d%")); //Name must start with d
//cr.add(Restrictions.eq("id",2));       // ID must be 2
cr.addOrder(Order.asc("name"));
cr.setMaxResults(5);
List<User> result=(List<User>)cr.list();
out.println("List of Employees::"+"<br>");
out.println("<table border='1'>");
out.println("<tr bgcolor='yellow'>");
out.println("<th> User Id</th>");
out.println("<th> User Name</th>");
out.println("<th> Email </th>");
out.println("</tr>");
Iterator it=result.iterator();
while(it.hasNext()) {
User u=(User)it.next();
out.println("<tr bgcolor='aqua'>");
out.println("<td>"+u.getId() + "</td>");
out.println("<td>"+ u.getName() + "</td>");
out.println("<td>"+ u.getEmail()+"</td>");
out.println("</tr>");
}
out.println("</table>");

sess.close();
factory.close();
%>
</body>
</html>