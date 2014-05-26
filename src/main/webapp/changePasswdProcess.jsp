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
	<script type="text/javascript" src="js/Rotator.js"></script>
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
				<h1>Change Password</h1>
<% 
	
	String userid=request.getParameter("userid");
	String oldpasswd=request.getParameter("oldpasswd");
	String newpasswd=request.getParameter("newpasswd");
	String confnewpasswd=request.getParameter("confnewpasswd");
	
	try {
	    String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
	String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
	String dbusername = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
	String dbpassword = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
	
    Class.forName("com.mysql.jdbc.Driver");
    String connURL="jdbc:mysql://" + host + ":" + port + "/spairlines?" + "user=" + dbusername + "&password=" + dbpassword;
    Connection conn=DriverManager.getConnection(connURL);
	    String sqlStr="Select * from admin where userid = ? ";
		PreparedStatement pstmt=conn.prepareStatement(sqlStr);
		pstmt.setString(1, userid);
		ResultSet rs = pstmt.executeQuery();
		
		
		String sqlStr2="UPDATE admin SET password = ? WHERE userid = ?";
		PreparedStatement pstmt2=conn.prepareStatement(sqlStr2);
		pstmt2.setString(1, newpasswd);
		pstmt2.setString(2, userid);
		int rec=0;
		
		   if(rs.next()){
			   String passwd=rs.getString("password");
			   
			   if(oldpasswd.equals(passwd) && newpasswd .equals(confnewpasswd)){
					rec=pstmt2.executeUpdate();
				
			    }
			   
			   else{
			%> <p class="para">
			System failed to changed your password. Please ensure that you're entered the correct information.
			</p>
		<%}	
		   }
		   
			if (rec==1){
				%> <p class="para">
				Your password is successfully changed.
				</p>
		<%
				
			}else{
				%> <p class="para">
				System failed to changed your password. Please ensure that you're entered the correct information.
		
				<form action="changePasswd.jsp" method="post">
					<input type="submit" class="submit" value="Back">
				</form>
				</p>
				<%
			}
		
		   
		conn.close();
				
	}catch(Exception e){
		
		out.println(e);
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