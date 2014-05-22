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
int ID =Integer.parseInt(request.getParameter("craftID"));
String model=request.getParameter("craftModel");
String flightnumber=request.getParameter("craftFNo");
String capacity=request.getParameter("flightCapacity");
try {

    Class.forName("com.mysql.jdbc.Driver");
    String connURL=System.getenv("OPENSHIFT_MYSQL_DB_URL");
    Connection conn=DriverManager.getConnection(connURL);
	String sqlStr="Insert into aircraft(aircraftID,aircraftModel,aircraftFlightNumber,flightPassengerCapacity) Values(?,?,?,?)";
	
	PreparedStatement pstmt=conn.prepareStatement(sqlStr);
	pstmt.setInt(1,ID);
	pstmt.setString(2,model);
	pstmt.setString(3,flightnumber);
	pstmt.setInt(4,Integer.parseInt(capacity));
	int rec=pstmt.executeUpdate();
	
	
	
		//int rec=stmt.executeUpdate(sqlStr);
		if (rec==1)
			out.println("Insertion Successful");
	else
			out.println("Insertion Failed");
			
}catch(Exception e){
	
	out.println(e);
}
%>
</body>
</html>