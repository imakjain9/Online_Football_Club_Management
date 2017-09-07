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
try{
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Boca","root","7827444741"); 
Statement st= con.createStatement(); 
String reporttype = request.getParameter("id");



if(reporttype.equals("showplayers"))
{
System.out.println(true);
ResultSet rs1=st.executeQuery("select * from UserInfo");
if(!rs1.next())
    out.println("<div style='color:white;text-align:center;'> Club has no player</div>");
ResultSet rs=st.executeQuery("select * from UserInfo");
%>
<div style="color:white; font-size:14px;">
<table class="table">
        <thread>
        <tr>
            <td width="100px"> Email </td>
            <td width="120px"> Name </td>
            <td width="120px"> DOB </td>
            <td width="120px"> Experience </td>
            <td width="120px"> Mobile </td>
            <td width="140px"> Player Type </td>
            <td width="100px"> City </td>
            <td width="120px"> State </td>
        </tr>
        </thread>
            <tbody>
<%
while(rs.next()){ System.out.println("inwedewdedfewdf");
%>
        <tr>
            <td><%=rs.getString("email")%></td>
            <td><%=rs.getString("name")%></td>
            <td><%=rs.getDate("dob")%></td>
            <td><%=rs.getString("experience")%></td>
            <td><%=rs.getLong("mobile")%></td>
            <td><%=rs.getString("playertype")%></td>
            <td><%=rs.getString("city")%></td>
            <td><%=rs.getString("state")%></td>
        </tr>
<%}%>
    </table>
</div>
<%
}



else if(reporttype.equals("playerspayroll"))
{
System.out.println(true);
System.out.println("hell");
ResultSet rs1=st.executeQuery("select * from UserInfo");
if(!rs1.next())
    out.println("<div style='color:white;text-align:center;'> Players has no claims yet</div>");
ResultSet rs=st.executeQuery("select * from playerbonus");
%>
<div style="color:white; font-size:14px;">
<table class="table">
        <thread>
        <tr>
            <td width="100px"> Email </td>
            <td width="120px"> Match Bonus </td>
            <td width="120px"> Goal Bonus </td>
            <td width="120px"> Corner Goal Bonus </td>
            <td width="120px"> Salary Increment </td>
            <td width="140px"> Salary </td>
        </tr>
        </thread>
            <tbody>
<%
while(rs.next()){ System.out.println("inwedewdedfewdf");
%>
        <tr>
            <td><%=rs.getString("email")%></td>
            <td><%=rs.getInt("matchPlayingBonus")%></td>
            <td><%=rs.getInt("goalbonus")%></td>
            <td><%=rs.getInt("cornergoalbonus")%></td>
            <td><%=rs.getInt("increment")%></td>
            <td><%=rs.getInt("salary")%></td>
        </tr>
<%}%>
    </table>
</div>
<%
}


else if(reporttype.equals("Claims"))
{

System.out.println(true);
ResultSet rs1=st.executeQuery("select * from claims");
if(!rs1.next())
    out.println("<div style='color:white;font-size:14px;'> Players has no claims yet!!</div>");
ResultSet rs=st.executeQuery("select * from claims");
%>
<div style="color:white; font-size:14px;">
<table class="table">
        <thread>
        <tr>
            <td width="100px"> Claim Id </td>
            <td width="120px"> Player Email </td>
            <td width="120px"> Claim Date </td>
            <td width="120px"> Claim Type </td>
            <td width="120px"> Claim Amount </td>
            <td width="140px"> Status </td>
            <td width="200px"> Remarks </td>
        </tr>
        </thread>
            <tbody>
<%
while(rs.next()){ System.out.println("inwedewdedfewdf");
System.out.println(true);
System.out.println("hell");
%>
        <tr>
            <td><%=rs.getInt("claimid")%></td>
            <td><%=rs.getString("playeremail")%></td>
            <td><%=rs.getDate("claimdate")%></td>
            <td><%=rs.getString("claimtype")%></td>
            <td><%=rs.getInt("claimamount")%></td>
            <td><%=rs.getString("claimstatus")%></td>
            <td><%=rs.getString("remarks")%></td>
        </tr>
<%}%>
    </table>
</div>
<%
}


else if(reporttype.equals("apparels"))
{
System.out.println(true);
ResultSet rs1=st.executeQuery("select * from sportApparels");
if(!rs1.next())
    out.println("<div style='color:white;font-size:14px;'> Players has no apparels request!!</div>");
ResultSet rs=st.executeQuery("select * from sportApparels");
%>
<div style="color:white; font-size:14px;">
<table class="table">
        <thread>
        <tr>
            <td width="100px"> Order Id </td>
            <td width="120px"> Player Email </td>
            <td width="120px"> Product Name </td>
            <td width="120px"> Quantity </td>
            <td width="120px"> Date </td>
            <td width="140px"> Status </td>
        </tr>
        </thread>
            <tbody>
<%
while(rs.next()){ System.out.println("inwedewdedfewdf");
%>
        <tr>
            <td><%=rs.getInt("orderid")%></td>
            <td><%=rs.getString("email")%></td>
            <td><%=rs.getString("productname")%></td>
            <td><%=rs.getInt("quantity")%></td>
            <td><%=rs.getDate("requestdate")%></td>
            <td><%=rs.getString("status")%></td>
        </tr>
<%}%>
    </table>
</div>
<%
}






}catch(Exception e){
	e.printStackTrace();
}

%>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
<script src='js/bootstrap.js'></script>
</body>
</html>
