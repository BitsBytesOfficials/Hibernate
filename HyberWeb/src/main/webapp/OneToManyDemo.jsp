<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.niit.hyberweb.*,
	org.hibernate.*,org.hibernate.cfg.Configuration,
	java.util.*,org.hibernate.boot.registry.StandardServiceRegistryBuilder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OneToMany Relationship</title>
</head>
<body>

<%
try{
SessionFactory sessionFactory=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory(new StandardServiceRegistryBuilder().configure().build());

Session sess=sessionFactory.openSession();
sess.beginTransaction();
Category category = new Category("Computer");

Product pc = new Product("DELL PC", "Quad-core PC", 1200, category);

Product laptop = new Product("MacBook", "Apple High-end laptop", 2100, category);

Product phone = new Product("iPhone 5", "Apple Best-selling smartphone", 499, category);

Product tablet = new Product("iPad 3", "Apple Best-selling tablet", 1099, category);

Set<Product> productSet=new HashSet<Product>();
productSet.add(pc);
productSet.add(laptop);
productSet.add(phone);
productSet.add(tablet);
category.setProducts(productSet);
sess.save(category);
sess.getTransaction().commit();

Query query=sess.createQuery("from Category");
List<Category> categoryList=query.list();
out.println("<ul>");
for(Category categoryObj:categoryList){

	out.println("<li><strong>"+categoryObj.getId()+"\t"+categoryObj.getName()+"</strong></li>");
	productSet=categoryObj.getProducts();
	out.println("<ul>");
	for(Product productObj:productSet){
		out.println("<li>"+productObj.getId()+"\t"+productObj.getName()+"\t"+productObj.getPrice()+"\t"+productObj.getDescription()+"</li>");
		
	}
	out.println("</ul>");
}
out.println("</ul>");
sess.close();
}catch(Exception e){out.println(e.getMessage());}
%>

</body>
</html>