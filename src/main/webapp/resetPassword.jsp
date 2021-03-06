<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.security.*"%>
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
<div id="wrapper">
		<ul id = "coolMenu">
				<li><a href="index.jsp">Home</a></li>
				<li><a href="#">About Us</a>
					<ul class="noJS">
						<li><a href="History.jsp">History</a></li>
						<li><a href="Airplanes.jsp">Airplanes</a></li>
					</ul>
				</li>
				<li><a href="p_flightSchedule.jsp">Online Booking</a></li>
				<li><a href="#">Enquiries</a>
					<ul class="noJS">
						<li><a href="FAQ.jsp">FAQ</a></li>
						<li><a href="contact.jsp">Contact Us</a></li>
					</ul>
				</li>
				<li><a href="review.jsp">Reviews</a></li>	
		</ul>
		
		<div id="bannerbox">
			<img src="banners-bg/banner.jpg" width="900" height="350" alt="Welcome"/>
		</div>
		
		<div id="content">
			<div id="sidebar">
			<br/>Please login to manage your online booking. <br/><br/>
			<form action="getAdminData.jsp" method="post">
				<label>User ID: 
				<input type="text" name="userid"/>
				</label><br/><br/>
				
				<label>Password: 
				<input type="password" name="password"/>
				</label><br/><br/>
				
				<input type="submit" class="submitLong" value="Login"/>
				<a href="forgetPassword.jsp"/>Forgot your password?</a>
			</form>	
			</div>
			
			<div id="maincon">
<% try {
		String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
	String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
	String dbusername = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
	String dbpassword = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
	
    Class.forName("com.mysql.jdbc.Driver");
    String connURL="jdbc:mysql://" + host + ":" + port + "/spairlines?" + "user=" + dbusername + "&password=" + dbpassword;
    Connection conn=DriverManager.getConnection(connURL);
	
	String ID=request.getParameter("ID");
	String password=request.getParameter("password");
	String generatedPassword = null;
	  try {
      
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(password.getBytes());
        byte[] bytes = md.digest();
        StringBuilder sb = new StringBuilder();
        for(int i=0; i< bytes.length ;i++)
        {
            sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
        }
 
        generatedPassword = sb.toString();
    }
    catch (NoSuchAlgorithmException e) {
		out.println("An error has occured, please try again");
}
	
	String sqlStr="UPDATE admin set Password=? where ID=?";
	PreparedStatement pstmt=conn.prepareStatement(sqlStr);
	pstmt.setString(1,generatedPassword);
	pstmt.setString(2,ID);
	int rec=pstmt.executeUpdate();
	if(rec==1)
	{
		out.println("Your password has been reseted, please login with your new password");
	}
	else {
		out.println("An error has occured, please try again");
	}
	
}catch(Exception e) 
{
out.println("Please contact the administrator");	
}
%>			
</div>
</div>

<footer>
		<p id="credits">&copy; 2014 SP Airlines. All Rights Reserved.</p>
		</footer>

	</div>


</body>
</html>