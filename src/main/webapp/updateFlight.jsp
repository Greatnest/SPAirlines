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
	<script type="text/javascript" src="js/Rotator.js"></script>
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
			<img src="banners-bg/banner.jpg" width="900" height="350" alt="Welcome"/>
		</div>
		
		<div id="content">
			<div id="sidebar"><br/>
				<div class="sidenav1">
	        	<p class="sidenavTitle1"> <img class="arrow1" src="icons/arrow-expandedrotated.png" alt="arrow" />  Aircraft</p>
		            <ul class="list1"> <br/>
		            	<li><a href="addAircraft.jsp">Add New Aircraft</a></li>
		                <li><a href="viewAircraftInfo.jsp">View Aircraft Info</a></li>
		            </ul>
	        	</div>
	        	
	        	<div class="sidenav2">
	        	<p class="sidenavTitle2"> <img class="arrow2" src="icons/arrow-expandedrotated.png" alt="arrow" />  Flight Schedule</p>
		            <ul class="list2"> <br/>
		                <li><a href="addFSchedule.jsp">New Flight Schedule</a></li>
		                <li><a href="viewFInfo.jsp">View Flight Info</a></li>
		            </ul>
	        	</div>
	        	
	        	<div class="sidenav3">
	        	<p class="sidenavTitle3"> <img class="arrow3" src="icons/arrow-expandedrotated.png" alt="arrow" />  Admin</p>
		            <ul class="list3"> <br/>
		            	<li><a href="changePasswd.jsp">Change password</a></li>
						<li><a href="logout.jsp">Logout</a></li>
		            </ul>
	        	</div>
			</div>
			
			<div id="maincon">
				<h1>Update Flight Schedule</h1>

<% 
	int FSID=Integer.parseInt(request.getParameter("ID"));
	int aircraftID=Integer.parseInt(request.getParameter("craftID"));
	String origin=request.getParameter("origin");
	String destination=request.getParameter("destination");
	String country=request.getParameter("country");
	String economy=request.getParameter("economy");
	String business=request.getParameter("business");
	String firstclass=request.getParameter("first");
	String dateDepart=request.getParameter("dateDepart");
	String departTime=request.getParameter("departTime");
	String duration=request.getParameter("duration");
	String arriveTime=request.getParameter("arriveTime");
	String interconnect=request.getParameter("interconnect");
	String layover=request.getParameter("layover");
	String dateArrive=request.getParameter("dateArrive");
	
	try {
	    Class.forName("com.mysql.jdbc.Driver");
	    String connURL="jdbc:mysql://localhost/assignment?user=root&password=root"; 
	     Connection conn=DriverManager.getConnection(connURL); 
		String sqlStr="UPDATE flightschedule SET aircraftID = ?, originAirport = ?, destinationAirport = ?, country = ?, economyCost = ?,businessClassCost = ?, firstClassCost = ?, dateOfDepart = ?, duration = ?, departTime = ?, arrivalTime = ?, interconnect = ?, layoverTime = ?, dateOfArrival = ?" 
						+" WHERE flightScheduleID = "+FSID+"";
			
			
		PreparedStatement pstmt=conn.prepareStatement(sqlStr);
		pstmt.setInt(1,aircraftID);
		pstmt.setString(2,origin);
		pstmt.setString(3,destination);
		pstmt.setString(4,country);
		pstmt.setString(5,economy);
		pstmt.setString(6,business);
		pstmt.setString(7,firstclass);
		pstmt.setString(8,dateDepart);
		pstmt.setString(9,duration);
		pstmt.setString(10,departTime);
		pstmt.setString(11,arriveTime);
		pstmt.setString(12,interconnect);
		pstmt.setString(13,layover);
		pstmt.setString(14,dateArrive);
				
		int rec=pstmt.executeUpdate();
		
		
		if (rec==1){
				%> <p class="para">
				The database is successfully updated.
				</p>
				<%
				
		}else{
				%> <p class="para">
				Unfortunately, the database is not successfully updated. Please check your input.
				</p>
				<%
		}	
		
		conn.close();
				
	}catch(Exception e){
		
		out.println(e);
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