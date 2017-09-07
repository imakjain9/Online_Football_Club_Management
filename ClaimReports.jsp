<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.lang.*" %>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.*"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>
      Boca
    </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script> 
$(document).ready(function(){
    $("#flip1").click(function(){
        $("#panel1").slideToggle("slow");
    });
});
</script>

<link href="main.css" rel="stylesheet" type="text/css" />
<link href='bootstrap-3.3.6-dist/css/bootstrap.css' rel='stylesheet'>
<style> 

#flip1 {
    text-align: center;
    background-color: black;
    color:white;
    font-size: 22px;
    font-family: "Comic Sans MS", cursive, sans-serif;
    padding-right: 0%;
}

#panel2{
    width:85%;
    float:right;
    background-color: black;
    color:white;
    font-size: 18px;
    font-family: "Comic Sans MS", cursive, sans-serif;
   
}
#result{
    font-family: "Comic Sans MS", cursive, sans-serif;font-size:20px;background-color:black;color:white;
    text-align: left;
}

#panel1 {
    left:87%;
    right:0%;
    display: none;
    width:13%;
    height:80px;
    z-index:10;
    position:absolute;
    background-color: #4CAF50;
    border: 1px solid white;
    text-align: center;
}

</style>

</head>
<% HttpSession s = request.getSession(false);
String username = "";
if(s!=null){
     username=(String)s.getAttribute("playerUsername");
}
else
    out.println("<script type='text/javascript'>    window.location.href='index.jsp'; alert('Login first to continue')  </script>"); 
%>   
<body style="overflow-y: scroll;background:black;">
<div class="container-fluid" >
    <div class="row" style="padding-top: 2%; height:80px; background-color:black;">
        <div class="col-sm-10" style="color:white; font-size: 30px; font-family: 'Comic Sans MS', cursive, sans-serif;"> Boca Football Club </div>
        <div style="text-align:center" class="col-sm-2" id="flip1"><span class="glyphicon glyphicon-user"></span> <% out.println(username);%> </div>
    </div>

<div class="row" >
<div class="col-sm-12" style="background-color:white; height=2px;">
</div>
</div>
</div>

<div style="margin:0%; float:left; width:15%; height:616px; background-color:green; z-index:100px;">
    <div id="nav" style="padding-top: 20px;">
        <ul>
            <li><a href="player.jsp"><span class="glyphicon glyphicon-home"></span> Home </a></li>
            <li><a href="BuyApparels.jsp"><span class=" glyphicon glyphicon-shopping-cart"></span> Buy Apparels</a></li>
            <li><a href="CheckPayroll.jsp"><span class="glyphicon glyphicon-eye-open"></span> Check Payroll</a></li>
            <li><a href="NewClaims.jsp"><span class="glyphicon glyphicon-flash"></span> New Claims </a></li>
            <li><a href="ClaimReports.jsp"><span class="glyphicon glyphicon-file"></span> Claim Reports </a></li>
        </ul>
    </div>
</div>


<div id="panel2">
<div style="margin-top:10px; margin-left:10px; margin-right:20px; background:black;">
<h2><center>Claim Report</center></h2><br/> 
    <table class="table">
        <thread>
        <tr>
            <td width="100px"> Claim Id </td>
            <td width="120px"> Player Email </td>
            <td width="120px"> Claim Date </td>
            <td width="120px"> Claim Type </td>
            <td width="120px"> Claim Amount </td>
            <td width="140px"> Status </td>
            <td width="220px"> Remarks </td>
        </tr>
        </thread>
            <tbody>
<% 
try{
String email = (String)s.getAttribute("playerEmail");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Boca","root","7827444741"); 
Statement st= con.createStatement(); 
ResultSet rs1=st.executeQuery("select * from claims where playeremail='"+email+"'");
if(!rs1.next()){
    out.println("<div style='color:white; text-align:center;'> Players has no claims yet</div>");
}
ResultSet rs=st.executeQuery("select * from claims where playeremail='"+email+"'");
while(rs.next()){ System.out.println("inwedewdedfewdf");
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
    
<%
}
}catch(Exception e){
    System.out.println(e);
}

%>
</table>

<div class="form-group">
    <div class="col-sm-offset-5 col-sm-7">
        <input type="submit" class="button" value="Print" onclick="window.print()"/>
    </div>
</div>

</form>
</div>
</div>

 


<!-- Logout Page -->
<div id="panel1">
    <div id="nav" style="padding-top: 10px;">
        <ul>
            <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout </a></li>
            <li><a href="editprofile.jsp"><span class="glyphicon glyphicon-log-out"></span> Edit Profile </a></li>
        </ul>
    </div>
</div>





<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
<script src='js/bootstrap.js'></script>
</div>
</body>
</html>
















