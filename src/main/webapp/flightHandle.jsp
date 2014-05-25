<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title><title>SP Airlines</title>
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
				<h1>Update Flight Schedule</h1>


<% 
//This jsp file processes the option/button selected at viewFInfoSelect.jsp and determines whether
//there are any  selected rows of data to be deleted OR whether any set of data needs to be redirected for editing.

if (request.getParameter("edit") != null) {
    
	int fsid = Integer.parseInt(request.getParameter("edit"));
	
	try {
	    String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
	String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
	String dbusername = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
	String dbpassword = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
	
    Class.forName("com.mysql.jdbc.Driver");
    String connURL="jdbc:mysql://" + host + ":" + port + "/spairlines?" + "user=" + dbusername + "&password=" + dbpassword;
    Connection conn=DriverManager.getConnection(connURL);
	
	    String sqlStr="Select * from flightschedule where flightScheduleID = ?";
			
		PreparedStatement pstmt=conn.prepareStatement(sqlStr);
		pstmt.setInt(1,fsid);
		
		ResultSet rs=pstmt.executeQuery();
		
		while(rs.next()){
		String aircraftID=rs.getString("aircraftID");
		String origin=rs.getString("originAirport");
		String destination=rs.getString("destinationAirport");
		String country=rs.getString("country");
		String economy=rs.getString("economyCost");
		String business=rs.getString("businessClassCost");
		String first=rs.getString("firstClassCost");
		String dateDepart=rs.getString("dateOfDepart");
		String duration=rs.getString("duration");
		String departTime=rs.getString("departTime");
		String arriveTime=rs.getString("arrivalTime");
		String dateArrive=rs.getString("dateOfArrival");
		String interconnect=rs.getString("interconnect");
		String layover=rs.getString("layoverTime");
		
	
		
%>	<form action= updateFlight.jsp id="form2" method="post">
	
	<fieldset>
	<legend><span>Flight Information</span></legend><br/>
		<label>FSID: 
		<input type="text"  name="ID" value="<%= fsid %>">
		</label><br/><br/>
		
		<label>Aircraft ID:
		<input type="text" name="craftID" value="<%= aircraftID%>">
		</label><br/><br/>
		
		<label>Origin Airport:
		<input type="text" name="origin" value="<%=origin%>">
		</label><br/></br>
		
		<label>Destination Airport:
		<input type="text" name="destination" value="<%=destination%>">
		</label><br/><br/>
		
		<label>Country:
		<input type="text" name="country" value="<%= country%>">
		</label><br/><br/>
		
		<label>Flight Duration:
		<input type="text" name="duration" value="<%=duration %>">
		</label><br/><br/>
		
		<label>Departure Date:
		<input type="text" name="dateDepart" value="<%= dateDepart%>">
		</label><br/><br/>
		
		<label>Departing:
		<input type="text" name="departTime" value="<%= departTime%>">
		</label><br/><br/>
		
		<label>Arrival Date:
		<input type="text" name="dateArrive" value="<%= dateArrive%>">
		</label><br/><br/>
		
		<label>Arriving:
		<input type="text" name="arriveTime" value="<%= arriveTime%>">
		</label><br/><br/>
		
		<label>Interconnect ID (if any):
		<input type="text" name="interconnect" value="<%= interconnect%>">
		</label><br/><br/>
		
		<label>Overlay Time (if any):
		<input type="text" name="overlay" value="<%= layover%>">
		</label><br/><br/><br/>
		
	</fieldset>
	
	<fieldset>
	<legend><span>Costs</span></legend><br/>
		<label>Economy Class:
		<input type="text" name="economy" value="<%=economy%>">
		</label><br/><br/>
					
		<label>Business Class:
		<input type="text" name="business" value="<%=business%>">
		</label><br/><br/>
					
		<label>First Class:
		<input type="text" name="first" value="<%=first%>">
		</label><br/><br/>
	</fieldset>
				
	<fieldset>
		<input type="submit" class="submit" value="Update">
	</fieldset>
				
	</form>
	
	
	
<%    }
		conn.close();

	}catch(Exception e){
		
		out.println(e);
	}
	}





if (request.getParameter("delete") != null) {
	


	String[] del = request.getParameterValues("del");
	int[] delete = new int[del.length];
	for(int x=0;x< del.length;x++) { 
    	delete[x] = Integer.parseInt(del[x]); 
	}

try {
    // Step1: Load JDBC Driver
    Class.forName("com.mysql.jdbc.Driver");
    // Step 2: Define Connection URL
    String connURL="jdbc:mysql://localhost/assignment?user=root&password=root"; 
    // Step 3: Establish connection to URL
    Connection conn=DriverManager.getConnection(connURL);
    // Step 4: Create Statement object
	

	int count = 0;
		for(int i=0; i<del.length;i++){
			
			String sqlStr="Delete FROM flightSchedule where flightScheduleID =?";  
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);	
			pstmt.setInt(1, delete[i]);	
			count = pstmt.executeUpdate();
	}
		
		%> <p class="para">
			Selected flight record(s) have been successfully deleted.
		</p>
		<%
	
		conn.close();
	
}catch(Exception e){
	
	out.println(e);
}
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