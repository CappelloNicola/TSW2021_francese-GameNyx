package control.PurchaseServlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PurchaseModels.ProductBean;
import model.PurchaseModels.ProductDAO;

@WebServlet("/ProductInfoServlet")
public class ProductInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		ProductDAO dao=new ProductDAO();
		try
		{
			int id = Integer.parseInt(request.getParameter("productID"));
			ProductBean product = dao.doRetrieveByKey(id);  //prende il prodotto dal DB che ha l'id specificato come parametro
			
			request.setAttribute("product", product);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductInfo.jsp");
			dispatcher.forward(request, response);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
