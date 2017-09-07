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

<div id="panel1">
<div style="margin-top:10px; margin-left:10px; margin-right:20px; background:black;">
<h2><center> Maintenance</center></h2><br/>
<form id="SalInc" role="form" class="form-horizontal" action="UserController?id=maintenance" onsubmit="return validateForm()" method="post">
    
<fieldset>
    <legend style="color:white;">Maintenance</legend>

    <div style="padding-left:200px;" class="form-group">
        <label class="control-label col-sm-4" style="color:white;">Maintenance Type:</label>
        <div class="col-sm-4">
            <select id="mySelect" type="text" class="form-control" name="maintenancetype" required>
                <option setselected="true" value="">Choose Maintenance Type</option>
                <option value="Grassing">Grassing</option>
                <option value="Sprinklers">Sprinklers</option>
                <option value="Lights">Lights</option>
                <option value="Seats">Seats</option>
            </select>
        </div>
    </div>
    <div style="padding-left:200px;" class="form-group">
        <label class="control-label col-sm-4" style="color:white;" >Maintenance Date:</label>
        <div class="col-sm-4">
            <input type="Date" class="form-control" placeholder="Enter Date" name="maintenancedate" required>
        </div>
    </div>
    <div style="padding-left:200px;" class="form-group">
        <label class="control-label col-sm-4" style="color:white;">Maintenance Expense:</label>
        <div class="col-sm-4">
            <input type="number" class="form-control" placeholder="Enter Expense" name="maintenanceexpense" required>
        </div>
    </div>
    <div style="padding-left:200px;" class="form-group">
        <label class="control-label col-sm-4" style="color:white;">Maintenance Provider:</label>
        <div class="col-sm-4">
            <select id="mySelect" type="text" class="form-control" name="maintenanceprovider" required>
                <option setselected="true" value="">Choose Maintenance Provider</option>
                <option value="EMC Maintenance">EMC Maintenance</option>
                <option value="GSE Maintenance">GSE Maintenance</option>
                <option value="Heritage India">Heritage India</option>
                <option value="Green Planet Nursery">Green Planet Nursery</option>
            </select>
        </div>
    </div>
</fieldset>
<br/>

<div class="form-group">
    <div class="col-sm-offset-4 col-sm-8">
        <input type="submit" class="button" value="Submit"/>
        <input type="reset" class="button" value="Reset" />
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
