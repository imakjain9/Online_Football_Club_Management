<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.lang.*" %>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.util.*"%>
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
    height:713px;
    float:right;
    background-color: black;
    color:white;
    font-size: 20px;
    font-family: "Comic Sans MS", cursive, sans-serif;
   
}

#content{
    font-family: "Comic Sans MS", cursive, sans-serif;font-size:18px;background-color: black;color: white;
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
<body style="overflow:hidden; background-color:black;">
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

<form action="UserController?id=addMatchDetails" method="post">
<div id="content">
<fieldset>
    <legend style="color:white;">Player Performance</legend>
<%
String[] selectedPlayers = request.getParameterValues("selectedPlayers");
if(selectedPlayers.length!=11)
    out.println("<script type='text/javascript'>    window.location.href='selectPlayers.jsp';  alert('select 11 players only') </script>   ");
try{
ArrayList<String> arrayList = new ArrayList<String>(Arrays.asList(selectedPlayers));
String matchdate=request.getParameter("matchdate"); 
String opponent=request.getParameter("opponent");
s.setAttribute("selectedPlayers",arrayList);
}catch(Exception e){
    out.println("<script type='text/javascript'>    window.location.href='manager.jsp';  alert('No Player selected') </script>   ");
}

for(int i = 0; i<selectedPlayers.length; i++)
{%>
    <!--<tr>
        <td><label class="control-label col-sm-3" style="color:white">Player Email:</label></td>
        <td><%out.println(selectedPlayers[i]);%></td>
        <td><label class="control-label col-sm-3" style="color:white">Enter Goals:</label></td>
        <td><input type="text" class="form-control col-sm-2" placeholder="Enter Goals" name="totalgoals" required></td>
        <td><label class="control-label col-sm-3" style="color:white">Enter Corner Goals:</label></td>
        <td><input type="text" class="form-control" placeholder="Enter Goals" name="cornergoals" required></td>
    </tr>-->
    <div class="form-group"> 
        <label class="control-label col-sm-1" style="color:white" for="mobile">Email:</label>
        <label class="control-label col-sm-2" style="color:white;" for="mobile"><%out.println(selectedPlayers[i]);%></label>
        <label style="color:white; text-align:right;" class="control-label col-sm-2" >Enter Goals:</label>
        <div  class="col-xs-2">
            <input type="number" class="form-control input-sm" placeholder="Enter Goals" name="totalgoals" required>
        </div>
        <label style="color:white; text-align:right;" class="control-label col-sm-3">Enter Corner Goals:</label>
        <div class="col-xs-2">
            <input type="number" class="form-control input-sm" placeholder="Enter Goals" name="cornergoals" required>
        </div> 
    </div>

    <div class="row" >
<div class="col-sm-12" style="background-color:black; height=3px;">
</div>
</div>

<%
}
%>
</legend>
</fieldset>
</div>
</div>
<div class="form-group"> 
    <div class="col-sm-6" style="padding-left:400px">
        <input type="submit" class="button" value="Submit"/>
        <input type="button" class="button" value="Cancel" />
    </div>
</div>
</form> 


<!-- Logout Page -->
<div id="panel2">
    <div id="nav" style="padding-top: 10px;">
        <ul>
            <li><a href="logout.jsp"> Logout </a></li>
        </ul>
    </div>
</div>






<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
<script src='js/bootstrap.js'></script>
</div>
</body>
</html>
