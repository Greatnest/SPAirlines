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
				<h1>View Flight Schedules</h1>
				<form action="p_flightScheduleResult.jsp" id="form3" method="post">
<%
		try {
	String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
	String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
	String dbusername = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
	String dbpassword = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
	
    Class.forName("com.mysql.jdbc.Driver");
    String connURL="jdbc:mysql://" + host + ":" + port + "/spairlines?" + "user=" + dbusername + "&password=" + dbpassword;
    Connection conn=DriverManager.getConnection(connURL);
		   
		    String sqlStr="select distinct originAirport from flightschedule";
		    String sqlStr2="select distinct destinationAirport,country from flightschedule";
		    PreparedStatement pstmt = conn.prepareStatement(sqlStr);	
		    PreparedStatement pstmt2 = conn.prepareStatement(sqlStr2);	
		    ResultSet rs = pstmt.executeQuery();
		    ResultSet rs2 = pstmt2.executeQuery();
		    
		    %>		    
		 		
		
				<fieldset>
					<label> Flying from:
					<select  name="origin">
					
<%					while(rs.next()){
			 		String origin=rs.getString("originAirport");
%>				        
						<option value="<%=origin %>"><%=origin %></option>
<% } %>
			        </select>
					</label><br/><br/>
			        

			        <label> Flying to:
			        <select  name="destination">
			        
<%					while(rs2.next()){
			 		String destination=rs2.getString("destinationAirport");
					String country = rs2.getString("country");
%>				        
						<option value="<%=destination %>"><%=destination %>,<%=country%></option>
<% } %>
			        </select>
			        </label><br/><br/>
	
			        
<%		conn.close();

		}catch(Exception e){
		out.println("An error has occured, please try again or contact the administrator at admin@spairlines.com. We apologize for the inconvenience.");
		}
%>			        
			        
			        <label> Departure Date:
			         <select  name="departureYYYY">
			        	<option value="null" selected>Year</option>
			            <option value="2014">2014</option>
			            <option value="2013">2013</option>
			            <option value="2012">2012</option>
			        </select>
			        <select  name="departureMM">
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
					<select  name="departureDD">
						<option value="null" selected>Day</option>
			            <option value="1">1</option>
			            <option value="2">2</option>
			            <option value="3">3</option>
			            <option value="4">4</option>
			            <option value="5">5</option>
			            <option value="6">6</option>
			            <option value="7">7</option>
			            <option value="8">8</option>
			            <option value="9">9</option>
			            <option value="10">10</option>
			            <option value="11">11</option>
			            <option value="12">12</option>
			            <option value="13">13</option>
			            <option value="14">14</option>
			            <option value="15">15</option>
			            <option value="16">16</option>
			            <option value="17">17</option>
			            <option value="18">18</option>
			            <option value="19">19</option>
			          	<option value="20">20</option>
			            <option value="21">21</option> 
			            <option value="22">22</option> 
			            <option value="23">23</option> 
			            <option value="24">24</option> 
			            <option value="25">25</option> 
			            <option value="26">26</option> 
			            <option value="27">27</option> 
			            <option value="28">28</option> 
			            <option value="29">29</option> 
			            <option value="30">30</option> 
			            <option value="31">31</option> 
			        </select>
			        </label><br/><br/>
			       
			        <label> Return Date:
			        <select  name="returnYYYY">
			        	<option value="null" selected>Year</option>
			            <option value="2014">2014</option>
			            <option value="2013">2013</option>
			            <option value="2012">2012</option>
			        </select>
			        <select  name="returnMM">
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
					<select  name="returnDD">
						<option value="null" selected>Day</option>
			            <option value="1">1</option>
			            <option value="2">2</option>
			            <option value="3">3</option>
			            <option value="4">4</option>
			            <option value="5">5</option>
			            <option value="6">6</option>
			            <option value="7">7</option>
			            <option value="8">8</option>
			            <option value="9">9</option>
			            <option value="10">10</option>
			            <option value="11">11</option>
			            <option value="12">12</option>
			            <option value="13">13</option>
			            <option value="14">14</option>
			            <option value="15">15</option>
			            <option value="16">16</option>
			            <option value="17">17</option>
			            <option value="18">18</option>
			            <option value="19">19</option>
			          	<option value="20">20</option>
			            <option value="21">21</option> 
			            <option value="22">22</option> 
			            <option value="23">23</option> 
			            <option value="24">24</option> 
			            <option value="25">25</option> 
			            <option value="26">26</option> 
			            <option value="27">27</option> 
			            <option value="28">28</option> 
			            <option value="29">29</option> 
			            <option value="30">30</option> 
			            <option value="31">31</option> 
			        </select>
			        </label><br/><br/><br/>
		        </fieldset>
		        
		        <fieldset>
				<input type="submit" class="submitLong" value="Submit">
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