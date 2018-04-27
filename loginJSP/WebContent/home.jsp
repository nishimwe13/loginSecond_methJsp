<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
</head>
<body>
<%
	try {
		String name=request.getParameter("user");
		String password=request.getParameter("password");
		
		String dbName=null;
		String dbPassword=null;
		
		String sql="select * from registration where name=? and password=?";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/portal", "root", "");
		
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, password);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			dbName=rs.getString(2);
			dbPassword=rs.getString("password");
		}
		if(name.equals(dbName)&& password.equals(dbPassword)) {
			out.println("You have successully logged in");
		}
		else {
			response.sendRedirect("login.jsp");
			//RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			//rd.include(request,response);
			
		}
		
		
	} 
	catch (ClassNotFoundException e) {
		
		e.printStackTrace();
	} catch (SQLException e) {
		
		e.printStackTrace();
	} 

%>
<h2>Hello, <%= request.getParameter("user") %></h2>
Welcome to the home page!

</body>
</html>



