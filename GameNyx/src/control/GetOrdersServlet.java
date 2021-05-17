package control;

import java.sql.Date;
import java.util.ArrayList;
import java.io.IOException;
import model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/GetOrdersServlet")
public class GetOrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		HttpSession sessione=request.getSession();
		UserBean utente = (UserBean)sessione.getAttribute("currentUserSession");
		
		if(utente==null)
		{
			response.sendRedirect("Login.jsp");
		}
		else
		{
			String user=utente.getUsername();
			ArrayList<AcquistoBean> arrayBean=null; //array di acquisti da inoltrare alla jsp nella request
			
			AcquistoDAO dao=new AcquistoDAO();
			try
			{
				arrayBean=dao.doRetrieveByUser(user);
			}
			catch(Exception e)
			{
				System.out.println("doRetrieveByUser fallito: "+ e);
			}
			
			if(arrayBean!=null)
			{
				request.setAttribute("ordini", arrayBean);
			}
			
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Ordini.jsp");
			dispatcher.forward(request, response);
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
			doGet(request, response);
	
	}

}
