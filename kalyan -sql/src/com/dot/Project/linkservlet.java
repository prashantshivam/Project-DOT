package com.dot.Project;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class linkservlet
 */
@WebServlet("/link")
public class linkservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String plink=request.getParameter("plink");
		int pid= Integer.parseInt(request.getParameter("pid"));
//		try{
//			pi.insert(pname, summary, startDateStr,endDateStr,pstatus);
//			}
//			catch(Exception e)
//			{ PrintWriter writer=response.getWriter();
//			writer.println("<h2>hey</h2>");
//			writer.println(endDateStr);
//			   return;
//			}
			response.sendRedirect("details");
			// RequestDispatcher dispatcher = request.getRequestDispatcher("projectdisp.jsp");
			  // dispatcher.forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
