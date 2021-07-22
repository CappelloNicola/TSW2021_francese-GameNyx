package control.AdminServlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import control.AdminServlets.ImageUpload.FilePart;
import model.PurchaseModels.ProductBean;
import model.PurchaseModels.ProductDAO;
import java.sql.Date;

@MultipartConfig //dichiara che la servlet gestirà una codifica multipart per caricare la copertina del gioco su server
@WebServlet("/InsertProductServlet")
public class InsertProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
			String nomeVideogioco=request.getParameter("nome");
			String descrizione=request.getParameter("descrizione");
			String casaProduttrice=request.getParameter("casaProduttrice");
			String piattaforma=request.getParameter("piattaforma");
			String genere=request.getParameter("genere");
			String data=request.getParameter("data");
			String prezzo=request.getParameter("prezzo");
			String iva=request.getParameter("iva");
			String[] lingueArray=request.getParameterValues("lingua");
			String[] sottotitoliArray=request.getParameterValues("sottotitolo");
			String quantitaNegozio=request.getParameter("quantitaNegozio");
			String trailer=request.getParameter("trailer");

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
			product.setTrailerURL(trailer);
			
			ProductDAO dao=new ProductDAO();
			/*Solo il doSave potrebbe lanciare un'eccezione. Se nessuna eccezione viene lanciata
			 * viene inserita anche la copertina del gioco*/
			try
			{
				dao.doSave(product);
				
				/*Viene presa la copertina e inserita sul server*/

				//Metto in un InputStream l'immagine
			    Part filePart = request.getPart("copertina"); 
			    String fileName = FilePart.getSubmittedFileName(filePart);
			    InputStream fileContent = filePart.getInputStream();
			    
			    //Ne ricavo l'estensione per creare correttamente il FileOutputStream
			    String extension=fileName.substring(fileName.lastIndexOf("."));
			    
			    //Creo la cartella in cui verrà inserita l'immagine nel server
			    final String imagesPath="C:\\Users\\Giuseppe\\git\\repository\\GameNyx\\WebContent\\images";
				/*Non si può caricare un file sul server specificando l'URL, bisogna specificare il path vero e proprio.
				 * Quando ci lavoriamo, mettiamo la precedente stringa tra commenti e cambiamo il path*/
			    
			    String folderName=imagesPath+"\\"+nomeVideogioco; 
			    new File(folderName).mkdirs();//crea una nuova cartella
			    
			    //Creo il nuovo file in cui copiare l'immagine
			     String outputName=folderName+"\\copertina"+extension;
			     OutputStream output=new FileOutputStream(outputName);
			     fileContent.transferTo(output);
			     output.close();
			}
			catch(Exception e)
			{
				System.out.print("doSave non riuscito"+"\n"+e);
			}
			
			
			response.sendRedirect("adminPages/Inserisci.jsp");
			
	}

}
