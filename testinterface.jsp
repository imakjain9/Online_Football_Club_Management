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
<script language = "javascript">
var xmlhttp;
function PostRequest(strurl){
    if(window.XMLHttpRequest)
        xmlhttp=new XMLHttpRequest();
    else if(window.ActiveXObject)
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    xmlhttp.open("POST",strurl,true);
    xmlhttp.setRequestHeader("content-type","application/x-www-form-urlencoded");
    xmlhttp.onreadystatechange=function(){
        if(xmlhttp.readyState==4 && xmlhttp.status == 200)
            document.getElementById("result").innerHTML=xmlhttp.responseText;
    }
    xmlhttp.send(strurl);
}
function callAjax(){

    var id=document.getElementById("mySelect").value;
    var url="showreports.jsp?id="+id+"";
    PostRequest(url);   
}
</script>

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
    padding:0px 20px;
   
}
#result{
    font-family: "Comic Sans MS", cursive, sans-serif;font-size:20px;background-color: black;color:white;
    text-align: left;
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
<body style="overflow:hidden; background-color:black;">
<div class="container-fluid" >
    <div class="row" style="padding-top: 2%; height:80px; background-color:black;">
        <div class="col-sm-10" style="color:white; font-size: 30px; font-family: 'Comic Sans MS', cursive, sans-serif;"> Boca Football Club </div>
        <div style="text-align:right;" class="col-sm-2" id="flip2"><span class="glyphicon glyphicon-user">abc</div>
    </div>

<div class="row" >
<div class="col-sm-12" style="background-color:white; height=2px;">
</div>
</div>
</div>

<div style="margin:0%; float:left; width:15%; height:1000px; background-color:green; z-index:100px;">
    <div id="nav" style="padding-top: 20px;">
        <ul>
            <li><a href="manager.jsp"><span class="glyphicon glyphicon-home"></span> Home </a></li>
            <li><a href="matchDetails.jsp"><span class="glyphicon glyphicon-plus"></span> New Match</a></li>
            <li><a href="SalaryIncrement.jsp"><span class="glyphicon glyphicon-usd"></span> Payroll</a></li>
            <li><a href="showapparels.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> Apparels </a></li>
            <li><a href="claims.jsp"><span class="glyphicon glyphicon-flash"></span> Claims </a></li>
            <li><a href="Maintenance.jsp"><span class="glyphicon glyphicon-modal-window"></span> Maintenance </a></li>
            <li><a href="Reports.jsp"><span class="glyphicon glyphicon-file"></span> Reports </a></li>

        </ul>
    </div>
</div>
<div id="panel1">
<h4><center>Reports</center></h4>
<div style="padding-left:250px;" class="form-group">
    <div style="color:white;text-align:right;font-size:18px;" class="control-label col-sm-4" >Select Report type:</div>
    <div class="col-sm-4">
    <select id="mySelect" class="form-control" name="reporttype" onchange="callAjax()" required>
        <option setselected="true" value="">Choose Report</option>
        <option value="showplayers">Show Players</option>
        <option value="playerspayroll">Players Payroll</option>
        <option value="apparels">Apparels</option>
        <option values="claims">Claims</option>
    </select>
    </div>
</div>

<br/>
<br/>

<div id="result"></div>
</div>

<!-- Logout Page -->
<div id="panel2">
    <div id="nav" style="padding-top: 10px;">
        <ul>
            <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout </a></li>
        </ul>
    </div>
</div>

<div class="footer fixed-bottom">
<h2>This is footer. </h2>
</div>


<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
<script src='js/bootstrap.js'></script>
</div>
</body>
</html>
