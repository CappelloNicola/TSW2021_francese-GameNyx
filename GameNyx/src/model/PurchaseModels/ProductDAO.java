package model.PurchaseModels;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class ProductDAO 
{
	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/storage");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	private static final String TABLE_NAME = "videogioco";
	
	public synchronized void doSave(ProductBean product) throws SQLException, Exception {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + TABLE_NAME
				+ " (titolo, descrizione, casaProduttrice, piattaforma,"
				+ "  genere, dataPubblicazione, prezzo, lingua, sottotitoli, iva, quantitaNegozio, inCatalogo) "
				+ "  VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, product.getTitolo());
			preparedStatement.setString(2, product.getDescrizione());
			preparedStatement.setString(3, product.getCasaProduttrice());
			preparedStatement.setString(4, product.getPiattaforma());
			preparedStatement.setString(5, product.getGenere());
			preparedStatement.setDate(6, product.getDataPubblicazione());
			preparedStatement.setDouble(7, product.getPrezzo());
			preparedStatement.setString(8, product.getLingua());
			preparedStatement.setString(9, product.getSottotitoli());
			preparedStatement.setDouble(10, product.getIva());
			preparedStatement.setInt(11, product.getQuantitaNegozio());
			preparedStatement.setBoolean(12, product.getInCatalogo());
			
			preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}

	//Modifica la quantita in negozio e il numero di vendite del prodotto in base al numero di copie acquistate
	public synchronized void doUpdateProduct(ProductBeanCart product) throws SQLException, Exception {

		Connection connection = null;
		PreparedStatement preparedStatement = null;


		try {
			connection = ds.getConnection();

			String selectSQL = "SELECT numeroVendite,quantitaNegozio FROM " + TABLE_NAME + " WHERE id = ?";
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, product.getId());
			System.out.println("id" + product.getId());
			ResultSet rs = preparedStatement.executeQuery();
			rs.next();

			int vendite = rs.getInt("numeroVendite");
			int quantita = rs.getInt("quantitaNegozio");

			quantita -= product.getCartQuantity();
			System.out.println("car" + product.getCartQuantity());
			vendite += product.getCartQuantity();

			String updateSQL = "UPDATE " + TABLE_NAME
						+ " SET numeroVendite= ?, quantitaNegozio= ? "
						+ " WHERE id = ?";

			preparedStatement = connection.prepareStatement(updateSQL);
			preparedStatement.setInt(1, vendite);
			preparedStatement.setInt(2, quantita);
			preparedStatement.setInt(3, product.getId());

			preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}


	public synchronized ProductBean doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProductBean bean = new ProductBean();

		String selectSQL = "SELECT * FROM " +TABLE_NAME + " WHERE id = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setId(rs.getInt("id"));
				bean.setTitolo(rs.getString("titolo"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setCasaProduttrice(rs.getString("casaProduttrice"));
				bean.setPiattaforma(rs.getString("piattaforma"));
				bean.setGenere(rs.getString("genere"));
				bean.setDataPubblicazione(rs.getDate("dataPubblicazione"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setLingua(rs.getString("lingua"));
				bean.setSottotitoli(rs.getString("sottotitoli"));
				bean.setNumeroValutazioni(rs.getInt("numeroValutazioni"));
				bean.setMediaValutazioni(rs.getDouble("mediaValutazioni"));
				bean.setIva(rs.getDouble("iva"));
				bean.setNumeroVendite(rs.getInt("numeroVendite"));
				bean.setQuantitaNegozio(rs.getInt("quantitaNegozio"));
				bean.setTrailerURL(rs.getString("trailer"));
				bean.setInCatalogo(rs.getBoolean("inCatalogo"));
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return bean;
	}

	public synchronized ArrayList<ProductBean> doRetrieveByGenre(String genre) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<ProductBean> products = new ArrayList<>();

		String selectSQL = "SELECT * FROM " +TABLE_NAME + " WHERE genere = '"+genre+"'";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setId(rs.getInt("id"));
				bean.setTitolo(rs.getString("titolo"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setCasaProduttrice(rs.getString("casaProduttrice"));
				bean.setPiattaforma(rs.getString("piattaforma"));
				bean.setGenere(rs.getString("genere"));
				bean.setDataPubblicazione(rs.getDate("dataPubblicazione"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setLingua(rs.getString("lingua"));
				bean.setSottotitoli(rs.getString("sottotitoli"));
				bean.setNumeroValutazioni(rs.getInt("numeroValutazioni"));
				bean.setMediaValutazioni(rs.getDouble("mediaValutazioni"));
				bean.setIva(rs.getDouble("iva"));
				bean.setNumeroVendite(rs.getInt("numeroVendite"));
				bean.setQuantitaNegozio(rs.getInt("quantitaNegozio"));
				bean.setTrailerURL(rs.getString("trailer"));
				bean.setInCatalogo(rs.getBoolean("inCatalogo"));

				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}

	public synchronized ArrayList<ProductBean> doRetrieveByNumeroVendite() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<ProductBean> products = new ArrayList<>();

		String selectSQL = "SELECT * FROM " +TABLE_NAME + " ORDER BY numeroVendite DESC";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);


			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setId(rs.getInt("id"));
				bean.setTitolo(rs.getString("titolo"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setCasaProduttrice(rs.getString("casaProduttrice"));
				bean.setPiattaforma(rs.getString("piattaforma"));
				bean.setGenere(rs.getString("genere"));
				bean.setDataPubblicazione(rs.getDate("dataPubblicazione"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setLingua(rs.getString("lingua"));
				bean.setSottotitoli(rs.getString("sottotitoli"));
				bean.setNumeroValutazioni(rs.getInt("numeroValutazioni"));
				bean.setMediaValutazioni(rs.getDouble("mediaValutazioni"));
				bean.setIva(rs.getDouble("iva"));
				bean.setNumeroVendite(rs.getInt("numeroVendite"));
				bean.setQuantitaNegozio(rs.getInt("quantitaNegozio"));
				bean.setTrailerURL(rs.getString("trailer"));
				bean.setInCatalogo(rs.getBoolean("inCatalogo"));
				
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}

	public synchronized ArrayList<ProductBean> doRetrieveByPrice() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<ProductBean> products = new ArrayList<>();

		String selectSQL = "SELECT * FROM " +TABLE_NAME + " ORDER BY prezzo ASC";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);


			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setId(rs.getInt("id"));
				bean.setTitolo(rs.getString("titolo"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setCasaProduttrice(rs.getString("casaProduttrice"));
				bean.setPiattaforma(rs.getString("piattaforma"));
				bean.setGenere(rs.getString("genere"));
				bean.setDataPubblicazione(rs.getDate("dataPubblicazione"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setLingua(rs.getString("lingua"));
				bean.setSottotitoli(rs.getString("sottotitoli"));
				bean.setNumeroValutazioni(rs.getInt("numeroValutazioni"));
				bean.setMediaValutazioni(rs.getDouble("mediaValutazioni"));
				bean.setIva(rs.getDouble("iva"));
				bean.setNumeroVendite(rs.getInt("numeroVendite"));
				bean.setQuantitaNegozio(rs.getInt("quantitaNegozio"));
				bean.setTrailerURL(rs.getString("trailer"));
				bean.setInCatalogo(rs.getBoolean("inCatalogo"));

				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}

	public synchronized ArrayList<ProductBean> doRetrieveByDateDESC() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<ProductBean> products = new ArrayList<>();

		String selectSQL = "SELECT * FROM " +TABLE_NAME + " ORDER BY dataPubblicazione DESC";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setId(rs.getInt("id"));
				bean.setTitolo(rs.getString("titolo"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setCasaProduttrice(rs.getString("casaProduttrice"));
				bean.setPiattaforma(rs.getString("piattaforma"));
				bean.setGenere(rs.getString("genere"));
				bean.setDataPubblicazione(rs.getDate("dataPubblicazione"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setLingua(rs.getString("lingua"));
				bean.setSottotitoli(rs.getString("sottotitoli"));
				bean.setNumeroValutazioni(rs.getInt("numeroValutazioni"));
				bean.setMediaValutazioni(rs.getDouble("mediaValutazioni"));
				bean.setIva(rs.getDouble("iva"));
				bean.setNumeroVendite(rs.getInt("numeroVendite"));
				bean.setQuantitaNegozio(rs.getInt("quantitaNegozio"));
				bean.setTrailerURL(rs.getString("trailer"));
				bean.setInCatalogo(rs.getBoolean("inCatalogo"));

				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}

	public synchronized boolean doDelete(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;
		
		//String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE id = ?";
		
		/*Se un prodotto viene eliminato, l'utente deve poter vedere nei suoi ordini il prodotto
		 * se l'ha precedentemente acquistato. Per fare questo, non cancelliamo la riga dal DB, ma settiamo
		 * inCatalogo a false per mantenere le informazioni sul prodotto e allo stesso tempo, non mostrarlo 
		 * nel Catalogo*/
		String deleteSQL="update " + TABLE_NAME + " set inCatalogo=false, quantitaNegozio=0 where id= ?";
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}

	
	public synchronized ArrayList<ProductBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<ProductBean> products = new ArrayList<ProductBean>();

		String selectSQL = "SELECT * FROM " + TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setId(rs.getInt("id"));
				bean.setTitolo(rs.getString("titolo"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setCasaProduttrice(rs.getString("casaProduttrice"));
				bean.setPiattaforma(rs.getString("piattaforma"));
				bean.setGenere(rs.getString("genere"));
				bean.setDataPubblicazione(rs.getDate("dataPubblicazione"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setLingua(rs.getString("lingua"));
				bean.setSottotitoli(rs.getString("sottotitoli"));
				bean.setNumeroValutazioni(rs.getInt("numeroValutazioni"));
				bean.setMediaValutazioni(rs.getDouble("mediaValutazioni"));
				bean.setIva(rs.getDouble("iva"));
				bean.setNumeroVendite(rs.getInt("numeroVendite"));
				bean.setQuantitaNegozio(rs.getInt("quantitaNegozio"));	
				bean.setTrailerURL(rs.getString("trailer"));
				bean.setInCatalogo(rs.getBoolean("inCatalogo"));
				
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}

	public synchronized void doUpdate(ProductBean product) throws SQLException, Exception {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "UPDATE " + TABLE_NAME
				+ " SET titolo=?, descrizione=?, casaProduttrice=?, piattaforma=?,"
				+ "  genere=?, dataPubblicazione=?, prezzo=?, lingua=?, sottotitoli=?, iva=?, quantitaNegozio=?, trailer=?, inCatalogo=? "
				+ "  WHERE id=?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, product.getTitolo());
			preparedStatement.setString(2, product.getDescrizione());
			preparedStatement.setString(3, product.getCasaProduttrice());
			preparedStatement.setString(4, product.getPiattaforma());
			preparedStatement.setString(5, product.getGenere());
			preparedStatement.setDate(6, product.getDataPubblicazione());
			preparedStatement.setDouble(7, product.getPrezzo());
			preparedStatement.setString(8, product.getLingua());
			preparedStatement.setString(9, product.getSottotitoli());
			preparedStatement.setDouble(10, product.getIva());
			preparedStatement.setInt(11, product.getQuantitaNegozio());
			preparedStatement.setString(12, product.getTrailerURL());
			preparedStatement.setBoolean(13, product.getInCatalogo());
			preparedStatement.setInt(14, product.getId());

			preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}

	public synchronized ArrayList<ProductBean> doSearch(String product) throws SQLException, Exception {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String searchSQL = "SELECT * FROM " + TABLE_NAME
				+ "  WHERE titolo LIKE ?";

		ArrayList<ProductBean> products = new ArrayList<ProductBean>();

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(searchSQL);

			preparedStatement.setString(1, product+"%");
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next())
			{
				ProductBean bean = new ProductBean();

				bean.setId(rs.getInt("id"));
				bean.setTitolo(rs.getString("titolo"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setCasaProduttrice(rs.getString("casaProduttrice"));
				bean.setPiattaforma(rs.getString("piattaforma"));
				bean.setGenere(rs.getString("genere"));
				bean.setDataPubblicazione(rs.getDate("dataPubblicazione"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setLingua(rs.getString("lingua"));
				bean.setSottotitoli(rs.getString("sottotitoli"));
				bean.setNumeroValutazioni(rs.getInt("numeroValutazioni"));
				bean.setMediaValutazioni(rs.getDouble("mediaValutazioni"));
				bean.setIva(rs.getDouble("iva"));
				bean.setNumeroVendite(rs.getInt("numeroVendite"));
				bean.setQuantitaNegozio(rs.getInt("quantitaNegozio"));
				bean.setTrailerURL(rs.getString("trailer"));
				bean.setInCatalogo(rs.getBoolean("inCatalogo"));
				
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}

		return products;
	}


}