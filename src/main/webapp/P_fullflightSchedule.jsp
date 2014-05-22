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
				<li><a href="p_flightSchedule.jsp">Flight Schedule</a></li>
				<li><a href="#">Plan & Book</a>
					<ul class="noJS">
						<li><a href="bathing.html">Bathing</a></li>
						<li><a href="nutrition.html">Nutrition</a></li>
					</ul>
				</li>
				<li><a href="#">Enquiries</a>
					<ul class="noJS">
						<li><a href="FAQ.jsp">FAQ</a></li>
						<li><a href="contact.jsp">Contact Us</a></li>
					</ul>
				</li>	
		</ul>
		
		<div id="bannerbox">
			<img src="banners-bg/banner.jpg" width="900" height="450" alt="Welcome"/>
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
			
			
<%try {

    Class.forName("com.mysql.jdbc.Driver");
    String connURL=System.getenv("OPENSHIFT_MYSQL_DB_URL");
    Connection conn=DriverManager.getConnection(connURL);
	String contextPath=request.getContextPath();
    String Dairport=request.getParameter("destination");
	String Oairport=request.getParameter("origin");
	String Ryear=request.getParameter("returnYYYY");
	String Rmonth=request.getParameter("returnMM"); //Number e.g 1 - Jan, 2 - Feb
	String Rday=request.getParameter("returnDD");
	String Dyear=request.getParameter("departureYYYY");
	String Dmonth=request.getParameter("departureMM");
	String Dday=request.getParameter("departureDD");
	
	
	//String sqlStr="SELECT * FROM flightschedule where originAirport=? and destinationAirport =? and year(returnDate)=? and month(returnDate)=?and day(returnDate)=? and year(departureDate)=? and month(departureDate)=? and day(departureDate)=?";
	//String sqlStr1="select aircraft.aircraftID, imagePath from aircraft inner join flightschedule on  aircraft.aircraftID=flightschedule.aircraftID where flightschedule.aircraftID=aircraft.aircraftID";
	StringBuilder sqlString= new StringBuilder();
	sqlString.append("SELECT ");
	sqlString.append("aircraft.aircraftID, originAirport, destinationAirport, country,");
	sqlString.append("economyCost, businessClassCost, firstClassCost, departureDate, flightTime,");
	sqlString.append("departureTime, returnDate, returnTime, imagePath, interconnectID");
	sqlString.append(" FROM ");
	sqlString.append("flightschedule, aircraft");
	sqlString.append(" WHERE ");
	sqlString.append("flightschedule.aircraftID=aircraft.aircraftID AND originAirport=? AND destinationAirport =? AND ");
	sqlString.append("year(returnDate)=? AND month(returnDate)=? AND day(returnDate)=? AND ");
	sqlString.append("year(departureDate)=? AND month(departureDate)=? AND day(departureDate)=?");
	String sqlStr=sqlString.toString();
	PreparedStatement pstmt=conn.prepareStatement(sqlStr);
	pstmt.setString(1,Oairport);
	pstmt.setString(2,Dairport);
	pstmt.setString(3,Ryear);
	pstmt.setString(4,Rmonth);
	pstmt.setString(5,Rday);
	pstmt.setString(6,Dyear);
	pstmt.setString(7,Dmonth);
	pstmt.setString(8,Dday);
	ResultSet rs = pstmt.executeQuery();	
	

%>	
	
	<table>
 	
 	<th>Origin Airport</th>
	<th>Destination Airport</th>
	<th>Country</th>
	<th>Economy Class Cost</th>
 	<th>Business Class Cost</th>
	<th>First Class Cost</th>
    <th>Departure Date</th>
    <th>Flight Time</th>
 	<th>Departure Time</th>
	<th>Return Date</th>
	<tr>
<%
 while(rs.next()){
		int interconnectID =Integer.parseInt(rs.getString("interconnectID"));
		String imagePath=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/"+ request.getContextPath()+"/"+rs.getString("imagePath");	
 		String origin=rs.getString("originAirport");
 		String destination=rs.getString("destinationAirport");
 		String country=rs.getString("country");
 		Double economy=Double.parseDouble(rs.getString("economyCost"));
 		Double business=Double.parseDouble(rs.getString("businessClassCost"));
 		Double firstclass=Double.parseDouble(rs.getString("firstClassCost"));
 		String dateofFlight=rs.getString("departureDate");
 		String timeofFlight=rs.getString("flightTime");
 		String flighttime=rs.getString("departureTime");
 		String returnDate=rs.getString("returnDate");
	 NumberFormat nf = NumberFormat.getCurrencyInstance();
	 String economyPrice= nf.format(economy);
	 String businessPrice=nf.format(business);
	 String firstclassPrice=nf.format(firstclass);
	 
 %>
 		
 		
 		<td><%=origin%> </td>
 		<td><%=destination%> </td>
 		<td><%=country%> </td>
 		<td><%=economyPrice%> </td>
 		<td>$<%=businessPrice%></td>
 		<td>$<%=firstclassPrice%></td>
 		<td><%=dateofFlight%></td>
 		<td><%=timeofFlight%></td>
 		<td><%=flighttime%> </td>
 		<td><%=returnDate%></td>
 		</tr>
	</table>
	<img src="<%=imagePath%>" />	
	<% 
 
 }
} catch(Exception e){
			out.println(e);
		} 
	%>
	</div>
<%@include file="footer.jsp" %>
</div>