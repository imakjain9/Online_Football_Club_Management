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
ResultSet rs1=st.executeQuery("select * from claims where playeremail='"+selectedplayer+"' AND claimstatus = 'requested'");
if(!rs1.next())
    out.println("<div style='color:white;text-align:center;'> Players has no claims yet</div>");
ResultSet rs=st.executeQuery("select * from claims where playeremail='"+selectedplayer+"' AND claimstatus = 'requested'");
while(rs.next()){ 
%>
	<div style="padding-left:250px;" class="form-group"> 
        <label class="control-label col-sm-3" style="color:white">Claim Id:</label>
        <div class="col-sm-3">
            <%="<input type='text' class='form-control' value='"+rs.getInt("claimid")+"' name='claimId' readonly>"%>
        </div>
    </div>
    <div style="padding-left:250px;" class="form-group"> 
        <label class="control-label col-sm-3" style="color:white">Claim Date:</label>
        <div class="col-sm-3">
            <%="<input type='text' class='form-control' value='"+rs.getDate("claimdate")+"' readonly>"%>
        </div>
    </div>
    <div style="padding-left:250px;" class="form-group"> 
        <label class="control-label col-sm-3" style="color:white">Claim Type:</label>
        <div class="col-sm-3">
            <%="<input type='text' class='form-control' value='"+rs.getString("claimtype")+"' name='claimtype' readonly>"%>
        </div>
    </div>
    <div style="padding-left:250px;" class="form-group"> 
        <label class="control-label col-sm-3" style="color:white">Claim Amount:</label>
        <div class="col-sm-3">
            <%="<input type='text' class='form-control' value='"+rs.getInt("claimamount")+"' name='claimamount' readonly>"%>
        </div>
    </div>
    <div style="padding-left:250px;" class="form-group"> 
        <label class="control-label col-sm-3" style="color:white">Remarks:</label>
        <div class="col-sm-3">
            <%="<input type='text' class='form-control' name='claimremarks' required>"%>
        </div>
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
