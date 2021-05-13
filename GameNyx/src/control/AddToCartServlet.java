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

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		HttpSession sessione=request.getSession();
		
		Cart carrello=(Cart)sessione.getAttribute("carrello");
		
		if(carrello==null) 
		{
			carrello=new Cart();
		}
				
		ProductBean prodotto=new ProductBean();
		
		ProductDAO dao=new ProductDAO();
		
		int id = Integer.parseInt(request.getParameter("productID"));
		
		try
		{
			prodotto=dao.doRetrieveByKey(id);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		carrello.addToCart(prodotto); //parametro 0 spiegato in Cart.java
		sessione.setAttribute("carrello", carrello);
			
		//caso in cui è inviata la quantità con il form --> quantità = setQuantity
		
		/*if(request.getParameter("setQuantity")!=null)
		{
			int quantity = Integer.parseInt(request.getParameter("setQuantity"));
			carrello.addToCart(prodotto,quantity);
			sessione.setAttribute("carrello", carrello);
			
		}*/
	
		
		
		//ridireziona alla jsp che ha invocato la servlet
		response.sendRedirect(request.getHeader("referer"));
	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
			doGet(request, response);
	
	}

}
