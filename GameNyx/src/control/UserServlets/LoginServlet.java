package control.UserServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import model.UserModels.UserBean;
import model.UserModels.UserDAO;

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
			
			if(user.getAdmin())
			{
				response.sendRedirect(getServletContext().getContextPath()+"/adminPages/Catalogo.jsp");
			}
			else
			{
				response.sendRedirect(getServletContext().getContextPath());	
				//problema: se fai un login dopo aver provato il checkout, bisogna fare il checkout in automatico
				//Nicola: non per forza: facendo cos� l'utente si ritrova il carrello vuoto senza sapere se l'acquisto � andato a buon fine o meno
				//io lo rimarrei cos�.
			}
			
		}
		else
		{
			response.sendRedirect("Login.jsp?error=true");
		}
		
	}

}
