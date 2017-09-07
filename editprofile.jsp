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
       RMS
    </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script> 
$(document).ready(function(){
    $("#flip1").click(function(){
        $("#panel1").slideToggle("fast");
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



#panel2{
    width:85%;
	float:right;
    background-color: black;
    color:white;
    font-size: 20px;
    font-family: "Comic Sans MS", cursive, sans-serif;
   
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
<body style="background:black;overflow:hidden;">
<div class="container-fluid" >
    <div class="row" style="padding-top: 2%; height:80px; background-color:black;">
        <div class="col-sm-10" style="color:white; font-size: 30px; font-family: 'Comic Sans MS', cursive, sans-serif;"> Boca Football Club </div>
        <div  class="col-sm-2" id="flip1"><span class="glyphicon glyphicon-user"></span> <% out.println(username);%> </div>
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


<!-- Registration Page -->
<div id="panel2">
<div style="margin-top:10px; margin-left:10px; margin-right:20px; background:black;">
<h2><center> Update Profile</center></h2>
<form id="RegForm" role="form" class="form-horizontal" action="UserController?id=playerupdate"  method="post">
	
<fieldset>
      <legend style="color:white;">Player Details</legend>
    <div class="form-group">
        <label class="control-label col-sm-2" style="color:white;" for="email">Email:</label>
        <div class="col-sm-3">
            <label class="control-label col-sm-2" style="color:white;" ><%out.println(s.getAttribute("playerEmail"));%></label>
        </div>
        <span class="col-sm-1" id="RegEmailMsg" style="color:white;"></span>

        <label class="control-label col-sm-2" style="color:white;" >Username:</label>
        <div class="col-sm-3">
            <label class="control-label col-sm-2" style="color:white;" ><%out.println(s.getAttribute("playerUsername"));%></label>
        </div>
		 <span class="col-sm-1" id="RegEmailMsg" style="color:white;"></span>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2" style="color:white;" for="email">Password:</label>
        <div class="col-sm-3">
            <input type="password" class="form-control" placeholder="Enter Password" name="password" required>
        </div>
        <span class="col-sm-1" id="RegEmailMsg" style="color:white;"></span>
        <label class="control-label col-sm-2" style="color:white" for="name">Name:</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" placeholder="Enter name" name="name" pattern="[a-zA-Z\s]+" title="Enter Alphabets Only" required>
        </div>
        <span class="col-sm-1" id="RegNameMsg" style="color:red;"></span>  
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" style="color:white">Experience:</label>
        <div class="col-sm-3">
            <select type="text" class="form-control" name="experience">
            <option value="1 yrs."> 1 Yrs. </option>
            <option value="2 yrs."> 2 Yrs. </option>
            <option value="3 yrs."> 3 Yrs. </option>
            <option value="4 yrs."> 4 Yrs. </option>
            <option value="5 yrs."> 5 Yrs. </option>
            </select>
        </div>
        <span class="col-sm-1" id="RegNameMsg" style="color:red;"></span>
        <label class="control-label col-sm-2" style="color:white" for="mobile">DOB:</label>
        <div class="col-sm-3">
            <input type="date" class="form-control" placeholder="select DOB" name="DOB" required>
        </div> 
        <span class="col-sm-1" id="RegMblMsg" style="color:red;"></span> 
    </div>
    </fieldset>
    <br/>
    <fieldset>
      <legend style="color:white;">Contact Details</legend>
    
    <div class="form-group"> 
        <label class="control-label col-sm-2" style="color:white" for="mobile">Mobile:</label>
        <div class="col-sm-3">
            <input type="number" class="form-control" id="RegMbl" placeholder="Enter Mobile" name="mobile" required>
        </div>
        <span class="col-sm-1" id="RegMblMsg" style="color:red;"></span> 
        <label class="control-label col-sm-2" style="color:white">Player Type:</label>
        <div class="col-sm-3">
            <select type="text" class="form-control" name="playertype" required>
            <option value=""> Choose Player type </option>
            <option value="goalKeeper"> Goal Keeper </option>
            <option value="Defender"> Defender </option>
            <option value="Midfielder"> Midfielder </option>
            <option value="Forward"> Forward </option>
            </select>
        </div> 
    </div> 

    <div class="form-group"> 
        <label class="control-label col-sm-2" style="color:white">City:</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" placeholder="Enter City" name="city" pattern="[a-zA-Z\s]+" title="Enter Alphabets Only" required>
        </div>
        <span class="col-sm-1" id="RegMblMsg" style="color:red;"></span> 
        <label class="control-label col-sm-2" style="color:white">State:</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" placeholder="Enter State" name="state" pattern="[a-zA-Z\s]+" title="Enter Alphabets Only" required>
        </div>
        <span class="col-sm-1" id="RegMblMsg" style="color:red;"></span> 
    </div> 
    </fieldset>
    <br/>
    <div class="form-group">
        <div class="col-sm-offset-5 col-sm-7">
           <input type="submit" class="button" value="Update Profile"/>
           <input type="reset" class="button" value="Reset" />
        </div>
    </div>
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
