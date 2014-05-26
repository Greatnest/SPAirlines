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
	String username=request.getParameter("userid");
	String password=request.getParameter("password");


%>

<%
	try {
	 String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
	String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
	String dbusername = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
	String dbpassword = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
	
    Class.forName("com.mysql.jdbc.Driver");
    String connURL="jdbc:mysql://" + host + ":" + port + "/spairlines?" + "user=" + dbusername + "&password=" + dbpassword;
    Connection conn=DriverManager.getConnection(connURL);
	
	
		String sqlStr = "SELECT * FROM admin where userid= ? and password= ?";
		PreparedStatement pstmt=conn.prepareStatement(sqlStr);
		pstmt.setString(1, username);
		pstmt.setString(2, password);
		ResultSet rs = pstmt.executeQuery();
		
		// Step 6: Process Result
		
		if (rs.next()) {
			response.sendRedirect("rootAccess.jsp");
			
		}else{
			response.sendRedirect("badlogin.jsp");
		}
		conn.close();	
	}

	catch(Exception e){

		out.println("An error has occured, please try again or contact the administrator at admin@spairlines.com. We apologize for the inconvenience.");
	}
%>


</body>
</html>