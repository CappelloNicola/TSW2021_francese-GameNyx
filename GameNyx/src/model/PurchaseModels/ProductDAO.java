package model.PurchaseModels;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
				+ "  genere, dataPubblicazione, prezzo, lingua, sottotitoli, iva, quantitaNegozio) "
				+ "  VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

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

		String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE id = ?";

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