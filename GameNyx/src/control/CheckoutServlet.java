package control;

import java.io.IOException;
import model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/*
 * Questa Servlet fornisce tutti i prodotti in catalogo
 */

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		HttpSession sessione=request.getSession();
		Cart carrello=(Cart)sessione.getAttribute("carrello");
		UserBean utente = (UserBean)sessione.getAttribute("currentUserSession");
		
		if(utente==null)
		{
			response.sendRedirect("Login.jsp");
		}
		else if(carrello!=null)
		{
			/*
			 * Aggiungo l'acquisto nel DB*/
			
			
			carrello.resetCart();
			sessione.removeAttribute("carrello");
			response.sendRedirect("Cart.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
			doGet(request, response);
	
	}

}
