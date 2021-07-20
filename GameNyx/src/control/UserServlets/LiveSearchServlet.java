package control.UserServlets;

import model.PurchaseModels.AcquistoBean;
import model.PurchaseModels.AcquistoDAO;
import model.PurchaseModels.ProductBean;
import model.PurchaseModels.ProductDAO;
import model.UserModels.UserBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.ArrayList;
import com.google.gson.*;

@WebServlet("/LiveSearchServlet")
public class LiveSearchServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        //prende il testo inserito nella barra di ricerca inviato tramite parametro
        String search = request.getParameter("q");

        ProductDAO dao = new ProductDAO();
        ArrayList<ProductBean> productsSearched = new ArrayList<>();
        try {
            productsSearched = dao.doSearch(search);
        } catch (Exception e) {
            System.out.println("doSearch non effettuato");
            e.printStackTrace();
        }
        
        
        
      
        	response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
        	 Gson object=new Gson();
             String jsonObject=object.toJson(productsSearched);
             response.getWriter().write(jsonObject);
             System.out.print(jsonObject);
        
       
        
        
        
       /* response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<div id='searchedElementsDiv'>");

        String copertina;

        if(productsSearched.size()==0)
        {
            out.println("<p class='searchedElement'>");
            out.println("Nessun risultato trovato");
            out.println("</p>");
        }

        for(ProductBean e:productsSearched)
        {
            //TODO da risolvere il conflitto con gli apici singoli
            copertina ="./images/"+e.getTitolo()+"/copertina.jpg";
            out.println("<div class='searchedElement'>");
            out.print("<a style=\"text-decoration: none;\" href=\"ProductInfoServlet?productID="+e.getId()+"\" target=\"_blank\">");
            out.println("<img src='"+copertina+"'><p>"+e.getTitolo()+"</p>");
            out.println("</div>");

        }
        out.println("</div>");*/

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGet(request, response);
    }

}