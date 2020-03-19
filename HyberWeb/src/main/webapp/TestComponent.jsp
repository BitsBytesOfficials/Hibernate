<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page
	import="org.hibernate.*,
org.hibernate.boot.*,
org.hibernate.boot.registry.StandardServiceRegistryBuilder,
org.hibernate.cfg.Configuration,
java.util.*,
com.niit.hyberweb.Emp,com.niit.hyberweb.Address
"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	try{
		
		Session s=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
		Transaction t=s.beginTransaction();
		Emp e1=new Emp("Deepanshu",new Address("Delhi","India",110052));
		Emp e2=new Emp("Nitesh",new Address("Rohini","India",110085));
		s.save(e1);
		s.save(e2);
		t.commit();
		Query query=s.createQuery("from Emp");
		List<Emp> empList=query.list();
		for(Emp emp:empList){
			out.print("<br>ID:-"+emp.getId()+"\tName:-"+emp.getName()+"\t Address:-");
			Address address=emp.getAddress();
			out.println(address.getCity()+"Country:"+address.getCountry()+"Pincode:-"+address.getPincode());
		}
		s.close();
		
	}catch(Exception e){out.println(e.getMessage());}
%>

</body>
</html>