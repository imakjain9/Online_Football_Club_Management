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
    text-align: center;
    background-color: black;
    color:white;
    font-size: 22px;
    font-family: "Comic Sans MS", cursive, sans-serif;
    padding-right: 0%;

}

#panel1 {
    left:15%;
    right:0%;
    display: none;
    width:85%;
    height:713px;
    position:absolute;
    z-index:10;
    background-color: black;
    color:white;
    font-size: 20px;
    font-family: "Comic Sans MS", cursive, sans-serif;
    border: 1px solid white;
}

</style>

</head>
<body style="overflow:hidden;">
<div class="container-fluid" >
    <div class="row" style="padding-top: 2%; height:80px; background-color:black;">
        <div class="col-sm-10" style="color:white; font-size: 30px; font-family: 'Comic Sans MS', cursive, sans-serif;"> Boca Football Club </div>
        <div class="col-sm-2" id="flip1"><span class="glyphicon glyphicon-log-in"></span> Login</div>
    </div>
<%
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741"); 
Statement st= con.createStatement();  
%>

<div class="row" >
<div class="col-sm-12" style="background-color:white; height=2px;">
</div>
</div>
</div>

<!-- Login Page -->
<div id="panel1">
<div style="margin-top:50px; margin-left:150px; margin-right:20px; background:black;">
<p> Please Login.....</p>
<form role="form" class="form-horizontal" action="UserController?id=login" method="post">
    <div class="form-group">
        <label class="control-label col-sm-2" style="color:white" for="email">Usertype:</label>
        <div class="col-sm-4">
            <select type="email" class="form-control" id="email" placeholder="Enter email" name="usertype">
                <option value="player" setselected="true"> Player </option>
                <option value="manager"> Manager </option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" style="color:white" for="email">Email:</label>
        <div class="col-sm-4">
            <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" required>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" style="color:white" for="pwd">Password:</label>
        <div class="col-sm-4">
            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="password" required>
        </div>
    </div>
    <div class="form-group"> 
        <div class="col-sm-offset-2 col-sm-10">
           <input type="submit" class="button" value="Login"/>
           <input type="reset" class="button" value="Reset" />
        </div>
    </div> 
    <p ><a style="font-size:16px; padding-left:170px; text-decoration:none;color:white;" href="forgotpassword.jsp">forgot Password?</a></p>
</div>
</div>

<div style="margin:0%; float:left; width:15%; height:750px; background-color:green; z-index:100px;">
    <div id="nav" style="padding-top: 20px;">
        <ul>
            <li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span> Home </a></li>
            <li><a href="about.html"><span class="glyphicon glyphicon-file"></span> About</a></li>
            <li><a href="FAQ.html"><span class="glyphicon glyphicon-edit"></span> FAQ </a></li>
            <li><a href="T&C.html"><span class="glyphicon glyphicon-edit"></span> T&C </a></li>
            <li><a href="contact.html"><span class="glyphicon glyphicon-phone"></span> ContactUs </a></li>
        </ul>
    </div>
</div>

<div>
    <img src="Images/cover1.jpg" name="slide" width="85%" height="713px">
</div>
<script>
var step=1
function slideit(){
if (!document.images)
return
document.images.slide.src=eval("image"+step+".src")
if (step<3)
step++
else
step=1
setTimeout("slideit()",1500)
}
slideit()
</script>


<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
<script src='js/bootstrap.js'></script>
</div>
</body>
</html>
