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
    <style>

table,th,td
{
border:1px solid black;
border-collapse:collapse;
text-align:center;
width:650px;
}
</style>
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
				<li><a href="#">Flight Schedule &amp; Online Booking</a></li>
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
<% try {
<<<<<<< HEAD
  Class.forName("com.mysql.jdbc.Driver");
    String connURL=System.getenv("OPENSHIFT_MYSQL_DB_URL");
    Connection conn=DriverManager.getConnection(connURL);
=======
    // Step1: Load JDBC Driver
    Class.forName("com.mysql.jdbc.Driver");
    // Step 2: Define Connection URL
    String connURL="jdbc:mysql://localhost/assignment?user=root&password=root"; 
    // Step 3: Establish connection to URL
    Connection conn=DriverManager.getConnection(connURL);
    // Step 4: Create Statement object
    //Statement stmt=conn.createStatement();
>>>>>>> 3c652a0cd2d5c6c99585954ed77768ddcf487739

    String Dairport=request.getParameter("destination");
	String Oairport=request.getParameter("origin");
	String Ryear=request.getParameter("returnYYYY");
	String Rmonth=request.getParameter("returnMM"); //Number e.g 1 - Jan, 2 - Feb
	String Rday=request.getParameter("returnDD");
	String Dyear=request.getParameter("departureYYYY");
	String Dmonth=request.getParameter("departureMM");
	String Dday=request.getParameter("departureDD");


	String sqlStr="SELECT * FROM flightschedule where originAirport=? and destinationAirport =? and year(returnDate)=? and month(returnDate)=? and day(returnDate)=? and year(departureDate)=? and month(departureDate)=? and day(departureDate)=?";
	
	PreparedStatement pstmt=conn.prepareStatement(sqlStr);
	pstmt.setString(1,Oairport);
	pstmt.setString(2,Dairport);
	pstmt.setString(3,Ryear);
	pstmt.setString(4,Rmonth);
	pstmt.setString(5,Rday);
	pstmt.setString(6,Dyear);
	pstmt.setString(7,Dmonth);
	pstmt.setString(8,Dday);
	ResultSet rs = pstmt.executeQuery();
	out.println("<a href='P_fullflightSchedule.jsp'/>Click here to view the full flight schedule </a>");
	out.println("<table>");
 	out.println("<th>"+"Plane Number"+"</th>");
	out.println("<th>"+"Flight Time"+"</th>");
 	out.println("<th>"+"Departure Time"+"</th>");
	out.println("<th>"+"Return Time"+"</th>");
 	while(rs.next()){ //retrieve each table result one by one
 	
 		int planeID=Integer.parseInt(rs.getString("aircraftID"));
 		String timeofFlight=rs.getString("flightTime");
 		String flighttime=rs.getString("departureTime");
 		String returnTime=rs.getString("returnTime");
 		out.println("<tr>");
 		out.println("<td>"+ planeID +"</td>");
 		out.println("<td>" + timeofFlight + "" + " Hours" + "</td>");
 		out.println("<td>"+ flighttime +"</td>");
 		out.println("<td>" + returnTime+"</td>");
 		out.println("</tr>");
 	
 	} 
out.println("</table>");
	
}catch(Exception e){
	
	out.println(e);
} 

%>
		</div>
		
	<footer>
		<p id="credits">&copy; 2014 SP Airlines. All Rights Reserved.</p>
	</footer>
		
	</div>


</body>
</html>