<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
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
<style>
table,th,td
{
border:1px solid black;
border-collapse:collapse;
text-align:center;
width:650px;
}
</style>
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
			<a class="sideBTN" href="addAircraft.jsp">Add New Aircraft</a>
			<a class="sideBTN" href="viewAircraftInfo.jsp">Aircraft Information</a>
			<a class="sideBTN" href="addFSchedule.jsp">New Flight Schedule</a>
			<a class="sideBTN" href="viewFInfo.jsp">Flight Information</a>
			<a class="sideBTN" href="logout.jsp">Logout</a>
			</div>
			
			
			<div id="maincon">
				<h1>View Aircraft Information</h1>
				<div id="datatable">

<%try {

  	String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
	String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
	String dbusername = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
	String dbpassword = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
	
    Class.forName("com.mysql.jdbc.Driver");
    String connURL="jdbc:mysql://" + host + ":" + port + "/spairlines?" + "user=" + dbusername + "&password=" + dbpassword;
    Connection conn=DriverManager.getConnection(connURL);
    Statement stmt=conn.createStatement();
	
	String sqlStr="SELECT * FROM aircraft";  
	ResultSet rs = stmt.executeQuery(sqlStr);
	
	%> <table>
 	<th> Aircraft ID</th>
 	<th> Model</th>
 	<th> Passenger Capacity</th>
	
	<%
 	while(rs.next()){ //retrieve each table result one by one
 		
 		int aircraftID=Integer.parseInt(rs.getString("aircraftID"));
 		String model=rs.getString("aircraftModel");
 		int capacity=Integer.parseInt(rs.getString("flightPassengerCapacity"));
 
 		
 	%>	<tr>
 		<td> <%= aircraftID %> </td>
 		<td><%= model %></td>
 		<td><%= capacity %></td>
 		
 		</tr>
 		
 	
 	<% } %>
 	</table>
 <%
	
}catch(Exception e){
	
	out.println(e);
} %>

			</div>
		</div>
			
		
</div>
		
	<footer>
		<p id="credits">&copy; 2014 SP Airlines. All Rights Reserved.</p>
	</footer>
		
	</div>


</body>
</html>