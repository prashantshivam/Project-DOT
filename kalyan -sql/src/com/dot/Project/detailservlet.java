package com.dot.Project;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class detailservlet
 */
@WebServlet("/details")
public class detailservlet extends HttpServlet {
	int a;
	int id=0;
	//String plink=null;
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	 int id = Integer.parseInt(request.getParameter("id"));
	 String plink = request.getParameter("plink");
	 int check=0;
	 int tid=Integer.parseInt(request.getParameter("tid"));
	 request.setAttribute("check", 0);
	 int meid=Integer.parseInt(request.getParameter("meid"));
		   if(id != 0){
	        request.setAttribute("id", id);  
	          a=id;
		   }
		   if(meid!=0)
			   {request.setAttribute("meid", meid);
			   request.setAttribute("id",a);
			   request.setAttribute("check", 1);
			   }
		   if(plink!=null)
		   {
			   request.setAttribute("id",a); 
			   request.setAttribute("plink", plink);
			   request.setAttribute("check",2);
			   
		   }
		   if(tid!=0)
		   {request.setAttribute("tid", tid);
		   request.setAttribute("id",a);
		   request.setAttribute("check", 3);
			   
		   }
	       // response.sendRedirect("projdetails.jsp");

 RequestDispatcher reqDispatcher = request.getRequestDispatcher("/college/project/projdetails.jsp");
 reqDispatcher.forward(request,response);
	}
}
