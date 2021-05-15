package control;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.UserBean;
import model.UserDAO;

/**
 * Servlet che effettua il login dell'utente
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		UserBean user = new UserBean();
		user.setUsername(request.getParameter("username"));
		user.setEmail(request.getParameter("email"));	
		user.setPasswordUtente(request.getParameter("password"));
		user.setNome(request.getParameter("nome"));
		user.setCognome(request.getParameter("cognome"));
		user.setData(Date.valueOf(request.getParameter("nascita")));
		user.setTelefono(request.getParameter("telefono"));
		
		UserDAO userDao=new UserDAO();
		try
		{
			userDao.doSave(user);
		}
		catch(Exception e)
		{
			System.out.println("doSave non riuscito: "+e);
		}
		
		response.sendRedirect(getServletContext().getContextPath());
		
	}

}
