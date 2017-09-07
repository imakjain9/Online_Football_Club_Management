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
    $("#flip2").click(function(){
        $("#panel2").slideToggle("slow");
    });
});
</script>




<script type="text/javascript">
<!--
var image1=new Image()
image1.src="Images/cover.jpg"
var image2=new Image()
image2.src="Images/cover1.jpg"
var image3=new Image()
image3.src="Images/cover2.jpg"
//-->
</script>
<link href="main.css" rel="stylesheet" type="text/css" />
<link href='bootstrap-3.3.6-dist/css/bootstrap.css' rel='stylesheet'>
<style> 
#flip1 {
    text-align: right;
    background-color: black;
    color:white;
    font-family: "Comic Sans MS", cursive, sans-serif;
    padding-right: 0%;
}
#flip2 {
    text-align: left;
    background-color: black;
    color:white;
    font-size: 22px;
    font-family: "Comic Sans MS", cursive, sans-serif;
    padding-right: 0%;
}

#panel1{
    width:85%;
    float:right;
    background-color: black;
    color:white;
    font-size: 20px;
    font-family: "Comic Sans MS", cursive, sans-serif;
   
}

#content{
    font-family: "Comic Sans MS", cursive, sans-serif;font-size:12px;background-color: black;color: white;
    text-align: center;
}
#panel2 {
    left:87%;
    right:0%;
    display: none;
    width:13%;
    height:50px;
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
     username=(String)s.getAttribute("managerUsername");
}
else
    out.println("<script type='text/javascript'>    window.location.href='index.jsp'; alert('Login first to continue')  </script>"); 
%>   
<body style="overflow-x:hidden; overflow-y: scroll; background-color:black;">
<div class="container-fluid" >
    <div class="row" style="padding-top: 2%; height:80px; background-color:black;">
        <div class="col-sm-10" style="color:white; font-size: 30px; font-family: 'Comic Sans MS', cursive, sans-serif;"> Boca Football Club </div>
        <div style="text-align:right;" class="col-sm-2" id="flip2"><span class="glyphicon glyphicon-user"></span> <% out.println(username);%> </div>
    </div>
</div>

<div class="row" >
<div class="col-sm-12" style="background-color:white; height=2px;">
</div>
</div>


<div style="margin:0%; float:left; width:15%; height:800px; background-color:green; z-index:100px;">
    <div id="nav" style="padding-top: 20px;">
        <ul>
            <li><a href="manager.jsp"><span class="glyphicon glyphicon-home"></span> Home </a></li>
            <li><a href="matchDetails.jsp"><span class="glyphicon glyphicon-plus"></span> New Match</a></li>
            <li><a href="SalaryIncrement.jsp"><span class="glyphicon glyphicon-usd"></span> Payroll</a></li>
            <li><a href="deleteplayer.jsp"><span class="glyphicon glyphicon-remove"></span> Delete Player </a></li>
            <li><a href="showapparels.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> Apparels </a></li>
            <li><a href="claims.jsp"><span class="glyphicon glyphicon-flash"></span> Claims </a></li>
            <li><a href="Maintenance.jsp"><span class="glyphicon glyphicon-modal-window"></span> Maintenance </a></li>
            <li><a href="Reports.jsp"><span class="glyphicon glyphicon-file"></span> Reports </a></li>

        </ul>
    </div>
</div>


<div class="col-sm-10" style="color:white; background-color:black;">
<div style="text-align:center; font-family:'Comic Sans MS', cursive, sans-serif; ">
    <h4> Select Team </h4>
</div>

<form action="UserController?id=deleteplayer" method="post">
<div id="content">
    <table class="table">
        <thread>
        <tr>
            <td width="60px"> Username </td>
            <td width="150px"> Name </td>
            <td width="120px"> DOB </td>
            <td width="120px"> Experience </td>
            <td width="120px"> Mobile </td>
            <td width="120px"> City </td>
            <td width="120px"> State </td>
            <td width="120px"> Select player </td>
        </tr>
        </thread>
            <tbody>
<%

String matchdate=request.getParameter("matchdate"); 
String opponent=request.getParameter("opponent");
s.setAttribute("matchdate",matchdate);
s.setAttribute("opponent",opponent);

try{
System.out.println("working0000");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Boca","root","7827444741"); 
System.out.println("working here");
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from UserInfo");
System.out.println("working here");
if(!rs.next()){
            out.println("<script type='text/javascript'>    window.location.href='index.jsp';   alert('Sorry!!! you dont have any Player to select');    </script>   ");
}
else{
System.out.println("working here gefe");
    ResultSet rs1=st.executeQuery("select * from UserInfo");
    while(rs1.next())
    {
            out.println("<tr><td>"+rs1.getString("username")+"</td><td>"+rs1.getString("name")+"</td><td>"+rs1.getDate("dob")+"</td><td>"+rs1.getString("experience")+"</td><td>"+rs1.getLong("mobile")+"</td><td>"+rs1.getString("city")+"</td><td>"+rs1.getString("state")+"</td><td><input type='radio' name='selectedPlayer' value='"+rs1.getString("email")+"'/></td></tr>");
    }
} 
}catch(Exception e){
   // out.println("<script type='text/javascript'>    window.location.href='index.jsp';   alert('Sorry!!! you dont have any reservation yet');    </script>   ");
}
%>
        </tbody>
    </table>
</div>
</div>
<div class="form-group"> 
    <div class="col-sm-6" style="padding-left:400px">
        <input type="submit" class="button" value="Delete Player"/>
        <input type="button" class="button" window.location.href="manager.jsp" value="Cancel" />
    </div>
</div>
</form> 


<!-- Logout Page -->
<div id="panel2">
    <div id="nav" style="padding-top: 10px;">
        <ul>
            <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout </a></li>
        </ul>
    </div>
</div>






<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
<script src='js/bootstrap.js'></script>
</div>
</body>
</html>
