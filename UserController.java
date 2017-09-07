package my;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;
import java.sql.*;
import java.text.*;
import java.lang.*;
public class UserController extends HttpServlet
{
	public void doPost(HttpServletRequest request ,HttpServletResponse response) throws IOException,ServletException
	{
		try{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		out.println("<html><body>");
		HttpSession session = request.getSession(false);
		ServletContext context=getServletContext(); 

		String id = request.getParameter("id");


		//************************************************ Player registration ***********************************************//
		if(id.equals("playerRegister"))
		{
			String email=request.getParameter("email"); 
			String username=request.getParameter("username"); 
			String password=request.getParameter("password"); 
			String name=request.getParameter("name"); 
			String experience=request.getParameter("experience");
			String dob=request.getParameter("DOB");
			long mobile=Long.parseLong(request.getParameter("mobile")); 
			String playertype=request.getParameter("playertype");
			String city=request.getParameter("city");
			String state=request.getParameter("state");
			Class.forName("com.mysql.jdbc.Driver"); 
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Boca","root","7827444741"); 
			Statement st= con.createStatement(); 
			ResultSet rs=st.executeQuery("select * from UserInfo where email='"+email+"'"); 
			if(rs.next()) {	 
					out.println("<script type='text/javascript'>	window.location.href='manager.jsp';	alert('Email Already Exists');</script>	");
				}
				else{ 
					st.executeUpdate("insert into UserInfo (email,username,password,name,experience,dob,mobile,playertype,city,state) values ('"+email+"','"+username+"','"+password+"','"+name+"','"+experience+"','"+dob+"','"+mobile+"','"+playertype+"','"+city+"','"+state+"')");
					st.executeUpdate("insert into playerbonus values ('"+email+"',0,0,0,0,0,0,5000)");
					out.println("<script type='text/javascript'>	window.location.href='manager.jsp';	alert('Player has been added successfully');	</script>	");	
				}
		}



		//************************************************** Add Match Details*******************************************
		if(id.equals("addMatchDetails"))
		{
			ArrayList<String> selectedPlayers = (ArrayList<String>)session.getAttribute("selectedPlayers");
			String[] totalGoals=request.getParameterValues("totalgoals"); 
			String[] cornerGoals=request.getParameterValues("cornergoals"); 
			System.out.println(selectedPlayers.get(1));


			int matchid=(Integer)session.getAttribute("matchid");
			String matchdate=(String)session.getAttribute("matchdate");
			String opponent=(String)session.getAttribute("opponent");
			System.out.println("working here now");
			System.out.println(matchid);
			
			
			Class.forName("com.mysql.jdbc.Driver"); 
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Boca","root","7827444741");  
			Statement st= con.createStatement(); 
			st.executeUpdate("insert into matchdetails (matchid,matchdate,opponent) values ('"+matchid+"','"+matchdate+"','"+opponent+"')");
			System.out.println("cwfnwfn");
			for(int i=0;i<totalGoals.length;i++)
			{
				System.out.println("totalgoals"+totalGoals[i]);
				System.out.println("totalgoals"+cornerGoals[i]);
				System.out.println("totalgoals"+selectedPlayers.get(i));
				st.executeUpdate("insert into playerPerformance(matchid,playerEmail,totalgoals,cornergoals) values ('"+matchid+"','"+selectedPlayers.get(i)+"','"+totalGoals[i]+"','"+cornerGoals[i]+"')");	
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("UserController?id=addPlayerBonus");
			dispatcher.forward(request,response);

			System.out.println("done");
			
		}


		//********************************************Salary Increments **********************************************************
		if(id.equals("salaryincrement"))
		{
			int totalbonus = 0;
			int salary = 0;
			int basesalary = 0;
			int increment = 0;
			String playeremail = request.getParameter("playeremail");
			
			Class.forName("com.mysql.jdbc.Driver"); 
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Boca","root","7827444741");  
			Statement st= con.createStatement(); 
			ResultSet rs = st.executeQuery("select * from playerbonus where email = '"+playeremail+"'");
			while(rs.next())
			{
				System.out.println("incremented");
				totalbonus = rs.getInt("totalbonus");
				salary = rs.getInt("salary");
			}
			if(totalbonus>500){
				increment = 30000 - salary;
				salary = 30000;
			}
			else if(totalbonus>400){
				increment = 25000 - salary;
				salary = 25000;
			}
			else if(totalbonus>300){
				increment = 20000 - salary;
				salary = 20000;
			}
			else if(totalbonus>200){
				increment = 15000 - salary;
				salary = 15000;
			}
			else if(totalbonus>100){
				increment = 15000 - salary;
				salary = 15000;
			}
			st.executeUpdate("update playerbonus set salary ='"+salary+"', increment='"+increment+"'  where email='"+playeremail+"'");

			System.out.println("incremented Suceessfully");
			out.println("<script type='text/javascript'>	window.location.href='manager.jsp';	alert('Salary Incremented Suceessfully');</script>	");
			
		}


		//*******************************************buy products *******************************************************
		if(id.equals("buyProducts"))
		{
			
				System.out.println("bought");
				String[] orderid = request.getParameterValues("selectedRequests");
				Class.forName("com.mysql.jdbc.Driver"); 
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Boca","root","7827444741");  
				Statement st= con.createStatement(); 
				for(int i=0; i<orderid.length;i++)
				{
					st.executeUpdate("update sportApparels set status = 'Delivered' where orderid='"+Integer.parseInt(orderid[i])+"'");
				}
				out.println("<script type='text/javascript'>	window.location.href='manager.jsp';	alert('Products Delivered Successfully');</script>	");
			
			System.out.println("bought Successfully");
		}



		if(id.equals("deleteplayer"))
		{
			
				String selectedPlayer = request.getParameter("selectedPlayer");
				System.out.println(selectedPlayer);
				Class.forName("com.mysql.jdbc.Driver"); 
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Boca","root","7827444741");  
				Statement st= con.createStatement(); 
				st.executeUpdate("delete from playerbonus where email = '"+selectedPlayer+"'");
				st.executeUpdate("delete from UserInfo where email = '"+selectedPlayer+"'");
				out.println("<script type='text/javascript'>	window.location.href='manager.jsp';	alert('profile deleted successfully');</script>	");
			
			System.out.println("bought Successfully");
		}



		//**************************************************add player bonus***********************************************
		if(id.equals("addPlayerBonus"))
		{
			ArrayList<String> selectedPlayers = (ArrayList<String>)session.getAttribute("selectedPlayers");
			String[] totalGoals=request.getParameterValues("totalgoals");
			String[] cornerGoals=request.getParameterValues("cornergoals"); 
			//int matchid=(Integer)session.getAttribute("matchid");
			System.out.println("reached in player bonus");
			int totalbonus = 0, matchplayingbonus = 5, goalbonus = 0, cornergoalbonus = 0;
			int matchid=(Integer)session.getAttribute("matchid");

	
			Class.forName("com.mysql.jdbc.Driver"); 
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Boca","root","7827444741");  
			Statement st= con.createStatement(); 
			for(int i= 0; i<totalGoals.length;i++)
			{
				goalbonus = Integer.parseInt(totalGoals[i]) * 5;
				cornergoalbonus = Integer.parseInt(cornerGoals[i]) * 10;
				totalbonus = goalbonus+cornergoalbonus+matchplayingbonus;
				System.out.println(totalbonus);
				st.executeUpdate("update playerbonus set numofmatch = numofmatch + 1, matchPlayingBonus = matchPlayingBonus + 5, goalbonus = goalbonus + '"+goalbonus+"', cornergoalbonus = cornergoalbonus + '"+cornergoalbonus+"', totalbonus = totalbonus + '"+totalbonus+"' where email = '"+selectedPlayers.get(i)+"'");
			} 
			out.println("<script type='text/javascript'>	window.location.href='manager.jsp';	alert('Record Added successfully');</script>	");
		}



		//**********************************************************manage claims ************************************************
		if(id.equals("manageclaims"))
		{
			
				int claimId = Integer.parseInt(request.getParameter("claimId"));
				String claimtype = request.getParameter("claimtype");
				String playeremail = request.getParameter("playeremail");
				String remarks = request.getParameter("claimremarks");
				int claimamount = Integer.parseInt(request.getParameter("claimamount"));
				boolean check= false;
				if(claimtype.equals("TA") && claimamount<=100)
					check = true;
				else if(claimtype.equals("DA") && claimamount<=500)
					check = true;
				Class.forName("com.mysql.jdbc.Driver"); 
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Boca","root","7827444741");  
				Statement st= con.createStatement();
				if(check){
					st.executeUpdate("update claims set remarks = '"+remarks+"' where claimid = '"+claimId+"'");
					st.executeUpdate("update claims set claimstatus = 'Approved' where claimid = '"+claimId+"'");
					st.executeUpdate("update playerbonus set salary =salary + "+claimamount+"' where email='"+playeremail+"'");
					out.println("<script type='text/javascript'>	window.location.href='manager.jsp';	alert('Claim has been approved');</script>	");
				}
				else{
					st.executeUpdate("update claims set remarks = '"+remarks+"' where claimid = '"+claimId+"'");
					st.executeUpdate("update claims set claimstatus = 'Rejected' where claimid = '"+claimId+"'");
					out.println("<script type='text/javascript'>	window.location.href='manager.jsp';	alert('Claims conditions are not satisfying!! hence claim cannot be approved');</script>	");
				}
			
			}







		//************************************************ Login ****************************************************
		if(id.equals("login"))
		{
			String usertype=request.getParameter("usertype");
			
			String email=request.getParameter("email");  
			
			String password=request.getParameter("password");
			
			if(usertype.equals("player"))
			{
				
				Class.forName("com.mysql.jdbc.Driver"); 
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Boca","root","7827444741"); 
				Statement st= con.createStatement(); 
				ResultSet rs=st.executeQuery("select * from UserInfo where email='"+email+"' AND password='"+password+"'"); 
				if(rs.next()) 
				{ 
					HttpSession s = request.getSession();
					out.println("<script type='text/javascript'>	window.location.href='player.jsp';	</script>	");
					s.setAttribute("playerEmail",email);
					s.setAttribute("playerUsername",rs.getString("username"));
				}
				else 
				{ 
					out.println("<script type='text/javascript'>	window.location.href='index.jsp'; alert('Login Failed Incorrect password')	</script>");	
				}
				
			}
			else if(usertype.equals("manager"))
			{
				System.out.println("1");
				if(email.equals("abhi@gmail.com") && password.equals("12345"))
				{
					HttpSession s = request.getSession();
					out.println("<script type='text/javascript'>	window.location.href='manager.jsp';	</script>	");
					s.setAttribute("managerEmail",email);
					s.setAttribute("managerUsername","Abhishek");
				}
				else 
				{ 
					out.println("<script type='text/javascript'>	window.location.href='index.jsp'; alert('Login Failed Incorrect password')	</script>");	
				}
			}
		}



		//********************************************* Update Password*******************************************************
		if(id.equals("updatepassword"))
		{
			
				String email = request.getParameter("email");
				String newpassword = request.getParameter("newpassword");
				String confirmpassword = request.getParameter("confirmpassword");

				Class.forName("com.mysql.jdbc.Driver"); 
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Boca","root","7827444741"); 
				Statement st= con.createStatement(); 
				ResultSet rs=st.executeQuery("select * from UserInfo where email='"+email+"'"); 
				if(!rs.next()) 
					out.println("<script type='text/javascript'>	window.location.href='forgotpassword.jsp';	alert('Wrong email entered!! Try agian')</script>	");
				else { 
					System.out.println("undone");
					if(newpassword.equals(confirmpassword)){
						st.executeUpdate("update UserInfo set password = '"+newpassword+"' where email='"+email+"'");
						out.println("<script type='text/javascript'>	window.location.href='index.jsp'; alert('Password Updated successfully!! login now')	</script>");	
					}
				}
			
		}




		//***************************************** buy apparels ****************************************************
		if(id.equals("buyapparels"))
		{
			int shirtsprice = 500;
			int shortsprice = 300;
			int bootsprice = 1000;
			int glovesprice = 200;
			int cost = 0;

			
				String email = (String)session.getAttribute("playerEmail");
				String productname = request.getParameter("productname");
				int quantity = Integer.parseInt(request.getParameter("quantity"));
				String requestdate = request.getParameter("requestdate");

				if(productname.equals("shirts"))
					cost = shirtsprice * quantity;
				else if(productname.equals("shorts"))
					cost = shirtsprice * quantity;
				else if(productname.equals("boots"))
					cost = shirtsprice * quantity;
				else if(productname.equals("gloves"))
					cost = shirtsprice * quantity;

				Class.forName("com.mysql.jdbc.Driver"); 
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Boca","root","7827444741"); 
				Statement st= con.createStatement(); 
				st.executeUpdate("insert into sportApparels (email,productname,quantity,cost,requestdate,status) values('"+email+"','"+productname+"','"+quantity+"','"+cost+"','"+requestdate+"','Requested')");
				out.println("<script type='text/javascript'>	window.location.href='player.jsp'; alert('Apparel Request Sent Successfully!!')	</script>");	
			
		}




		//********************************************************* new claims *****************************************************
		if(id.equals("newclaim"))
		{
			
				String email = (String)session.getAttribute("playerEmail");
				String claimtype = request.getParameter("claimtype");
				int claimamount = Integer.parseInt(request.getParameter("claimamount"));
				String claimdate = request.getParameter("claimdate");

				Class.forName("com.mysql.jdbc.Driver"); 
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Boca","root","7827444741"); 
				Statement st= con.createStatement(); 
				ResultSet rs = st.executeQuery("select * from claims where playeremail ='"+email+"' AND claimstatus = 'Requested'");
				if(!rs.next()){
					st.executeUpdate("insert into claims (playeremail,claimdate,claimtype,claimamount,claimstatus) values('"+email+"','"+claimdate+"','"+claimtype+"','"+claimamount+"','Requested')");
					out.println("<script type='text/javascript'>	window.location.href='player.jsp'; alert('Claim submitted Successfully!!')	</script>");
				}
				else
					out.println("<script type='text/javascript'>	window.location.href='player.jsp'; alert('You already have one pending claim')	</script>");

			
		}



		if(id.equals("maintenance"))
		{
			
				String maintenancetype = request.getParameter("maintenancetype");
				String maintenancedate = request.getParameter("maintenancedate");
				int maintenanceexpense = Integer.parseInt(request.getParameter("maintenanceexpense"));
				String maintenanceprovider = request.getParameter("maintenanceprovider");

				Class.forName("com.mysql.jdbc.Driver"); 
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Boca","root","7827444741"); 
				Statement st= con.createStatement(); 
				st.executeUpdate("insert into maintenance (maintenancetype,maintenancedate,maintenanceexpense,maintenanceprovider) values('"+maintenancetype+"','"+maintenancedate+"','"+maintenanceexpense+"','"+maintenanceprovider+"')");
				out.println("<script type='text/javascript'>	window.location.href='manager.jsp'; alert('Maintenance order has been given!!')	</script>");

		}




		if(id.equals("playerupdate"))
		{
			
				String email=(String)session.getAttribute("playerEmail"); 
				String username=(String)session.getAttribute("playerUsername"); 
				String password=request.getParameter("password");
				String name=request.getParameter("name"); 
				String experience=request.getParameter("experience");
				String dob=request.getParameter("DOB");
				long mobile=Long.parseLong(request.getParameter("mobile")); 
				String playertype=request.getParameter("playertype"); 
				String city=request.getParameter("city");
				String state=request.getParameter("state");
				Class.forName("com.mysql.jdbc.Driver"); 
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Boca","root","7827444741"); 
				Statement st= con.createStatement(); 
				System.out.println("done3");
				st.executeUpdate("UPDATE UserInfo SET password='"+password+"',name='"+name+"',experience='"+experience+"',dob='"+dob+"',mobile='"+mobile+"',playertype='"+playertype+"',city='"+city+"',state='"+state+"' where email='"+email+"'");
				System.out.println("done4");
				out.println("<script type='text/javascript'>	window.location.href='index.jsp';	alert('Profile Updated Succesfully');	</script>	");	

			
		}
					
	}catch(Exception e){
		PrintWriter out=response.getWriter();
		out.println("<html><body>");
		e.printStackTrace();
		out.println("<script type='text/javascript'>	window.location.href='index.jsp';	alert('Server fails with an exception');	</script>	");	

	}
					
}
}