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
			<img src="banners-bg/banner.jpg" width="900" height="450" alt="Welcome"/>
		</div>
		
		<div id="content">
			<div id="sidebar">
			<br/>Please login to manage your online booking. <br/><br/>
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
				<h1>SP Airlines Flight Booking</h1>
				<form action= "bookingProcess.jsp" id="form2" method="post">
				
				<fieldset>
				<legend><span>Flight Details</span></legend><br/>
					<label>Flight Schedule ID:
					<input type="text" name="FSID">
					</label><br/><br/>
					
					<label> Passenger Class:
					<select  name="class">
				        <option value="Economy Class" selected>Economy Class</option>
				        <option value="Business Class">Business Class</option>
				        <option value="First Class">First Class</option>
			        </select>
			        </label><br/><br/>
			        
			        <label> Trip:
					<select  name="trip">
						<option value="round" selected>Round Trip&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
				        <option value="one way" >One-way</option>
			        </select>
					</label><br/><br/><br/>
					
				</fieldset>

				<fieldset>
				<legend><span>Personal Details</span></legend><br/>					
					<label>Full Name:
					<input type="text" name="name" required>
					</label><br/><br/>
					
					<label>NRIC:
					<input type="text" name="NRIC" required>
					</label><br/><br/>
					
					<label>Address:
					<input type="text" name="address" required>
					</label><br/><br/>
					
					<label>Contact No.:
					<input type="text" name="contactNo" required>
					</label><br/><br/>
					
					<label> Email:
					<input type="text" name="email">
					</label><br/><br/><br/>
					
				</fieldset>
				
				<fieldset>
				<input type="submit" class="submit" value="Next">
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