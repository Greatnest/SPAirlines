<%@include file="header.jsp" %>
<body>
<% try {
<<<<<<< HEAD
Class.forName("com.mysql.jdbc.Driver");
    String connURL=System.getenv("OPENSHIFT_MYSQL_DB_URL");
    Connection conn=DriverManager.getConnection(connURL);
=======
	 Class.forName("com.mysql.jdbc.Driver");
	 String connURL="jdbc:mysql://localhost/assignment?user=root&password=root"; 
	 Connection conn=DriverManager.getConnection(connURL);
>>>>>>> 3c652a0cd2d5c6c99585954ed77768ddcf487739
	
	String ID=request.getParameter("ID");
	String password=request.getParameter("password");
	String sqlStr="UPDATE admin set Password=? where ID=?";
	PreparedStatement pstmt=conn.prepareStatement(sqlStr);
	pstmt.setString(1,password);
	pstmt.setString(2,ID);
	int rec=pstmt.executeUpdate();
	if(rec==1)
	{
		out.println("Your password has been reseted");
	}
	else {
		out.println("An error has occured, please try again");
	}
	
}catch(Exception e) 
{
out.println("Please contact the administrator");	
}
%>			
		
<%@include file="footer.jsp"%>