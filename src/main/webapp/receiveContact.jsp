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
<div id="wrapper">
		<ul id = "coolMenu">
				<li><a href="index.jsp">Home</a></li>
				<li><a href="#">About Us</a>
					<ul class="noJS">
						<li><a href="History.jsp">History</a></li>
						<li><a href="Airplanes.jsp">Airplanes</a></li>
					</ul>
				</li>
				<li><a href="p_flightSchedule.jsp">Flight Schedule &amp; Online Booking</a></li>
				<li><a href="#">Enquiries</a>
					<ul class="noJS">
						<li><a href="FAQ.jsp">FAQ</a></li>
						<li><a href="contact.jsp">Contact Us</a></li>
					</ul>
				</li>	
		</ul>
		
		<div id="bannerbox">
			<img src="banners-bg/mainbanner.jpg" width="800" height="400" alt="Welcome"/>
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
			
			
			<div id="maincon">
				<h1>Contact Us</h1>


<%	
try {
 Class.forName("com.mysql.jdbc.Driver");
    String connURL=System.getenv("OPENSHIFT_MYSQL_DB_URL");
    Connection conn=DriverManager.getConnection(connURL);

	String name=request.getParameter("fedname");
	String email=request.getParameter("fedEmailinput");
	String contactno=request.getParameter("fedcontactno.");
	String feedback=request.getParameter("fedfeedback");
	
	
	String sqlStr="Insert into enquiry(name,email,contactNo,feedback) Values('"+name+"','"+email+"','"+contactno+"','"+feedback+"')";
	int rec=stmt.executeUpdate(sqlStr);
		if (rec==1){
			%> <p class="para">
			Your queries has been submitted and our customer service staffs will attend to them shortly. Thank you very much for visiting SP Airlines,
			we hope you have an enjoyable time flying with us.
			</p>
			<%
			
		}else{
			%> <p class="para">
			Unfortunately, the server is currently down for maintenance. We apologise for the inconvenience caused, please try again later.
			</p>
			<%
	}	
}catch(Exception e){
	
	out.println(e);
} %>


		</div>
			
		
</div>
		
	<footer>
		<p id="credits">&copy; 2014 SP Airlines. All Rights Reserved.</p>
	</footer>
		
	</div>


</body>
</html>