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
			<h1>Contact Us</h1> 
				<p class="para"> Thank you very much for visiting SP Airlines. Should you have any further enquiries, please
				feel free to to use the form provided below and we will get back to you shortly. Alternatively,
				you may call us at 64751113 or drop by our customer service centre located at: <br/><br/>
				
				167 Temasek Boulevard<br/>
				Singapore 100167<br/><br/>
				
				Opening hours:<br/> Monday - Sunday: 9am - 6pm
				</p>
				
				<form action="receiveContact.jsp" id="form2" method=post>
				
				<fieldset>
					<label>Name:
					<input type="text" name="fedname"/>
					</label><br/><br/>
					
					<label>Email:
					<input type="text" name="fedEmailinput"/>
					</label><br/><br/>

					<label>Contact Number:
					<input type="text" name="fedcontactno." />
					</label><br/><br/><br/>
					
					<label>Enquiry:
					<textarea name="fedfeedback" rows="4" cols="87"></textarea>
					</label><br/><br/><br/>
				</fieldset>
				
				<fieldset>					
				<input type="submit" class="reset" value="Submit" />
				<input type="reset" class="submit" value="Reset"/>
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