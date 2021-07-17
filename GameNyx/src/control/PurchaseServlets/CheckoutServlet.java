package control.PurchaseServlets;

import java.sql.Date;
import java.io.IOException;

import model.PurchaseModels.AcquistoBean;
import model.PurchaseModels.AcquistoDAO;
import model.PurchaseModels.Cart;
import model.UserModels.UserBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/*
 * Questa Servlet compie il checkout del carrello. Salva l'ordine nel DB
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
			
			AcquistoBean acquisto=new AcquistoBean();
			acquisto.setStato("ordinato");
			acquisto.setIndirizzo(request.getParameter("indirizzo"));	
			acquisto.setDataOrdine(new Date(System.currentTimeMillis())); //restituisce la data odierna
			acquisto.setUtente(utente.getUsername());
			acquisto.setVideogiochi(carrello.getProducts());
			acquisto.setPrezzoAuto();
			acquisto.setNumeroCivico(Integer.parseInt(request.getParameter("numeroCivico")));
			acquisto.setCap(Integer.parseInt(request.getParameter("cap")));
			acquisto.setCitta(request.getParameter("citta"));
			acquisto.setProvicia(request.getParameter("provincia"));
			
			AcquistoDAO acquistoDao=new AcquistoDAO();
			try
			{
				acquistoDao.doSave(acquisto);
			}
			catch(Exception e)
			{
				System.out.println("doSave acquisto non riuscito: "+e);
			}
			
			
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
