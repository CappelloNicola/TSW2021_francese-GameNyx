package control.UserServlets;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import model.PurchaseModels.AcquistoDAO;
import model.UserModels.UserBean;
import model.UserModels.UserDAO;

/**
 * Servlet che effettua il login dell'utente
 */
@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String user = request.getParameter("user");

        if(user!=null)
        {
            AcquistoDAO dao = new AcquistoDAO();
            try {
                int quantity = dao.doRetrieveNvideogiochiAcquistati(user);
                request.setAttribute("quantity",quantity);

                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Profile.jsp");
                dispatcher.forward(request, response);

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGet(request, response);
    }

}
