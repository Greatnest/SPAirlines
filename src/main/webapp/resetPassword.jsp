<%@include file="header.jsp" %>
<body>
<% try {

Class.forName("com.mysql.jdbc.Driver");
 	String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
	String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
	String dbusername = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
	String dbpassword = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
	
    Class.forName("com.mysql.jdbc.Driver");
    String connURL="jdbc:mysql://" + host + ":" + port + "/spairlines?" + "user=" + dbusername + "&password=" + dbpassword;
    Connection conn=DriverManager.getConnection(connURL);
	
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