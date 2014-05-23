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
				<li><a href="#">Enquiry</a>
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
			
			<div id="maincon">
			<h2>Type in your new password here:</h2>
			<form action="newPassword.jsp" method="post">
			<label>New Password:
			<input type="password" name="password">
			<input type="submit" value="Set Password" name="btnSubmit">
			</label>
			</form>
			</div>
	</div>
<%
try {
Class.forName("com.mysql.jdbc.Driver");
String connURL="jdbc:mysql://localhost/assignment?user=root&password=root"; 
Connection conn=DriverManager.getConnection(connURL);

String ID=request.getParameter("ID");
String password=request.getParameter("password");
String sqlStr="UPDATE admin set Password=? where function" + "like ?";
PreparedStatement pstmt=conn.prepareStatement(sqlStr);
pstmt.setString(1,password);
pstmt.setString(2,ID);
int rec=pstmt.executeUpdate();
if(rec==1)
{
	out.println("Your password has been reseted");
}
else {
	out.println("An error has occured, please try again");
}

}catch(Exception e) 
{
out.println("Please contact the administrator");	
}
%>	
	<label>
	
	</label>	
<%@include file="footer.jsp"%>
</body>
</html>