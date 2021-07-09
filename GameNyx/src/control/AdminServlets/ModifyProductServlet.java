package control.AdminServlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.PurchaseModels.ProductBean;
import model.PurchaseModels.ProductDAO;
import java.sql.Date;
import java.sql.SQLException;

//Servlet che modifica il prodotto ricevuto da ModifyProduct.jsp

@WebServlet("/ModifyProductServlet")
public class ModifyProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        ProductDAO dao = new ProductDAO();
        String idVideogioco = request.getParameter("id");

        //Eliminazione prodotto dal database da parte dell'admin richiesta da ModifyProduct.jsp
        if(request.getParameter("elimina")!=null)
        {
            try
            {
                dao.doDelete(Integer.parseInt(idVideogioco));
                response.sendRedirect(request.getContextPath()+"/adminPages/Catalogo.jsp");

            } catch(Exception e)
            {
                System.out.print("doDelete non riuscito"+"\n"+e);
            }
            return;
        }

        String nomeVideogioco=request.getParameter("titolo");
        String descrizione=request.getParameter("descrizione");
        String casaProduttrice=request.getParameter("casaProduttrice");
        String piattaforma=request.getParameter("piattaforma");
        String genere=request.getParameter("genere");
        String data=request.getParameter("data");
        String prezzo=request.getParameter("prezzo");
        String iva=request.getParameter("iva");
        String[] lingueArray=request.getParameterValues("lingua");
        String[] sottotitoliArray=request.getParameterValues("sottotitoli");
        String quantitaNegozio=request.getParameter("quantitaNegozio");

        Date date=Date.valueOf(data);//converto la stringa data in un sql.Date
        //metto tutte le lingue e i sottotitoli in un'unica stringa
        String lingue=lingueArray[0];
        int size=lingueArray.length;
        for(int i=1; i<size; i++)
        {
            lingue=lingue+", "+lingueArray[i];
        }

        String sottotitoli=sottotitoliArray[0];
        size=sottotitoliArray.length;
        for(int i=1; i<size; i++)
        {
            sottotitoli=sottotitoli+", "+sottotitoliArray[i];
        }


        ProductBean product=new ProductBean();
        product.setId(Integer.parseInt(idVideogioco));
        product.setTitolo(nomeVideogioco);
        product.setDescrizione(descrizione);
        product.setCasaProduttrice(casaProduttrice);
        product.setPiattaforma(piattaforma);
        product.setGenere(genere);
        product.setDataPubblicazione(date);
        product.setPrezzo(Double.parseDouble(prezzo));
        product.setIva(Double.parseDouble(iva));
        product.setLingua(lingue);
        product.setSottotitoli(sottotitoli);
        product.setQuantitaNegozio(Integer.parseInt(quantitaNegozio));


        try {
            dao.doUpdate(product);

            //cambio del nome della copertina nella cartella al cambio di nome del titolo

            //Prende l'attuale titolo del prodotto così da cercare la cartella con quel titolo
            //e lo cambia con il nuovo titolo passato da ModifyProduct.jsp
            /*String oldFolderName = request.getParameter("oldTitle");

            //TODO rinominare la cartella oppure crearne una nuova con il titolo nuovo e aggiungerci la copertina all'interno
            //NON FUNZIONANO ENTRAMBE
            File destFile = new File("ciao");
            File sourceFile = new File("C:\\Users\\Claudio\\Dropbox\\Università\\Semestre attuale\\TecnologieWeb\\WebApps\\TSW2021_francese-GameNyx\\GameNyx\\WebContent\\images\\dd");

            if (sourceFile.renameTo(destFile)) {
                System.out.println("File renamed successfully");
            } else {
                System.out.println("Failed to rename file");
            }*/

            /*final String imagesPath=getServletContext().getContextPath()+"\\GameNyx\\WebContent\\images";

            String folderName=imagesPath+"\\"+nomeVideogioco;
            System.out.println(folderName);
            new File(folderName).mkdirs();//crea una nuova cartella*/



        } catch(Exception e)
        {
            System.out.print("doUpdate non riuscito"+"\n"+e);
        }

        //ridizionare alla stessa pagina di modifica del prodotto? da decidere
        response.sendRedirect(request.getContextPath()+"/adminPages/Catalogo.jsp");

    }

}
