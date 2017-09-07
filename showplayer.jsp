<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.lang.*" %>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.*"%>
<%@ page session="false" %>
<html>
<head>
	<link href="main.css" rel="stylesheet" type="text/css" />
	<link href='bootstrap-3.3.6-dist/css/bootstrap.css' rel='stylesheet'>
</head>
<body>
<% 
String selectedplayer = request.getParameter("id");
try{
System.out.println(selectedplayer);
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Boca","root","7827444741"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from playerbonus where email='"+selectedplayer+"'");
while(rs.next()){ 
out.println("<table><tr><td style='padding-left:380px;'>No of Match </td><td style='padding-left:20px'>:</td><td style='padding-left:20px'>"+rs.getInt("numofmatch")+"</td></tr><tr><td style='padding-left:380px;'>Match Bonus </td><td style='padding-left:20px'>:</td><td style='padding-left:20px'>"+rs.getInt("matchPlayingBonus")+"</td></tr><tr><td style='padding-left:380px;'>Goal Bonus</td><td style='padding-left:20px'>:</td><td style='padding-left:20px'>"+rs.getInt("goalbonus")+"</td></tr><tr><td style='padding-left:380px;'>Corner Bonus</td><td style='padding-left:20px'>:</td><td style='padding-left:20px'>"+rs.getInt("cornergoalbonus")+"</td></tr><tr><td style='padding-left:380px;'>Total Bonus</td><td style='padding-left:20px'>:</td><td style='padding-left:20px'>"+rs.getInt("totalbonus")+"</td></tr></table>");
}
}catch(Exception e){
	e.printStackTrace();
}

%>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
<script src='js/bootstrap.js'></script>
</body>
</html>
