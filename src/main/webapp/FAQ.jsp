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
				<h1>Frequently Asked Questions</h1>
				<p class="subtitle">Can I change my tickets booked online?
				<p class="para2">
				Yes. You can log into your account and manage your online ticket booking. Do note that
				any final amendments must be finalized within 14 days after booking or a penalty fee will be imposed. 
				</p>
				<p class="subtitle">What is the maximum weight of luggage allowed to be checked in before an additional fee is required?
				<p class="para2">
				First Class: 40kg<br/>
				Business Class: 30kg<br/>
				Economy Class: 20kg
				</p>
				<p class="subtitle">Due to last minute changes, I cannot fly. Can I cancel my booking?
				<p class="para2">
				 You can cancel your flight within 14 days of booking and 1 month prior to the flight. 
				 After which, you will only receive 50% of your payment as refund.
				 No refund will be made if booking is cancelled 1 week before the flight.
				</p>
			
			</div>
			
		
		</div>
		
	<footer>
		<p id="credits">&copy; 2014 SP Airlines. All Rights Reserved.</p>
	</footer>
		
	</div>


</body>
</html>