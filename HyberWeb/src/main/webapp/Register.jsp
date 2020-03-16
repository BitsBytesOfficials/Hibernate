<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.niit.hyberweb.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="userBean" class="com.niit.hyberweb.User"></jsp:useBean>

<jsp:setProperty name="userBean" property="*" />

<%
int i=UserDao.register(userBean);
if(i>0){
 out.println("Sucessfully Register");
}

%>
</body>
</html>