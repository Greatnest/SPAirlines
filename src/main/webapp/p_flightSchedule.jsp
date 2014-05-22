<%@include file="header.jsp" %>
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
				<li><a href="#">Flight Schedule &amp; Online Booking</a></li>
				<li><a href="#">Enquiries</a>	
					<ul class="noJS">
						<li><a href="FAQ.jsp">FAQ</a></li>
						<li><a href="contact.jsp">Contact Us</a></li>
					</ul>
				</li>	
		</ul>
		
		<div id="bannerbox">
			<!-- <img src="banners-bg/banner.jpg" width="900" height="450" alt="Welcome"/> -->
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
				<h1>View Flight Schedules</h1>
				<form action="P_fullflightSchedule.jsp" id="form2" method="post">
				
	
<%
try {

   Class.forName("com.mysql.jdbc.Driver");
    String connURL="jdbc:mysql://'System.getenv'(OPENSHIFT_MYSQL_DB_HOST):'System.getenv'(OPENSHIFT_MYSQL_DB_PORT)/spairlines", System.getenv("OPENSHIFT_MYSQL_DB_USERNAME", System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD=");
    Connection conn=DriverManager.getConnection(connURL);
    Statement stmt=conn.createStatement();
   
    String sqlStr="select distinct originAirport from flightschedule";
	ResultSet rs=stmt.executeQuery(sqlStr);
}catch(Exception e){
	out.println(e);
}	
%>				    
<fieldset>
					<label> Origin Airport:
					<select  name="origin">
				        <option value="Japan Nakata Airport" selected>Japan Nakata Airport</option>
				        <option value="South Korea">South Korea</option>
				        <option value="Singapore Changi Airport">Singapore Changi Airport</option>
			        </select>
					</label><br/><br/>    
			        <label> Destination Airport:
			        <select  name="destination">
				        <option value="Japan Nakata Airport" selected>Japan Nakata Airport</option>
				        <option value="South Korea">South Korea</option>
				        <option value="Singapore Changi Airport">Singapore Changi Airport</option>
			        </select>
			        </label><br/><br/>
			        
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
			            <option value="12">De</option>
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
			        </label><br/><br/>
		        </fieldset>
		   
		        <fieldset>
				<input type="submit" class="submit" value="Submit">
				</fieldset>
			</form>
			</div>
		</div>
	</div>	
<%@include file="footer.jsp" %>