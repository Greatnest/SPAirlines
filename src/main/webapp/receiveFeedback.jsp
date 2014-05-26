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

Class.forName("com.mysql.jdbc.Driver");
   	String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
	String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
	String dbusername = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
	String dbpassword = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
	
    Class.forName("com.mysql.jdbc.Driver");
    String connURL="jdbc:mysql://" + host + ":" + port + "/spairlines?" + "user=" + dbusername + "&password=" + dbpassword;
    Connection conn=DriverManager.getConnection(connURL);


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
	
	out.println("An error has occured, please try again or contact the administrator at admin@spairlines.com. We apologize for the inconvenience.");
} %>
</body>
</html>