<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<%@ page import="java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<%
	try {
		String name=request.getParameter("user");
		String password=request.getParameter("password");
		String sql="insert into registration(name,password) values(?,?)";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/portal", "root", "");
		
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, password);
		ps.executeUpdate();
		
		out.println("You have successully registered");
		
	} 
	catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} 	
	
%>
	<div alignment="center">
	<h2>Login Page</h2>
		<form action="home.jsp" method="post">
			Username :<input type="text" name="user" required="required">
			Password :<input type="password" name="password" required="required">
			<input type="submit" value="LOGIN">
		</form>
	
	</div>
</body>
</html>