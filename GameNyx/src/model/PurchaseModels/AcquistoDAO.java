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

public class AcquistoDAO 
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

	private static final String TABLE_NAME = "acquisto";
	private static final String TABLE_NAME2 = "composto";
	
	public synchronized void doSave(AcquistoBean acquisto) throws SQLException, Exception 
	{

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		PreparedStatement preparedStatement2 = null;
		PreparedStatement preparedStatement3 = null;
		
		String insertSQL = "INSERT INTO " + TABLE_NAME
				+ " (prezzo, stato, indirizzo, dataOrdine,"
				+ "  utente) "
				+ "  VALUES (?, ?, ?, ?, ?)";
		
		String insertSQL2 = "INSERT INTO " + TABLE_NAME2
						+ "(acquisto, videogioco, quantitaVideogioco, "
						+ "ivaVideogioco, prezzoVideogioco) VALUES "
						+ "(?, ?, ?, ?, ?)";
		
		String maxId= "select max(numeroOrdine) as massimo from " + TABLE_NAME;
		
		

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setDouble(1, acquisto.getPrezzo());
			preparedStatement.setString(2, acquisto.getStato());
			preparedStatement.setString(3, acquisto.getIndirizzo());;
			preparedStatement.setDate(4, acquisto.getDataOrdine());
			preparedStatement.setString(5, acquisto.getUtente());
			
			if(preparedStatement.executeUpdate()==1)
			{
				/*
				 * Se l'aggiunta di una riga in acquisto ha avuto successo
				 * estrapolo questo id con max(numeroOrdine) in modo da aggiornare
				 * la tabella "composto"*/
				preparedStatement3=connection.prepareStatement(maxId);
				ResultSet set=preparedStatement3.executeQuery();
				set.next();
				
				int numeroOrdine=set.getInt("massimo");
				ArrayList<ProductBeanCart> videogiochi=acquisto.getVideogiochi();
				preparedStatement2=connection.prepareStatement(insertSQL2);
				
				for(int i=0; i<videogiochi.size(); i++)
				{
					ProductBeanCart prodotto=videogiochi.get(i);
					
					
					preparedStatement2.setInt(1, numeroOrdine);
					preparedStatement2.setInt(2, prodotto.getId());
					preparedStatement2.setInt(3, prodotto.getCartQuantity());
					preparedStatement2.setDouble(4, prodotto.getIva());
					preparedStatement2.setDouble(5, prodotto.getPrezzo());
					
					preparedStatement2.executeUpdate();	
				}		
			}

			} 
			finally 
			{
				try 
				{
					if (preparedStatement != null)
						preparedStatement.close();
					
					if (preparedStatement2 != null)
						preparedStatement.close();
					
					if (preparedStatement3 != null)
						preparedStatement.close();
				} 
				finally 
				{
					if (connection != null)
						connection.close();
				}
			}
	}	

	
	/*
	 * Restituisce tutti gli ordini di un utente in base all'username*/
	public synchronized ArrayList<AcquistoBean> doRetrieveByUser(String user) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		PreparedStatement preparedStatement2 = null;
		
		ArrayList<AcquistoBean> arrayBean = new ArrayList<AcquistoBean>();
		boolean rows=false; //controlla se la query ha restituito delle righe
		
		String TB="videogioco"; //nome tabella con cui fare join
		
		String selectSQL = "SELECT numeroOrdine, prezzo, stato, indirizzo, "
				+ "dataOrdine from " + TABLE_NAME + " where utente= ?";
				
		String selectSQL2 = "SELECT quantitaVideogioco, ivaVideogioco, "
				+  "prezzoVideogioco, id, titolo, piattaforma FROM "
				+ TABLE_NAME2 + " as T1 inner join " + TB + " as T2 on "
				+ "T1.videogioco = T2.id where acquisto= ?";
		

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, user);
			preparedStatement2 = connection.prepareStatement(selectSQL2);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				rows=true;
				AcquistoBean bean=new AcquistoBean();
				bean.setNumeroOrdine(rs.getInt("numeroOrdine"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setStato(rs.getString("stato"));
				bean.setIndirizzo(rs.getString("indirizzo"));
				bean.setDataOrdine(rs.getDate("dataOrdine"));
				
				ArrayList<ProductBeanCart> videogiochi=new ArrayList<ProductBeanCart>();
				preparedStatement2.setInt(1, rs.getInt("numeroOrdine"));
				ResultSet rs2 = preparedStatement2.executeQuery();
				
				while(rs2.next())
				{
					ProductBeanCart prodotto=new ProductBeanCart();
					prodotto.setCartQuantity(rs2.getInt("quantitaVideogioco"));
					prodotto.setIva(rs2.getDouble("ivaVideogioco"));
					prodotto.setPrezzo(rs2.getDouble("prezzoVideogioco"));
					prodotto.setId(rs2.getInt("id"));
					prodotto.setTitolo(rs2.getString("titolo"));
					prodotto.setPiattaforma(rs2.getString("piattaforma"));
					
					videogiochi.add(prodotto);
				}
				
				bean.setVideogiochi(videogiochi);
				arrayBean.add(bean);
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
		
		if(!rows)
		{
			return null;
		}
		return arrayBean;
	}
	
	public synchronized AcquistoBean doRetrieveByKey(int numeroOrdine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		PreparedStatement preparedStatement2 = null;
		
		AcquistoBean bean = new AcquistoBean();

		String TB="videogioco"; //nome tabella con cui fare join
		
		String selectSQL = "SELECT numeroOrdine, prezzo, stato, indirizzo, "
				+ "dataOrdine from " + TABLE_NAME + " where numeroOrdine= ?";
				
		String selectSQL2 = "SELECT quantitaVideogioco, ivaVideogioco, "
				+  "prezzoVideogioco, id, titolo, piattaforma FROM "
				+ TABLE_NAME2 + " as T1 inner join " + TB + " as T2 on "
				+ "T1.videogioco = T2.id where acquisto= ?";
		

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, numeroOrdine);
			preparedStatement2 = connection.prepareStatement(selectSQL2);
			preparedStatement2.setInt(1, numeroOrdine);

			ResultSet rs = preparedStatement.executeQuery();
			ResultSet rs2 = preparedStatement2.executeQuery();
			
			if (rs.next()) {
				bean.setNumeroOrdine(rs.getInt("numeroOrdine"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setStato(rs.getString("stato"));
				bean.setIndirizzo(rs.getString("indirizzo"));
				bean.setDataOrdine(rs.getDate("dataOrdine"));
				
				ArrayList<ProductBeanCart> videogiochi=new ArrayList<ProductBeanCart>();
				
				while(rs2.next())
				{
					ProductBeanCart prodotto=new ProductBeanCart();
					prodotto.setCartQuantity(rs2.getInt("quantitaVideogioco"));
					prodotto.setIva(rs2.getDouble("ivaVideogioco"));
					prodotto.setPrezzo(rs2.getDouble("prezzoVideogioco"));
					prodotto.setId(rs2.getInt("id"));
					prodotto.setTitolo(rs2.getString("titolo"));
					prodotto.setPiattaforma(rs2.getString("piattaforma"));
					
					videogiochi.add(prodotto);
				}
				
				bean.setVideogiochi(videogiochi);
			}
			else
			{
				return null;
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

	
	
	public synchronized boolean doDelete(int numeroOrdine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		PreparedStatement preparedStatement2 = null;

		int result = 0;
		int result2 = 0;
		
		String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE numeroOrdine = ?";
		String deleteSQL2 = "DELETE FROM " + TABLE_NAME2 + "WHERE acquisto = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement2 = connection.prepareStatement(deleteSQL2);
			preparedStatement.setInt(1, numeroOrdine);
			preparedStatement2.setInt(1, numeroOrdine);
			
			

			result2 = preparedStatement2.executeUpdate();
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
		return (result != 0 && result2!=0);
	}

	//da completare: bisogna fare il join con composto e videogioco //TODO
	public synchronized ArrayList<AcquistoBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<AcquistoBean> orders = new ArrayList<AcquistoBean>();

		String selectSQL = "SELECT * FROM " + TABLE_NAME;
		
		/*String selectSQL = "SELECT numeroOrdine, prezzo, stato, indirizzo, "
		+ "dataOrdine, utente, quantitaVideogioco, ivaVideogioco, "
		+ "prezzoVideogioco, id, titolo, piattaforma "
		+ " FROM (("
		+ TABLE_NAME + " as T1 inner join " + TABLE_NAME2 
		+ " as T2 on T1.numeroOrdine=T2.acquisto) inner join "
		+ TB + " as T3 on T2.videogioco=T3.id) ";*/

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				AcquistoBean bean = new AcquistoBean();

				bean.setNumeroOrdine(rs.getInt("numeroOrdine"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setStato(rs.getString("stato"));
				bean.setIndirizzo(rs.getString("indirizzo"));
				bean.setDataOrdine(rs.getDate("dataOrdine"));
				bean.setUtente(rs.getString("utente"));
				
				
				orders.add(bean);
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
		return orders;
	}


}
