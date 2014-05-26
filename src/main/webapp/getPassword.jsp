<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"%>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%@ page import="javax.activation.*"%>
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
				
				<input type="submit" class="submit" value="Login"/>
			</form>
			
			</div>
			
<%


try {
	 String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
	String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
	String dbusername = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
	String dbpassword = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
	
    Class.forName("com.mysql.jdbc.Driver");
    String connURL="jdbc:mysql://" + host + ":" + port + "/spairlines?" + "user=" + dbusername + "&password=" + dbpassword;
    Connection conn=DriverManager.getConnection(connURL);
   
	    
    String email=request.getParameter("email");
    
  String sqlStr="SELECT ID FROM admin WHERE Email=?";
   PreparedStatement pstmt=conn.prepareStatement(sqlStr);
   pstmt.setString(1,email);
	ResultSet rs=pstmt.executeQuery();
    int userID=0;
   if(rs.next()) {
	userID=rs.getInt("ID");   
   }
   else{
	   out.println("Error");
	   
   } 
	  
   	StringBuilder resetlink=new StringBuilder();
   	resetlink.append(request.getScheme());
   	resetlink.append("://");
   	resetlink.append(request.getServerName());
   	resetlink.append(":");
   	resetlink.append(request.getServerPort()); 
   	resetlink.append("/");
   	resetlink.append(request.getContextPath());
   	resetlink.append("/");
   	resetlink.append("newPassword.jsp");
   	resetlink.append("?ID=");
   	resetlink.append(userID);
   	String linkreset=resetlink.toString();
   	
	   final String username = "spairlinesreset@gmail.com";
	   final String password = "p@ssw0rdr3s3t";
	   Properties props = new Properties();
	   props.put("mail.smtp.auth", "true");
	   props.put("mail.smtp.starttls.enable", "true");
	   props.put("mail.smtp.host", "smtp.gmail.com");
	   props.put("mail.smtp.port", "587");

	   Session session1 = Session.getInstance(props,
	   new Authenticator() {
	   	protected PasswordAuthentication getPasswordAuthentication() {
	   		return new PasswordAuthentication(username, password);
	   	}
	     });
		
	   try {

	   	Message message = new MimeMessage(session1);
	  
	   	message.setFrom(new InternetAddress(username));
	   	message.setRecipients(Message.RecipientType.TO,
	   	InternetAddress.parse(email));
	   	message.setSubject("SP Airlines Reset Password");
	   	message.setContent("Dear Valued Customer, please click this link to reset your password:<br/> <a href='" +linkreset +"'/>"+linkreset+"</a>", "text/html; charset=utf-8");
			
	   	Transport.send(message);

	   	out.println("Please check your email to reset your password");

	   } catch (MessagingException e) {
	   out.println(e);

	   }
	   

    
	
}catch(Exception e) {
	out.println(e);
	
	
}


%>

</div>
<%@include file="footer.jsp"%>