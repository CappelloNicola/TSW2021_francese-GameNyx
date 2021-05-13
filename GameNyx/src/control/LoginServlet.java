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
       
   
    public LoginServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
			HttpSession sessione=request.getSession();
		
			//Diverso dall'esempio di LoginExample.zip
			
			/*UserBean user = dao.doRetrieveByKey(request.getParameter("email"));
			
			//controllo password corrispondente all'utente
			if(user.getPassword().equals(request.getParameter("password")))
			{
				sessione.setAttribute("utente", user);
				response.sendRedirect("Cart.jsp");
			}
			else
			{
				
			}*/
			
			//come nell'esempio di LoginExample.zip
			UserBean user = new UserBean();
			user.setUsername(request.getParameter("username"));
			user.setPassword(request.getParameter("password"));
			
			user = UserDAO.doRetrieve(user);
			
			if(user.getIsValid())
			{
				sessione.setAttribute("currentUserSession", user);
				response.sendRedirect("Cart.jsp");		//problema : quando vai indietro nella pagina non si aggiorna in automatico la pagina
			}
			else
				response.sendRedirect("Registrazione.jsp"); //da implementare
		 
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
