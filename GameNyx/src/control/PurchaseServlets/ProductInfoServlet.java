package control.PurchaseServlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.PurchaseModels.ProductBean;
import model.PurchaseModels.ProductDAO;
import model.UserModels.UserBean;

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
			
			HttpSession sessione=request.getSession();
			
			//se l'utente loggato è un admin bisogna ridirezionarlo ad una pagina diversa
			UserBean user=(UserBean)sessione.getAttribute("currentUserSession");
			if(user!=null)
			{
				if (user.getAdmin())
				{
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/adminPages/ProdottoAdmin.jsp");
					dispatcher.forward(request, response);
					return;
				}
			}
			
					
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
