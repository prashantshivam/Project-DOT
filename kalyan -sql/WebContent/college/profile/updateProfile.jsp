<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>
	<p>
		Welcome,
		<%!String FName;
	String LName;
	int mob;
	int mid;
	Date date;
	String facebook;
	String linkedin;
	String twitter;
	String website;%>
	
	<%=session.getAttribute("username")%>
	</p>

	<%
		String username = session.getAttribute("username").toString();
		String pass = session.getAttribute("pass").toString();
		String mid1 = session.getAttribute("mid").toString();
		mid=Integer.parseInt(mid1);
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSet rs1[] = null;

		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/dot";
		String user = "root";
		String dbpsw = "hadoop";

		String sql = "select * from member where mid=?";

		if (mid !=0) {
			try {
				Class.forName(driverName);
				con = DriverManager.getConnection(url, user, dbpsw);
				ps = con.prepareStatement(sql);
				ps.setInt(1, mid);

				rs = ps.executeQuery();
				if (rs.next()) {
					FName = rs.getString("fname");
					LName = rs.getString("lname");
					mob = rs.getInt("mobileno");
					date = rs.getDate("dob");
					facebook = rs.getString("facebook");
					linkedin = rs.getString("linkedin");
					twitter = rs.getString("twitter");
					website = rs.getString("website");

				} else
					
				rs.close();
				ps.close();
			} catch (SQLException sqe) {
				out.println(sqe);
			}
		} else {
	%>
	<center>
		<p style="color: red">Error In Login</p>
	</center>
	<%
		getServletContext().getRequestDispatcher("/home.jsp").include(
					request, response);
		}
	%>
	<form method="post" action="/dot/college/profile/updateProfile1.jsp">

		First name <input name="fname" value=<%=FName%>> <br>
		Last name<input name="lname" value=<%=LName%>> <br>
		Mob: <input name="mobileno"value=<%=mob%>> <br>

		dob:<input name="dob" value=<%=date%> type="date"><br>
		facebook:<input name="facebook" value=<%=facebook%>> <br> 
		linkedin: <input name="linkedin" value=<%=linkedin%>> <br> 
		twitter: <input name="twitter" value=<%=twitter%>><br> 
		website: <input name="website" value=<%=website%>><br><br><br>
		<input type="submit" name="edit" value="edit profile"><br>
	</form>
	
	<%-- 
	<p>
	<h2>Skills</h2></p>
	<%
		sql = "select * from skills where sid in (select sid from has_skills where mid =? )";
		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(url, user, dbpsw);
			ps = con.prepareStatement(sql);
			ps.setInt(1, mid);

			rs = ps.executeQuery();

			while (rs.next()) {
	%>
	
	<%=rs.getString("skill")%><br>
	<%
		}
		} catch (SQLException sqe) {
			out.println(sqe);
		}
	%>
	
	
	<p><input name="skill" value="add new skill" type="submit"></p>

	<h2>Courses</h2></p>
	<%
	sql = "select * from courses where  mid =?";
	try {
		Class.forName(driverName);
		con = DriverManager.getConnection(url, user, dbpsw);
		ps = con.prepareStatement(sql);
		ps.setInt(1, mid);

		rs = ps.executeQuery();

		while (rs.next()) {
	%>
	<%=rs.getString("title")%><br>
	<%=rs.getString("description")%><br>
	<%=rs.getString("cdate")%><br>
	<%
		}
		} catch (SQLException sqe) {
			out.println(sqe);
		}
	%>
	<p><input name="course" value="add new course" type="submit"></p>
		
		
  <h2>Achievements</h2></p>
	<%
	sql = "select * from achievements where  mid =?";
	try {
		Class.forName(driverName);
		con = DriverManager.getConnection(url, user, dbpsw);
		ps = con.prepareStatement(sql);
		ps.setInt(1, mid);

		rs = ps.executeQuery();

		while (rs.next()) {
	%>
	<%=rs.getString("title")%><br>
	<%=rs.getString("description")%><br>
	<%=rs.getString("adate")%><br>
	<%
		}
		} catch (SQLException sqe) {
			out.println(sqe);
		}
	%>
	<p><input name="achievements" value="add new one" type="submit"></p>
		<h2>Projects</h2></p>
	<%
	sql = "select * from achievements where  mid =?";
	try {
		Class.forName(driverName);
		con = DriverManager.getConnection(url, user, dbpsw);
		ps = con.prepareStatement(sql);
		ps.setInt(1, mid);

		rs = ps.executeQuery();

		while (rs.next()) {
	%>
	<%=rs.getString("title")%><br>
	<%=rs.getString("description")%><br>
	<%=rs.getString("cdate")%><br>
	<%
		}
		} catch (SQLException sqe) {
			out.println(sqe);
		}
	%>
	<p><input name="achievements" value="add new one" type="submit"></p>
	</form>
	
	<a href="/dot/college/logout/logout.jsp">Logout</a>
</body>
</html> --%>