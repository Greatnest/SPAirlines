<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%	
try {
<<<<<<< HEAD
Class.forName("com.mysql.jdbc.Driver");
    String connURL=System.getenv("OPENSHIFT_MYSQL_DB_URL");
    Connection conn=DriverManager.getConnection(connURL);
=======
    // Step1: Load JDBC Driver
    Class.forName("com.mysql.jdbc.Driver");
    // Step 2: Define Connection URL
    String connURL="jdbc:mysql://localhost/assignment?user=root&password=root"; 
    // Step 3: Establish connection to URL
    Connection conn=DriverManager.getConnection(connURL);
    // Step 4: Create Statement object
>>>>>>> 3c652a0cd2d5c6c99585954ed77768ddcf487739
    Statement stmt=conn.createStatement();


	String name=request.getParameter("fedname");
	String email=request.getParameter("fedEmailinput");
	String contactno=request.getParameter("fedcontactno.");
	String address=request.getParameter("fedAddress");
	String feedback=request.getParameter("fedfeedback");
	
	
	String sqlStr="Insert into feedback(name,email,contactno,address,feedback) Values('"+name+"','"+email+"',"+contactno+",'"+address+"','"+feedback+"')"; //'for strings',dont need '' for integer in database
	
	int rec=stmt.executeUpdate(sqlStr);
		if (rec==1)
			out.println("Your feedback have been submitted");
	else
			out.println("Your feedback failed to submit");
			
}catch(Exception e){
	
	out.println(e);
} %>
</body>
</html>