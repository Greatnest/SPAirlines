<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
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
				<h1>Reviews</h1>
				
<%
String salutation=request.getParameter("salutation");
String name=request.getParameter("name");
String email=request.getParameter("email");
String rating=request.getParameter("rating");
String review=request.getParameter("review");

try {
    // Step1: Load JDBC Driver
    Class.forName("com.mysql.jdbc.Driver");
    // Step 2: Define Connection URL
    String connURL="jdbc:mysql://localhost/assignment?user=root&password=root"; 
    // Step 3: Establish connection to URL
    Connection conn=DriverManager.getConnection(connURL);
    // Step 4: Create Statement object
    Statement stmt=conn.createStatement();

	
	String sqlStr="Insert into review(salutation, name, email, rating, review) Values(?,?,?,?,?)";
	PreparedStatement pstmt=conn.prepareStatement(sqlStr);
	pstmt.setString(1,salutation);
	pstmt.setString(2,name);
	pstmt.setString(3,email);
	pstmt.setString(4,rating);
	pstmt.setString(5,review);
	
	int rec=pstmt.executeUpdate();
	
		if (rec==1){
			%> <p class="para">
			Your review has been submitted. Thank you very much for visiting SP Arlines,
			we hope you have an enjoyable time flying with us.
			</p>
			<%
			
		}else{
			%> <p class="para">
			Unfortunately, the server is currently down for maintenance. We apologise for the inconvenience caused, please try again later.
			</p>
			<%
	}	
		
		conn.close();
					
}catch(Exception e){
	
	out.println(e);
} %>

			
			</div>
			
		
		</div>
		
	<footer>
		<p id="credits">&copy; 2014 SP Airlines. All Rights Reserved.</p>
	</footer>
		
	</div>


</body>
</html>