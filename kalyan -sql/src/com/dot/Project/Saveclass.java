package com.dot.Project;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 * Servlet implementation class Saveclass
 */
@WebServlet("/project")
public class Saveclass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 HttpSession session = request.getSession(true);
		int userid=0;
		
		  userid=(Integer)session.getAttribute("mid");
		
		System.out.println(userid);

		String pname, summary;
		 pname = request.getParameter("pname");
		summary = request.getParameter("summary");
		String startDateStr = request.getParameter("startdate");
		projectInsert pi=new projectInsert();
		int pstatus=0;
		
		
		try{
		pi.insert(pname, summary, startDateStr,pstatus,userid);
		}
		catch(Exception e)
		{ PrintWriter writer=response.getWriter();
		writer.println("<h2>hey</h2>");
		writer.println("save"+e);
		   return;
		}
		response.sendRedirect("/dot/college/project/projectdisp.jsp");
		// RequestDispatcher dispatcher = request.getRequestDispatcher("projectdisp.jsp");
		  // dispatcher.forward(request, response);
		
		
		
		
		
		
			
}
	
	
}