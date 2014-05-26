<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SP Airlines</title>
   <style type="text/css"><%@include file="css/style.css" %></style>
   <style type="text/css"><%@include file="css/lightbox.css" %></style>
	<link rel="shortcut icon" href="icons/favicon.ico"/>
	<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="js/scripts.js"></script>
	<script type="text/javascript" src="js/lightbox-2.6.min.js"></script>
	<script type="text/javascript" src="js/Rotator.js"></script>
	
	<script type="text/javascript">
    $(document).ready( function() {
        $('#sidebar').height($('#content').height());
    });
	</script>
	
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
				<h1>View Aircraft Information</h1>
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
	
	String sqlStr="SELECT * FROM aircraft";  
	ResultSet rs = stmt.executeQuery(sqlStr);
	
	%> <form action="aircraftHandle.jsp" method="post"> 
	<table id="aircraftview">
 	<th><span class="bold2">Aircraft ID</span></th>
 	<th><span class="bold2">Model</span></th>
 	<th><span class="bold2">Flight No.</span></th>
 	<th><span class="bold2">Passenger Capacity</span></th>
 	<th><span class="bold2">Plane layout</span></th>
 	<th><span class="bold2">Del</span></th>
	
	<%
 	while(rs.next()){ //retrieve each table result one by one
 		int aircraftID=Integer.parseInt(rs.getString("aircraftID"));
 		int flightNo=Integer.parseInt(rs.getString("flightNo"));
 		String model=rs.getString("model");
 		int capacity=Integer.parseInt(rs.getString("capacity"));
 		String image=rs.getString("imagepath");
 
 		
 	%>	<tr>
 		<td>
 			<input type="submit" name="edit" class="edit" value="<%=aircraftID %>"/>
 		</td>
 		<td><%= model %></td>
 		<td><%= flightNo %></td>
 		<td><%= capacity %></td>
 		<td><a href="<%=image %>" data-lightbox="plane" ><img src ="<%= image%>" width="100" height="100"/></a></td>
 		<td><input type="checkbox" name="del" value="<%=aircraftID %>"/></td>
 	
 		</tr>
 		
 		
 	
 	<% } %>
 	</table><br/><br/>
 		
 		
 		
			<fieldset>
				<input type="submit" name="delete" class="submit" value="Delete">
			</fieldset>
		</form>
 <%
 
 	conn.close();
	
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