package control.UserServlets;

import java.sql.SQLException;
import java.util.ArrayList;
import java.io.IOException;

import model.PurchaseModels.AcquistoBean;
import model.PurchaseModels.AcquistoDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/OrderInfoServlet")
public class OrderInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        int numeroOrdine = Integer.parseInt(request.getParameter("numeroOrdine"));
        AcquistoDAO acquistoDAO = new AcquistoDAO();

        try
        {
            AcquistoBean ordine = acquistoDAO.doRetrieveByKey(numeroOrdine);

            if(ordine!=null)
            {
                request.setAttribute("dettagliOrdine",ordine);
            }

            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Profile.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGet(request, response);

    }

}
