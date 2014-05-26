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
	<script type="text/javascript" src="js/collapsible.js"></script>
	<script type="text/javascript" src="js/lightbox-2.6.min.js"></script>
	<script type="text/javascript" src="js/scripts.js"></script>
	<script type="text/javascript">
    $(document).ready( function() {
    	$("#sidebar").height(Math.max($("#content").height(),$("#sidebar").height()));
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
			<div id="sidebar">
			<br/><p class="loginword">Please login to manage your online booking.</p> <br/><br/>
			<form action="getAdminData.jsp" method="post">
				<label>User ID: 
				<input type="text" class="inputLogin" name="userid"/>
				</label><br/>
				
				<label>Password: 
				<input type="password" class="inputLogin" name="password"/>
				</label><br/>
				
				<input type="submit" class="submitLong" value="Login"/>
			</form>
			
			</div>
			<div id="maincon">
				<h1>Departure Flights</h1>
				<div id="flightview">
<% 
String destination=request.getParameter("destination");
String origin=request.getParameter("origin");
String Ryear=request.getParameter("returnYYYY");
String Rmonth=request.getParameter("returnMM"); //Number e.g 1 - Jan, 2 - Feb
String Rday=request.getParameter("returnDD");
String Dyear=request.getParameter("departureYYYY");
String Dmonth=request.getParameter("departureMM");
String Dday=request.getParameter("departureDD");


try {
     String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
	String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
	String dbusername = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
	String dbpassword = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
	
    Class.forName("com.mysql.jdbc.Driver");
    String connURL="jdbc:mysql://" + host + ":" + port + "/spairlines?" + "user=" + dbusername + "&password=" + dbpassword;
    Connection conn=DriverManager.getConnection(connURL);
	String sqlStr0="Select * from interconnecting where originAirport = ? and destinationAirport = ?";
	PreparedStatement pstmt0=conn.prepareStatement(sqlStr0);
	pstmt0.setString(1,origin);
	pstmt0.setString(2,destination);
	ResultSet rs0 = pstmt0.executeQuery();
	if(rs0.next()){ 
		String isInterconnect = rs0.getString("interconnecting");
		String layoverAirport = rs0.getString("LayoverAirport");

	if(isInterconnect .equals("No")){
		
	String sqlStr= "SELECT f.*, a.imagepath, a.model, a.flightNo, a.capacity "
			+ "FROM assignment.aircraft a inner join assignment.flightschedule f ON a.aircraftID = f.aircraftID "
			+ "WHERE f.originAirport = ? AND f.destinationAirport = ? "
			+ "AND year(f.dateOfDepart) = ? AND month(f.dateOfDepart) = ? "
			+ "AND day(f.dateOfDepart) = ?";
	
	PreparedStatement pstmt=conn.prepareStatement(sqlStr);
	pstmt.setString(1,origin);
	pstmt.setString(2,destination);
	pstmt.setString(3,Dyear);
	pstmt.setString(4,Dmonth);
	pstmt.setString(5,Dday);
	ResultSet rs = pstmt.executeQuery();
	
	
%>
		<!-- Collapsible table starts here! -->
		
		<%  while(rs.next()){ 
			int FSID=Integer.parseInt(rs.getString("flightScheduleID"));
			int flightNo=Integer.parseInt(rs.getString("flightNo"));
			double duration=Double.parseDouble(rs.getString("duration"));
			String departTime=rs.getString("departTime");
			String arriveTime=rs.getString("arrivalTime");
			String image=rs.getString("imagepath");
			String model=rs.getString("model");
			String interconnect=rs.getString("interconnect");
			int capacity=Integer.parseInt(rs.getString("capacity"));
			String dateOfDepart=rs.getString("dateOfDepart");
			String dateOfArrival=rs.getString("dateOfArrival");
				
		%>
		
		<div class="expandable-panel" id="cp-1">
		        <div class="expandable-panel-heading">
		            <h2><span class="bold">Flight No. </span><%=flightNo %> <span class="bold">Departure: </span><%=departTime %> <span class="bold">Arrival: </span> <%=arriveTime %> 
		            <span class="bold">Duration: </span><%=duration %> hrs<span class="icon-close-open"></span></h2>
		         </div>
		        <div class="expandable-panel-content">
		            <p class="para"> 
		            <span class="bold2">Departure Date:</span> <%=dateOfDepart %></br>
		            <span class="bold2">Origin Airport:</span> <%=origin %></br>
		            <span class="bold2">Arrival Date:</span> <%=dateOfArrival %></br>
		            <span class="bold2">Destination Airport:</span> <%=destination %></br></br>
		            <span class="bold2">Aircraft Model:</span> <%= model %> <br/>
		            <span class="bold2">Passenger Capacity:</span> <%=capacity %><br/><br/>
		            <span class="bold2">Plane Layout:</span> <br/><br/>
		            <a href="<%=image %>" data-lightbox="plane" ><img src ="<%= image%>" width="100" height="100"/></a>		                                                         
		            </p>
		        </div>
		    </div>	
		    	    
<%  } 
		
		
		}else{
		
		
	String sqlStr2= "SELECT f.*, a.imagepath, a.model, a.flightNo, a.capacity "
			+ "FROM assignment.aircraft a inner join assignment.flightschedule f ON a.aircraftID = f.aircraftID "
			+ "WHERE interconnect in "
			+ "(Select interconnect from flightschedule "
			+ "WHERE originAirport = ? AND destinationAirport = ? "
			+ "AND interconnect <> '-' "
			+ "AND year(dateOfDepart) = ? AND month(dateOfDepart) = ? "
			+ "AND day(dateOfDepart) = ?)";		

	PreparedStatement pstmt3=conn.prepareStatement(sqlStr2);
	pstmt3.setString(1,origin);
	pstmt3.setString(2,layoverAirport);
	pstmt3.setString(3,Dyear);
	pstmt3.setString(4,Dmonth);
	pstmt3.setString(5,Dday);
	ResultSet rs3 = pstmt3.executeQuery();
		
		
			while(rs3.next()){ 
			int FSID=Integer.parseInt(rs3.getString("flightScheduleID"));
			int flightNo=Integer.parseInt(rs3.getString("flightNo"));
			double duration=Double.parseDouble(rs3.getString("duration"));
			String time=rs3.getString("departTime");
			String arriveTime=rs3.getString("arrivalTime");
			String image=rs3.getString("imagepath");
			String model=rs3.getString("model");
			String interconnect=rs3.getString("interconnect");
			int capacity=Integer.parseInt(rs3.getString("capacity"));
			String dateOfDepart=rs3.getString("dateOfDepart");
			String dateOfArrival=rs3.getString("dateOfArrival");
			String desAirport=rs3.getString("destinationAirport");
			String oriAirport=rs3.getString("originAirport");
			String layover=rs3.getString("layoverTime");
				
			
%>			<!-- Collapsible table starts here! -->

		<div class="expandable-panel" id="cp-1">
	        <div class="expandable-panel-heading">
	            <h2><span class="bold">Flight No. </span><%=flightNo %> <span class="bold">Departure: </span><%=time %> <span class="bold">Arrival: </span> <%=arriveTime %> 
	            <span class="bold">Duration: </span><%=duration %> hrs<span class="icon-close-open"></span></h2>
	         </div>
	        <div class="expandable-panel-content">
	              <p class="para"> 
	              *This is an interconnecting flight, please check for same interconnect ID*</br></br>
		            <span class="bold2">Departure Date:</span> <%=dateOfDepart %></br>
		            <span class="bold2">Origin Airport:</span> <%=oriAirport %></br>
		            <span class="bold2">Arrival Date:</span> <%=dateOfArrival %></br>
		            <span class="bold2">Destination Airport:</span> <%=desAirport %></br>
		            <span class="bold2">Interconnect ID:</span> <%=interconnect %></br>
		            <span class="bold2">Overlay Time:</span> <%=layover %> hrs</br></br>
		            <span class="bold2">Aircraft Model:</span> <%= model %> <br/>
		            <span class="bold2">Passenger Capacity:</span> <%=capacity %><br/><br/>
		            <span class="bold2">Plane Layout:</span> <br/><br/>
		            <a href="<%=image %>" data-lightbox="plane" ><img src ="<%= image%>" width="100" height="100"/></a>		                                                         
		            </p>
	        </div>
	    </div>	
	    
	    
<%		}
			}
	}
		
	conn.close();
}catch(Exception e){
	
	out.println(e);
} 

%>
	<h1>Return Flights</h1><br/>

<%

try {
    // Step1: Load JDBC Driver
    Class.forName("com.mysql.jdbc.Driver");
    // Step 2: Define Connection URL
    String connURL="jdbc:mysql://localhost/assignment?user=root&password=root"; 
    // Step 3: Establish connection to URL
    Connection conn=DriverManager.getConnection(connURL);
    // Step 4: Create Statement object
    //Statement stmt=conn.createStatement();

    String sqlStr0="Select * from interconnecting where originAirport = ? and destinationAirport = ?";
	PreparedStatement pstmt0=conn.prepareStatement(sqlStr0);
	pstmt0.setString(1,destination);
	pstmt0.setString(2,origin);
	ResultSet rs0 = pstmt0.executeQuery();
	
	if(rs0.next()){ 
		String isInterconnect = rs0.getString("interconnecting");
		String layoverAirport = rs0.getString("LayoverAirport");

	if(isInterconnect .equals("No")){

		
	String sqlStr= "SELECT f.*, a.imagepath, a.model, a.flightNo, a.capacity "
			+ "FROM assignment.aircraft a inner join assignment.flightschedule f ON a.aircraftID = f.aircraftID "
			+ "WHERE f.originAirport = ? AND f.destinationAirport = ? "
			+ "AND year(f.dateOfDepart) = ? AND month(f.dateOfDepart) = ? "
			+ "AND day(f.dateOfDepart) = ?";
	
	PreparedStatement pstmt=conn.prepareStatement(sqlStr);
	pstmt.setString(1,destination);
	pstmt.setString(2,origin);
	pstmt.setString(3,Ryear);
	pstmt.setString(4,Rmonth);
	pstmt.setString(5,Rday);
	ResultSet rs = pstmt.executeQuery();
	
%>
		<!-- Collapsible table starts here! -->
		
		<%  while(rs.next()){ 
			int FSID=Integer.parseInt(rs.getString("flightScheduleID"));
			int flightNo=Integer.parseInt(rs.getString("flightNo"));
			double duration=Double.parseDouble(rs.getString("duration"));
			String time=rs.getString("departTime");
			String arriveTime=rs.getString("arrivalTime");
			String image=rs.getString("imagepath");
			String model=rs.getString("model");
			String interconnect=rs.getString("interconnect");
			int capacity=Integer.parseInt(rs.getString("capacity"));
			String dateOfDepart=rs.getString("dateOfDepart");
			String dateOfArrival=rs.getString("dateOfArrival");
				
		%>
		
		<div class="expandable-panel" id="cp-1">
		        <div class="expandable-panel-heading">
		            <h2><span class="bold">Flight No. </span><%=flightNo %> <span class="bold">Departure: </span><%=time %> <span class="bold">Arrival: </span> <%=arriveTime %> 
		            <span class="bold">Duration: </span><%=duration %> hrs<span class="icon-close-open"></span></h2>
		         </div>
		        <div class="expandable-panel-content">
		             <p class="para"> 
		            <span class="bold2">Departure Date:</span> <%=dateOfDepart %></br>
		            <span class="bold2">Origin Airport:</span> <%=destination %></br>
		            <span class="bold2">Arrival Date:</span> <%=dateOfArrival %></br>
		            <span class="bold2">Destination Airport:</span> <%=origin %></br></br>
		            <span class="bold2">Aircraft Model:</span> <%= model %> <br/>
		            <span class="bold2">Passenger Capacity:</span> <%=capacity %><br/><br/>
		            <span class="bold2">Plane Layout:</span> <br/><br/>
		            <a href="<%=image %>" data-lightbox="plane" ><img src ="<%= image%>" width="100" height="100"/></a>		                                                         
		            </p>
		        </div>
		    </div>	
		    	    
<%  } 
		
		
		}else{
		
		
	String sqlStr2= "SELECT f.*, a.imagepath, a.model, a.flightNo, a.capacity "
			+ "FROM assignment.aircraft a inner join assignment.flightschedule f ON a.aircraftID = f.aircraftID "
			+ "WHERE interconnect in "
			+ "(Select interconnect from flightschedule "
			+ "WHERE originAirport = ? AND destinationAirport = ? "
			+ "AND interconnect <> '-' "
			+ "AND year(dateOfDepart) = ? AND month(dateOfDepart) = ? "
			+ "AND day(dateOfDepart) = ?)";		

	PreparedStatement pstmt3=conn.prepareStatement(sqlStr2);
	pstmt3.setString(1,destination);
	pstmt3.setString(2,layoverAirport);
	pstmt3.setString(3,Ryear);
	pstmt3.setString(4,Rmonth);
	pstmt3.setString(5,Rday);
	ResultSet rs3 = pstmt3.executeQuery();
		
		
			while(rs3.next()){ 
			int FSID=Integer.parseInt(rs3.getString("flightScheduleID"));
			int flightNo=Integer.parseInt(rs3.getString("flightNo"));
			double duration=Double.parseDouble(rs3.getString("duration"));
			String time=rs3.getString("departTime");
			String arriveTime=rs3.getString("arrivalTime");
			String image=rs3.getString("imagepath");
			String model=rs3.getString("model");
			String interconnect=rs3.getString("interconnect");
			int capacity=Integer.parseInt(rs3.getString("capacity"));
			String dateOfDepart=rs3.getString("dateOfDepart");
			String dateOfArrival=rs3.getString("dateOfArrival");
			String desAirport=rs3.getString("destinationAirport");
			String oriAirport=rs3.getString("originAirport");
			String layover=rs3.getString("layoverTime");
				
			
%>			<!-- Collapsible table starts here! -->

		<div class="expandable-panel" id="cp-1">
	        <div class="expandable-panel-heading">
	            <h2><span class="bold">Flight No. </span><%=flightNo %> <span class="bold">Departure: </span><%=time %> <span class="bold">Arrival: </span> <%=arriveTime %> 
	            <span class="bold">Duration: </span><%=duration %> hrs<span class="icon-close-open"></span></h2>
	         </div>
	        <div class="expandable-panel-content">
	           <p class="para"> 
	              *This is an interconnecting flight, please check for same interconnect ID*</br></br>
		            <span class="bold2">Departure Date:</span> <%=dateOfDepart %></br>
		            <span class="bold2">Origin Airport:</span> <%=oriAirport %></br>
		            <span class="bold2">Arrival Date:</span> <%=dateOfArrival %></br>
		            <span class="bold2">Destination Airport:</span> <%=desAirport %></br>
		            <span class="bold2">Interconnect ID:</span> <%=interconnect %></br>
		            <span class="bold2">Overlay Time:</span> <%=layover %> hrs</br></br>
		            <span class="bold2">Aircraft Model:</span> <%= model %> <br/>
		            <span class="bold2">Passenger Capacity:</span> <%=capacity %><br/><br/>
		            <span class="bold2">Plane Layout:</span> <br/><br/>
		            <a href="<%=image %>" data-lightbox="plane" ><img src ="<%= image%>" width="100" height="100"/></a>		                                                         
		            </p>
	        </div>
	    </div>	
	    
	    
<%		}
			}
	}	
		
	conn.close();
}catch(Exception e){
	
	out.println(e);
} 


	
%>

</div>

			
		</div>
		
</div>		
		
	<footer>
		<p id="credits">&copy; 2014 SP Airlines. All Rights Reserved.</p>
	</footer>
		
	</div>


</body>
</html>