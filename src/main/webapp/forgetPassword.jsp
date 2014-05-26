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
			<img src="banners-bg/banner.jpg" width="900" height="350" alt="Welcome"/>
		</div>
		
		
		<div id="content">
			<div id="sidebar">
			<br/>Please login to manage your online booking. <br/><br/>
			<form action="getAdminData.jsp" method="post">
				<label>User ID: 
				<input type="text" name="userid"/>
				</label><br/><br/>
				
				<label>Password: 
				<input type="password" name="password"/>
				</label><br/><br/>
				
				<input type="submit" class="submit" value="Login"/>
			</form>
			</div>

			<div id="maincon">
			<h2>Please input your email to reset password</h2>
			<form action="getPassword.jsp" method="post">
			<label>Email
			<input type="email" name="email"/>
			</label>
			<input type ="submit" class="submit" value="Reset Password"/>
			</form>
					
			
			</div>
			</div>
	
<%@include file="footer.jsp" %>
 