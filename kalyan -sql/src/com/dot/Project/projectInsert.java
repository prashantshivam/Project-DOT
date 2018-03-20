package com.dot.Project;
import java.sql.*;



public class projectInsert {

	
	public void insert(String pname,String summary,String startdate,int pstatus,int userid){
		Connection con= null;
		PreparedStatement ps = null;
		int rs=0;
		//Statement st=null;
		ResultSet rs1 = null;
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/dot";
		String user = "root";
		String password = "hadoop";

		String sql="insert into project(pname,pstatus,summary,startdate) values (?,?,?,?)";
		String sql1="insert into work_by() values (?,?,1)";
		try {
			
			
		Class.forName(driverName);
		con = DriverManager.getConnection(url, user, password);
		ps = con.prepareStatement(sql);
		ps.setString(1, pname);
		
		ps.setInt(2, pstatus);
		ps.setString(3, summary);
		ps.setDate(4,(java.sql.Date.valueOf(startdate)));
	//	ps.setDate(5,(java.sql.Date.valueOf(enddate)));
		rs = ps.executeUpdate();	
		System.out.println(rs+" records inserted");	
		
		rs1 = ps.executeQuery("SELECT pid FROM project ORDER BY pid DESC LIMIT 1");
		int lastid=0;
		while(rs1.next()){
		 lastid = rs1.getInt("pid");}
		System.out.println(lastid);
		
		ps = con.prepareStatement(sql1);
		ps.setInt(1, lastid);
		ps.setInt(2, userid);
		rs = ps.executeUpdate();
		
		
		
		
		
	}
		
		catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("insert1"+e);
		//System.out.println(rs+" records not inserted");
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("insert2"+e);
	}
		
	
}
}