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
<style>
table,th,td
{
border:1px solid black;
border-collapse:collapse;
text-align:center;
width:1000px;
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
			<a class="sideBTN" href="addFSchedule.jsp">New Flight Schedule</a>
			<a class="sideBTN" href="viewFInfo.jsp">Flight Information</a>
			<a class="sideBTN" href="logout.jsp">Logout</a>
			</div>
			
			
			<div id="maincon">
				<h1>View Flight Information</h1>
				<div id="datatable">

<%try {
    // Step1: Load JDBC Driver
    Class.forName("com.mysql.jdbc.Driver");
    // Step 2: Define Connection URL
    String connURL="jdbc:mysql://localhost/assignment?user=root&password=root"; 
    // Step 3: Establish connection to URL
    Connection conn=DriverManager.getConnection(connURL);
    // Step 4: Create Statement object
    Statement stmt=conn.createStatement();


	String year=request.getParameter("viewYYYY");
	String month=request.getParameter("viewMM");
	
	String sqlStr="SELECT * FROM flightschedule where year(dateOfFlight)='"+year+"'and Month(dateOfFlight)='"+month+"'";  
	ResultSet rs = stmt.executeQuery(sqlStr);
	
	out.println("<table>");
 	out.println("<th>"+"FSID"+"</th>");
	out.println("<th>"+"Aircraft ID"+"</th>");
 	out.println("<th>"+"Origin Airport"+"</th>");
	out.println("<th>"+"Dest. Airport"+"</th>");
 	out.println("<th>"+"Country"+"</th>");
	out.println("<th>"+"Economy Class ($)"+"</th>");
 	out.println("<th>"+"Business Class ($)"+"</th>");
	out.println("<th>"+"First Class ($)"+"</th>");
 	out.println("<th>"+"Date"+"</th>");
	out.println("<th>"+"Duration"+"</th>");
 	out.println("<th>"+"Take-off Time"+"</th>");
	
 	while(rs.next()){ //retrieve each table result one by one
 		out.println("<tr>");
 		int FSID=Integer.parseInt(rs.getString("flightScheduleID"));
 		int aircraftID=Integer.parseInt(rs.getString("aircraftID"));
 		String origin=rs.getString("originAirport");
 		String destination=rs.getString("destinationAirport");
 		String country=rs.getString("country");
 		String economy=rs.getString("economyCost");
 		String business=rs.getString("businessclassCost");
 		String firstclass=rs.getString("firstClassCost");
 		String dateofFlight=rs.getString("dateOfFlight");
 		String timeofFlight=rs.getString("duration");
 		String flighttime=rs.getString("timeOfFlight");
 		out.println("<td>"+ FSID +"</td>");
 		out.println("<td>" + aircraftID +"</td>");
 		out.println("<td>"+ origin +"</td>");
 		out.println("<td>" + destination +"</td>");
 		out.println("<td>"+ country +"</td>");
 		out.println("<td>" + economy +"</td>");
 		out.println("<td>"+ business +"</td>");
 		out.println("<td>" + firstclass +"</td>");
 		out.println("<td>"+  dateofFlight +"</td>");
 		out.println("<td>" + timeofFlight +"</td>");
 		out.println("<td>"+ flighttime +"</td>");
 		out.println("</tr>");
 	
 	}
	out.println("</table>");
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