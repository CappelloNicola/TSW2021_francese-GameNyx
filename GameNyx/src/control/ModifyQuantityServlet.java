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

@WebServlet("/ModifyQuantityServlet")
public class ModifyQuantityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		HttpSession sessione=request.getSession();
		
		Cart carrello=(Cart)sessione.getAttribute("carrello");
	
		int id = Integer.parseInt(request.getParameter("productID"));
			
		if(request.getParameter("setQuantity")!=null)
		{
			int quantity = Integer.parseInt(request.getParameter("setQuantity"));
			carrello.modifyQuantity(id,quantity);
			sessione.setAttribute("carrello", carrello);
			
		}
	
		/*RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Cart.jsp");
		dispatcher.forward(request, response);*/
		
		/*se in seguito alla modifica della quantità vengono rimossi tutti i prodotti, bisogna rimuovere
		 * dalla sessione l'attributo carrello*/
		if(carrello.getSize()==0)
		{
			sessione.removeAttribute("carrello");
		}
		
		response.sendRedirect(request.getContextPath()+"/Cart.jsp"); 
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
			doGet(request, response);
	
	}

}
