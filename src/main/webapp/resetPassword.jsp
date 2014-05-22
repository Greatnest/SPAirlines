<%@include file="header.jsp" %>
<body>
<% try {
Class.forName("com.mysql.jdbc.Driver");
    String connURL=System.getenv("OPENSHIFT_MYSQL_DB_URL");
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