<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SP Airlines</title>
   <style type="text/css">
    <%@include file="css/style.css" %></style>
	<link rel="shortcut icon" href="icons/favicon.ico"/>
	<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="js/scripts.js"></script>
</head>
<body>
<%

	String FSID=request.getParameter("FSID");
	String passengerClass=request.getParameter("class");
	String trip=request.getParameter("trip");
	String name=request.getParameter("name");
	String NRIC=request.getParameter("NRIC");
	String address=request.getParameter("address");
	String contact=request.getParameter("contactNo");
	String email=request.getParameter("email");
	
	
try {
Class.forName("com.mysql.jdbc.Driver");
    String connURL=System.getenv("OPENSHIFT_MYSQL_DB_URL");
    Connection conn=DriverManager.getConnection(connURL);
		String sqlStr="Insert into booking(flightScheduleID, passengerClass, trip, fullName, NRIC, address, contactNo, email) Values(?,?,?,?,?,?,?,?)";

		PreparedStatement pstmt=conn.prepareStatement(sqlStr);
		pstmt.setString(1, FSID);
		pstmt.setString(2, passengerClass);
		pstmt.setString(3, trip);
		pstmt.setString(4, name);
		pstmt.setString(5, NRIC);
		pstmt.setString(6, address);
		pstmt.setString(7, contact);
		pstmt.setString(8, email);
		
		int rec=pstmt.executeUpdate();
		
		if(rec==1){
			response.sendRedirect("confirmation.jsp");
		
		}else{		
			response.sendRedirect("booking.jsp");
		}

}
	catch(Exception e){
		out.println(e);
	}

%>



</body>
</html>