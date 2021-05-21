package control.PurchaseServlets;
import model.PurchaseModels.ProductBean;
import model.PurchaseModels.ProductDAO;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/*
 * Questa Servlet fornisce tutti i prodotti in catalogo
 */

@WebServlet("/ProductsServlet")
public class ProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		ProductDAO dao=new ProductDAO();
		try
		{
			ArrayList<ProductBean> products=dao.doRetrieveAll("id");  //prende tutti i prodotti dal DB secondo l'ordine del parametro
			request.setAttribute("products", products);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
			
	}

}
