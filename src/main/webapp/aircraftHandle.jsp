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
	<script type="text/javascript" src="js/scripts.js"></script></head>
	<script type="text/javascript" src="js/Rotator.js"></script>
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
				<h1>Update Aircraft Details</h1>

<% 
//This jsp file processes the option/button selected at viewAircraftInfo.jsp and determines whether
//there are any  selected rows of data to be deleted OR whether any set of data needs to be redirected for editing.

if (request.getParameter("edit") != null) {
    
	int aircraftID = Integer.parseInt(request.getParameter("edit"));
	
	try {
	   String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
	String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
	String dbusername = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
	String dbpassword = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
	
    Class.forName("com.mysql.jdbc.Driver");
    String connURL="jdbc:mysql://" + host + ":" + port + "/spairlines?" + "user=" + dbusername + "&password=" + dbpassword;
    Connection conn=DriverManager.getConnection(connURL);
	
	    String sqlStr="Select * from aircraft where aircraftID = ?";
			
			
		PreparedStatement pstmt=conn.prepareStatement(sqlStr);
		pstmt.setInt(1,aircraftID);
		
		ResultSet rs=pstmt.executeQuery();
		
		while(rs.next()){
		String flightNo=rs.getString("flightNo");
		String model=rs.getString("model");
		String capacity=rs.getString("capacity");
		String imagepath=rs.getString("imagepath");
		
		
	
%>	<form action= updateAircraft.jsp id="form2" method="post">
	
	<fieldset>
	<legend><span>Flight Information</span></legend><br/>
		<label>Aircraft ID 
		<input type="text"  name="ID" value="<%= aircraftID %>">
		</label><br/><br/>
		
		<label>Flight No.: 
		<input type="text" name="flightNo" value="<%=flightNo%>">
		</label></br></br>
		
		<label>Aircraft Model: 
		<input type="text" name="craftModel" value="<%=model%>">
		</label></br></br>
					
		<label>Passenger Capacity: 
		<input type="text" name="capacity" value="<%=capacity%>">
		</label><br/></br>
		
		<label>Plane Seat Layout: 
		<input type="text" name="image" value="<%=imagepath%>">
		</label><br/></br></br></br>
		</fieldset>
				
	<fieldset>
		<input type="submit" class="submit" value="Update">
	</fieldset>			
	</form>
	
	
	
<% 
		}
conn.close();

}catch(Exception e){
	out.println("An error has occured, please try again or contact the administrator at admin@spairlines.com. We apologize for the inconvenience.");
}
}




if (request.getParameter("delete") != null) {
	


	String[] del = request.getParameterValues("del");
	int[] delete = new int[del.length];
	for(int x=0;x< del.length;x++) { 
    	delete[x] = Integer.parseInt(del[x]); 
	}

try {
   String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
	String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
	String dbusername = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
	String dbpassword = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
	
    Class.forName("com.mysql.jdbc.Driver");
    String connURL="jdbc:mysql://" + host + ":" + port + "/spairlines?" + "user=" + dbusername + "&password=" + dbpassword;
    Connection conn=DriverManager.getConnection(connURL);

	int count = 0;
		for(int i=0; i<del.length;i++){
			
			String sqlStr="Delete FROM aircraft where aircraftID =?";  
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);	
			pstmt.setInt(1, delete[i]);	
			count = pstmt.executeUpdate();
	}
		
	response.sendRedirect("viewAircraftInfo.jsp");
	
	conn.close();
	
}catch(Exception e){
	
	out.println("An error has occured, please try again or contact the administrator at admin@spairlines.com. We apologize for the inconvenience.");
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