<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.security.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String username=request.getParameter("userid");
	String password=request.getParameter("password");
	String generatedPassword=null;

%>

<%
	try {
<<<<<<< HEAD
	Class.forName("com.mysql.jdbc.Driver");
    String connURL=System.getenv("OPENSHIFT_MYSQL_DB_URL");
    Connection conn=DriverManager.getConnection(connURL);
		String sqlStr = "SELECT * FROM admin where userid='"+username+"'and password='"+password+"'";         
		ResultSet rs = stmt.executeQuery(sqlStr);

=======
		// Step1: Load JDBC Driver
		Class.forName("com.mysql.jdbc.Driver");
		// Step 2: Define Connection URL
		String connURL="jdbc:mysql://localhost/assignment?user=root&password=root"; 
		// Step 3: Establish connection to URL
		Connection conn=DriverManager.getConnection(connURL); 
		// Step 4: Create Statement object
		Statement stmt=conn.createStatement();
		// Step 5: Execute SQL Command
		String sqlStr = "SELECT * FROM admin where userid='"+username+"'and password='"+password+"'";         
		ResultSet rs = stmt.executeQuery(sqlStr);
		// Step 6: Process Result
>>>>>>> 3c652a0cd2d5c6c99585954ed77768ddcf487739
		
		if (rs.next()) {
			response.sendRedirect("rootAccess.jsp");
			
		}else{
			response.sendRedirect("badlogin.jsp");
		}
		conn.close();	
	}

	catch(Exception e){

		out.println(e); // try to print a general error
	}
%>


</body>
</html>