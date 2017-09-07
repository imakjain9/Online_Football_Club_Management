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
    height:713px;
    float:right;
    background-color: black;
    color:white;
    font-size: 20px;
    font-family: "Comic Sans MS", cursive, sans-serif;
   
}

#panel2 {
    left:90%;
    right:0%;
    display: none;
    width:10%;
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
<body style="overflow:hidden;">
<div class="container-fluid" >
    <div class="row" style="padding-top: 2%; height:80px; background-color:black;">
        <div class="col-sm-10" style="color:white; font-size: 30px; font-family: 'Comic Sans MS', cursive, sans-serif;"> Boca Football Club </div>
        <div style="text-align:right;" class="col-sm-2" id="flip2"><span class="glyphicon glyphicon-user"></span> <% out.println(username);%> </div>
    </div>

<div class="row" >
<div class="col-sm-12" style="background-color:white; height=2px;">
</div>
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
<% 

int matchid = 1;
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/boca","root","7827444741");  
Statement st= con.createStatement(); 
ResultSet rs1=st.executeQuery("SELECT * FROM matchdetails ORDER BY matchid DESC LIMIT 1"); 
if(!rs1.next()){
    matchid = 1;
}
else{
    ResultSet rs=st.executeQuery("SELECT * FROM matchdetails ORDER BY matchid DESC LIMIT 1"); 
    while(rs.next()){
        matchid = rs.getInt("matchid");
        matchid++;
    }
}
System.out.println("match id :"+matchid);
s.setAttribute("matchid",matchid);

%>

<!-- Registration Page -->
<div id="panel1">
<div style="margin-top:10px; margin-left:10px; margin-right:20px; background:black;">
<h2><center> Match Details</center></h2>
<form id="RegForm" role="form" class="form-horizontal" action="selectPlayers.jsp" method="post">
    
<fieldset>
    <legend style="color:white;">Add Match Details</legend>

    <div style="padding-left:250px;" class="form-group">
        <label class="control-label col-sm-3" style="color:white;">Enter Match Date:</label>
        <div class="col-sm-3">
            <input type="date" class="form-control" placeholder="Enter Date" name="matchdate" required>
        </div>
    </div>
    <div style="padding-left:250px;" class="form-group">
        <label class="control-label col-sm-3" style="color:white" >Opponent Name:</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="RegName" placeholder="Enter name" name="opponent" pattern="[a-zA-Z\s]+" title="Enter Alphabets Only" required>
        </div>
        <span class="col-sm-1" id="RegNameMsg" style="color:red;"></span>  
    </div>
    
    </fieldset>
    <br/>
    <div class="form-group">
        <div class="col-sm-offset-4 col-sm-8">
           <input type="submit" class="button" value="select Player"/>
           <input type="reset" class="button" value="Reset" />
        </div>
    </div>
    </div>
</div>
</div>
</form>
</div>
</div>


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
