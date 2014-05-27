<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SP Airlines</title>
   <style type="text/css"><%@include file="css/style.css" %></style>
   <style type="text/css"><%@include file="css/js-image-slider.css" %></style>
	<link rel="shortcut icon" href="icons/favicon.ico"/>
	<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="js/js-image-slider.js"></script>
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
			<br/><p class="loginword">Sorry, you've entered an invalid User ID or password! <br/><br/> Please login to manage your online booking. </p><br/><br/>
			<form action="getAdminData.jsp" method="post">
				<label>User ID: 
				<input type="text" class="inputLogin" name="userid"/>
				</label><br/>
				
				<label>Password: 
				<input type="password" class="inputLogin" name="password"/>
				</label><br/>
				
				<input type="submit" class="submitLong" value="Login"/>
				<a href="forgetPassword.jsp"/>Forgot your password?</a>
			</form>
			
			</div>
			
			
			<div id="maincon">
				<h1>Welcome</h1><br /><br />
				
				<div id="sliderFrame">
        		<div id="slider">
                <img src="img/MtFuji.jpg" alt="Mt Fuji, Japan"/>
            	<img src="img/Taitung.jpg" alt="Taitung Resort, Taiwan" />
           		 <img src="img/legoland.jpg" alt="Legoland, Malaysia" />
            	<img src="img/Australia.jpg" alt="Australia" />
            	<img src="img/Italy.JPG" alt="Italy" />
        		</div>
   				</div><br /><br /><br />
   				
   			<p class="para3"><span class="bold2">Flight Updates:</span></p>
				<p class="para3"><span class="bold2">28/5 09:00</span> Flight No. 147 JL 850-200 to Hong Kong has been delayed for 2 hours 
				due to thunderstorm.
				<p class="para3"><span class="bold2">27/5 06:00</span> Flight No. 147 JL 777-200 to Taiwan has successfully taken off.
				<br /><br />
				</p>
			
			</div>
			
		
		</div>
		
	<footer>
		<p id="credits">&copy; 2014 SP Airlines. All Rights Reserved.</p>
	</footer>
		
	</div>


</body>
</html>