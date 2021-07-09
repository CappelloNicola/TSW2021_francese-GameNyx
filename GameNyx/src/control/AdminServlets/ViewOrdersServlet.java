package control.AdminServlets;

import model.PurchaseModels.AcquistoBean;
import model.PurchaseModels.AcquistoDAO;
import model.PurchaseModels.ProductBean;
import model.PurchaseModels.ProductDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/ViewOrdersServlet")
public class ViewOrdersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

        doPost(request,response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        AcquistoDAO dao = new AcquistoDAO();

        ArrayList<AcquistoBean> ordini = new ArrayList<>();

        try {

            if(!(request.getParameter("dataInizio").isEmpty()) && !(request.getParameter("dataFine").isEmpty()))
            {

                String dataInizio = request.getParameter("dataInizio");
                String dataFine = request.getParameter("dataFine");

                Date dataInizioDAO=Date.valueOf(dataInizio);
                Date dataFineDAO=Date.valueOf(dataFine);

                ordini = dao.doRetrieveFromDateToDate(dataInizioDAO,dataFineDAO);
            }
            else if(!(request.getParameter("utente").isEmpty()))
            {
                String utenteCerca = request.getParameter("utente");
                ordini = dao.doRetrieveByUser(utenteCerca);
            }


            request.setAttribute("ordini", ordini);

            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/adminPages/OrdiniAdmin.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

}
