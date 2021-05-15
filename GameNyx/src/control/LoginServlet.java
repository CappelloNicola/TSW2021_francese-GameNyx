package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import model.UserBean;
import model.UserDAO;

/**
 * Servlet che effettua il login dell'utente
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession sessione=request.getSession();

		UserBean user = new UserBean();
		user.setUsername(request.getParameter("username"));
		user.setPasswordUtente(request.getParameter("password"));
		
		user = UserDAO.doRetrieve(user);
		
		if(user.getIsValid())
		{
			sessione.setAttribute("currentUserSession", user);
			response.sendRedirect(getServletContext().getContextPath());	
			//problema: se fai un login dopo aver provato il checkout, bisogna fare il checkout in automatico
		}
		else
		{
			response.sendRedirect("Registrazione.jsp"); //da implementare
		}
		
	}

}
