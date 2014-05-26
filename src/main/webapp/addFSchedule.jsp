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
				<h1>Add New Flight Schedule</h1>
				<form action= addFlightSchedule.jsp id="form3" method="post">
				
				<fieldset>
				<legend><span>Flight Information</span></legend><br/>
					<label>Flight Schedule ID:
					<input type="text" name="FSID">
					</label><br/><br/>
					
					<label>Aircraft ID:
					<input type="text" name="craftID">
					</label><br/><br/>
					
					<label>Origin Airport:
					<input type="text" name="origin">
					</label><br/></br>
					
					<label>Destination Airport:
					<input type="text" name="destination">
					</label><br/><br/>
					
					<label>Country:
					<input type="text" name="country">
					</label><br/><br/>
					
					<label>Origin Country:
					<input type="text" name="origincountry">
					</label><br/><br/>
					
					<label>Flight Duration:
					<input type="text" name="duration">
					</label><br/><br/>
					
					<label>Departure Date:
					<input type="text" name="dateDepart" value="YYYY-MM-DD">
					</label><br/><br/>
					
					<label>Departing:
					<input type="text" name="departTime" value="HH:MM:SS">
					</label><br/><br/>
					
					<label>Arrival Date:
					<input type="text" name="dateArrive" value="YYYY-MM-DD">
					</label><br/><br/>
					
					<label>Arriving:
					<input type="text" name="arriveTime" value="HH:MM:SS">
					</label><br/><br/>
					
					<label>Interconnect ID (if any):
					<input type="text" name="interconnect" value="-">
					</label><br/><br/>
					
					<label>Layover Time (if any):
					<input type="text" name="layover" value="0">
					</label><br/><br/><br/>
					
				</fieldset>
				
				
				<fieldset>
				<legend><span>Costs</span></legend><br/>
					<label>Economy Class:
					<input type="text" name="economy">
					</label><br/><br/>
					
					<label>Business Class:
					<input type="text" name="business">
					</label><br/><br/>
					
					<label>First Class:
					<input type="text" name="first">
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