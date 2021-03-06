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
				<li><a href="home.html">Home</a></li>
				<li><a href="#">About Us</a>
					<ul class="noJS">
						<li><a href="jacqueline.html">History</a></li>
						<li><a href="joker.html">Airplanes</a></li>
					</ul>
				</li>
				<li><a href="#">Flight Schedule</a></li>
				<li><a href="#">Plan & Book</a>
					<ul class="noJS">
						<li><a href="bathing.html">Bathing</a></li>
						<li><a href="nutrition.html">Nutrition</a></li>
					</ul>
				</li>
				<li><a href="feedback.html">Enquiries</a>
					<ul class="noJS">
						<li><a href="gallery.html#joker">Joker</a></li>
						<li><a href="gallery.html#joseph">Joseph</a></li>
						<li><a href="gallery.html#others">Others</a></li>
					</ul>
				</li>	
		</ul>
		
		<div id="bannerbox">
			<img src="banners-bg/mainbanner.jpg" width="800" height="400" alt="Welcome"/>
		</div>
		
		<div id="content">
			<div id="sidebar">
			<a class="sideBTN" href="addAircraft.jsp">Add New Aircraft</a>
			<a class="sideBTN" href="december2013.html">New Flight Schedule</a>
			<a class="sideBTN" href="december2013.html">Flight Information</a>
			<a class="sideBTN" href="december2013.html">Logout</a>
			</div>
			<div id="content2">		
			<h2>Contact Us</h2> 
			<h3>Frequently Asked Questions</h3>
			<ul>
		    <li>What do I have to do on the day that I have booked the buses for? <br/>
			<span class="best">About 1 hour before </span> the stipulated time, a <span class="best">representative will contact you</span> to confirm that the booking is still on and 
				he will inform you of the<span class="best"> buses's plate licenses </span>for you to confirm when they arrive at the location.<br/><br/></li>
			<li>How do I go about doing the payment? <br/>
			For<span class="best"> 1 way trips</span>, you will pay the driver when you have <span class="best">reached your destination.</span><br/>For <span class="best">2 way trips</span>, 
			you will pay the driver when you have<span class="best"> reached your return destination.</span><br/><br/></li> 
			<li>Will a receipt be given? <br/> 
			Yes, an <span class="best">official receipt will be given</span> when you have made your payment to the driver.<br/><br/></li> 
        </ul>
		
			<!--Feedback form starts here-->
			<h3>Feedback</h3> 
			<p>Any enquires to ask us or feedback to tell us? <br/> Fill in the form and we will follow up on it!</p>
				<form action="receiveFeedback.jsp" method=post>
				<fieldset id="feedback">
				<span id="feed">Feedback</span><br/>
					<label>
					Name:
					</label> 
					<input type="text" name="fedname" id="fednameinput"  placeholder="Your name" required/> 	
					<br/>
					
					<label>
					Email:
					</label>
					<input type="email" name="fedEmailinput" id="fedemailinput"  placeholder="Your email" required />
					<br/>

					<label>	
					Contact Number:
					</label> 
					<input type="text" name="fedcontactno." id="fednumberinput"  placeholder="Your contact number" />
					<br/>
					
					<label>
					Address:
					</label>
					<input type="text" name="fedAddress" id="fedddinput" placeholder="Your address"  />
					<br/>
					
					<label>
					Feedback (Max 300 Characters):
					</label> <br/>
					<textarea id="fedfeedback" name="fedfeedback" rows="4" cols="87" placeholder="Maximum of 300 characters" required></textarea>
					<br/>
				<input type="submit" class="submit" value="Submit" />
				<input type="reset" class="reset" value="Reset"/>
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