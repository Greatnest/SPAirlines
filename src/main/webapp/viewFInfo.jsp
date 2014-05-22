<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
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
			
			<a class="sideBTN" href="addAircraft.jsp">Add New Aircraft</a>
			<a class="sideBTN" href="viewAircraftInfo.jsp">Aircraft Information</a>
			<a class="sideBTN" href="addFSchedule.jsp">New Flight Schedule</a>
			<a class="sideBTN" href="viewFInfo.jsp">Flight Information</a>
			<a class="sideBTN" href="logout.jsp">Logout</a>
			</div>
			
			
			<div id="maincon">
				<h1>View Flight Information</h1><br/>				
				<form action="viewFInfoSelect.jsp" id="form3" method="post">
				<fieldset>
					<label> Flight Schedule:
					<select  name="viewYYYY">
				        <option value="null" selected>Year</option>
				        <option value="2014">2014</option>
				        <option value="2013">2013</option>
				        <option value="2012">2012</option>
				    </select>
					<select  name="viewMM">
				        <option value="null" selected>Month</option>
				        <option value="1">Jan</option>
				        <option value="2">Feb</option>
				        <option value="3">Mar</option>
				        <option value="4">Apr</option>
				        <option value="5">May</option>
				        <option value="6">June</option>
				        <option value="7">July</option>
				        <option value="8">Aug</option>
				        <option value="9">Sep</option>
				        <option value="10">Oct</option>
				        <option value="11">Nov</option>
				        <option value="12">Dec</option>
				    </select>
					</label><br/><br/><br/>
			    </fieldset>
		        
		        <fieldset>
		        <input type="submit" class="submit" value="submit">
		        </fieldset>
		        
		        </form>
		        
				
			
			</div>
			
		
		</div>
		
	<footer>
		<p id="credits">&copy; 2014 SP Airlines. All Rights Reserved.</p>
	</footer>
		
	</div>


</body>
</html>