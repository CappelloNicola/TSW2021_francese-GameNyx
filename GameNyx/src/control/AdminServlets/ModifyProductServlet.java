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

@MultipartConfig
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
        String oldTitle=""; //conservo il titolo del videogioco prima dell'aggiornamento, per sapere se aggiornare il nome della cartella
        //in cui Ë presente la copertina
        
        try
        {
        	ProductBean temp=dao.doRetrieveByKey(Integer.parseInt(idVideogioco)); 
        	oldTitle=temp.getTitolo();
        }
        catch(Exception e)
        {
        	System.out.print("doRetrieve non riuscito"+e);
        }
        
        

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
        	
        	/*
             * 1- Se il titolo Ë cambiato ma non Ë richiesto il cambio di copertina, basta rinominare la cartella
             * 2- Se il titolo Ë cambiato e c'Ë una nuova copertina, si elimina la cartella precendete e se ne crea una nuova in cui 
             * caricare l'immagine
             * 3- Se il titolo Ë lo stesso ma cambia la copertina, si elimina la copertina vecchia e si aggiunge la nuova
             * */
        	
            dao.doUpdate(product);
            Part filePart = request.getPart("copertina");
            final String imagesPath="C:\\Users\\Giuseppe\\git\\repository\\GameNyx\\WebContent\\images";
            
            //1
            if(oldTitle.equals(nomeVideogioco)==false && filePart.getSize()<=0)
            {
            	System.out.println("1");
            	String oldFolderName=imagesPath+"\\"+oldTitle;
            	String newFolderName=imagesPath+"\\"+nomeVideogioco;
            	File oldDir = new File(oldFolderName);
            	File newDir = new File(newFolderName);
            	oldDir.renameTo(newDir);
            	
            }
            //2
            else if(oldTitle.equals(nomeVideogioco)==false && filePart.getSize()>0)
            {
            	System.out.println("2");
            	String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
			    InputStream fileContent = filePart.getInputStream();
			  //Ne ricavo l'estensione per creare correttamente il FileOutputStream
			    String extension=fileName.substring(fileName.lastIndexOf("."));
			    
			    String folderName;
			    folderName=imagesPath+"\\"+nomeVideogioco;
		    	String toDelete=imagesPath+"\\"+oldTitle;
		    	new File(folderName).mkdirs();//crea una nuova cartella
		    	
		    	

			    //Creo il nuovo file in cui copiare l'immagine
			   String outputName=folderName+"\\copertina"+extension;
			   OutputStream output=new FileOutputStream(outputName);
			   fileContent.transferTo(output);
			    output.close();
			    fileContent.close();
			    
			    //cancello la cartella vecchia e tutto il suo contenuto
			    File toDeleteFile= new File(toDelete);
			    String[]entries = toDeleteFile.list();
			    for(String s: entries){
			        File currentFile = new File(toDeleteFile.getPath(),s);
			        currentFile.delete();
			    }
			    toDeleteFile.delete();
			    
			    
            }
            else if(oldTitle.equals(nomeVideogioco) && filePart.getSize()>0)
            {
            	System.out.println("3");
            	String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
			    InputStream fileContent = filePart.getInputStream();
			  //Ne ricavo l'estensione per creare correttamente il FileOutputStream
			    String extension=fileName.substring(fileName.lastIndexOf("."));
			    
			    String folderName;
			    folderName=imagesPath+"\\"+nomeVideogioco;
			    
			  //Creo il nuovo file in cui copiare l'immagine
				   String outputName=folderName+"\\copertina"+extension;
				   OutputStream output=new FileOutputStream(outputName, false); //sovrascrive il file
				   fileContent.transferTo(output);
				    output.close();
				    fileContent.close();
            }
            
            
		    
		    
            //cambio del nome della copertina nella cartella al cambio di nome del titolo

            //Prende l'attuale titolo del prodotto cos√¨ da cercare la cartella con quel titolo
            //e lo cambia con il nuovo titolo passato da ModifyProduct.jsp
            /*String oldFolderName = request.getParameter("oldTitle");

            //TODO rinominare la cartella oppure crearne una nuova con il titolo nuovo e aggiungerci la copertina all'interno
            //NON FUNZIONANO ENTRAMBE
            File destFile = new File("ciao");
            File sourceFile = new File("C:\\Users\\Claudio\\Dropbox\\Universit√†\\Semestre attuale\\TecnologieWeb\\WebApps\\TSW2021_francese-GameNyx\\GameNyx\\WebContent\\images\\dd");

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
