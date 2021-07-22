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
			    Part copertina = request.getPart("copertina");
			    String copertinaFileName = FilePart.getSubmittedFileName(copertina);
			    InputStream copertinafileContent = copertina.getInputStream();

				Part screen1 = request.getPart("screenshot1");
				String screen1FileName = FilePart.getSubmittedFileName(screen1);
				InputStream screen1fileContent = screen1.getInputStream();
				Part screen2 = request.getPart("screenshot2");
				String screen2FileName = FilePart.getSubmittedFileName(screen2);
				InputStream screen2fileContent = screen2.getInputStream();
				Part screen3 = request.getPart("screenshot3");
				String screen3FileName = FilePart.getSubmittedFileName(screen3);
				InputStream screen3fileContent = screen3.getInputStream();
				Part screen4 = request.getPart("screenshot4");
				String screen4FileName = FilePart.getSubmittedFileName(screen4);
				InputStream screen4fileContent = screen4.getInputStream();

				Part background = request.getPart("background");
				String backgroundFileName = FilePart.getSubmittedFileName(background);
				InputStream backgroundfileContent = background.getInputStream();

				Part header = request.getPart("header");
				String headerFileName = FilePart.getSubmittedFileName(header);
				InputStream headerfileContent = header.getInputStream();
			    
			    //Ne ricavo l'estensione per creare correttamente il FileOutputStream
			    String extension1=copertinaFileName.substring(copertinaFileName.lastIndexOf("."));
				String extension2=screen1FileName.substring(screen1FileName.lastIndexOf("."));
				String extension3=screen2FileName.substring(screen2FileName.lastIndexOf("."));
				String extension4=screen3FileName.substring(screen3FileName.lastIndexOf("."));
				String extension5=screen4FileName.substring(screen4FileName.lastIndexOf("."));
				String extension6=backgroundFileName.substring(backgroundFileName.lastIndexOf("."));
				String extension7=headerFileName.substring(headerFileName.lastIndexOf("."));
			    
			    //Creo la cartella in cui verrà inserita l'immagine nel server
			    final String imagesPath="C:\\Users\\Claudio\\Dropbox\\Università\\Semestre attuale\\TecnologieWeb\\WebApps\\Repository\\GameNyx\\WebContent\\images";
				/*Non si può caricare un file sul server specificando l'URL, bisogna specificare il path vero e proprio.
				 * Quando ci lavoriamo, mettiamo la precedente stringa tra commenti e cambiamo il path*/
			    
			    String folderName=imagesPath+"\\"+nomeVideogioco; 
			    new File(folderName).mkdirs();//crea una nuova cartella
			    
			    //Creo il nuovo file in cui copiare l'immagine
			     String outCopertina=folderName+"\\copertina"+extension1;
			     String outScreen1=folderName+"\\1"+extension2;
				 String outScreen2=folderName+"\\2"+extension3;
				 String outScreen3=folderName+"\\3"+extension4;
				 String outScreen4=folderName+"\\4"+extension5;
				 String outBackground=folderName+"\\background"+extension6;
			     String outHeader=folderName+"\\header"+extension7;

			     OutputStream outputCopertina=new FileOutputStream(outCopertina);
				 OutputStream outputScreen1=new FileOutputStream(outScreen1);
				 OutputStream outputScreen2=new FileOutputStream(outScreen2);
				 OutputStream outputScreen3=new FileOutputStream(outScreen3);
				 OutputStream outputScreen4=new FileOutputStream(outScreen4);
				 OutputStream outputBackground=new FileOutputStream(outBackground);
				 OutputStream outputHeader=new FileOutputStream(outHeader);

			     copertinafileContent.transferTo(outputCopertina);
				 screen1fileContent.transferTo(outputScreen1);
				 screen2fileContent.transferTo(outputScreen2);
				 screen3fileContent.transferTo(outputScreen3);
				 screen4fileContent.transferTo(outputScreen4);
				 backgroundfileContent.transferTo(outputBackground);
				 headerfileContent.transferTo(outputHeader);

			     outputCopertina.close();
				 outputScreen1.close();
				 outputScreen2.close();
				 outputScreen3.close();
				 outputScreen4.close();
				 outputBackground.close();
				 outputHeader.close();

			}
			catch(Exception e)
			{
				System.out.print("doSave non riuscito"+"\n"+e);
			}
			
			
			response.sendRedirect("adminPages/Inserisci.jsp");
			
	}

}
