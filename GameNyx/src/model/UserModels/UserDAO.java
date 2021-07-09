package model.UserModels;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class UserDAO 
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

	private static final String TABLE_NAME = "utente";
	
	//Metodo per verificare il login dell'utente --> output: user.isvalid(true) + user info se l'accesso � valido
	public static UserBean doRetrieve(UserBean beanInput) 
	{
		
		  Connection connection = null;
	      PreparedStatement preparedStatement = null;
		
	      String username = beanInput.getUsername();    
	      String passwordUtente = beanInput.getPasswordUtente();   
		    
	      String searchQuery =
	            "select * from "+TABLE_NAME+" where username=? and passwordUtente=?";
	               
		  
	   
	   UserBean bean = new UserBean();
	   
	   try 
	   {
		   connection=ds.getConnection();
		   preparedStatement=connection.prepareStatement(searchQuery);
		   preparedStatement.setString(1, username);
		   preparedStatement.setString(2, passwordUtente);
		   
		   ResultSet rs = preparedStatement.executeQuery();
		   
		   
		   if(rs.next())
		   {	   
			    bean.setIsValid(true);
			    bean.setEmail(rs.getString("email"));
				bean.setUsername(rs.getString("username"));
				bean.setPasswordUtente(rs.getString("passwordUtente"));
				bean.setNome(rs.getString("nome"));
				bean.setCognome(rs.getString("cognome"));
				bean.setTelefono(rs.getString("telefono"));
				bean.setData(rs.getDate("dataDiNascita"));
				bean.setAdmin(rs.getBoolean("isadmin"));
		   }
		   else
		   {
			   bean.setIsValid(false);
		   }	   
			  
		}  

	   catch (Exception ex) 
	   {
	      System.out.println("Log In failed: An Exception has occurred! " + ex);
	   } 
	   
	   return bean;
	}


	public synchronized void doSave(UserBean user) throws SQLException, Exception
	{

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + TABLE_NAME
				+ " (email, nome, cognome, username,"
				+ "  passwordUtente, dataDiNascita, telefono, isadmin) "
				+ "  VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, user.getEmail());
			preparedStatement.setString(2, user.getNome());
			preparedStatement.setString(3, user.getCognome());
			preparedStatement.setString(4, user.getUsername());
			preparedStatement.setString(5, user.getPasswordUtente());
			preparedStatement.setDate(6, user.getDataNascita());
			preparedStatement.setString(7, user.getTelefono());
			preparedStatement.setBoolean(8, user.getAdmin());

			
			preparedStatement.executeUpdate();


			} 
			finally 
			{
				try 
				{
					if (preparedStatement != null)
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
	 * Ritorna l'UserBean se esiste, altrimenti null
	 * */
	public synchronized UserBean doRetrieveByKey(String username) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		UserBean bean = new UserBean();

		String selectSQL = "SELECT * FROM " +TABLE_NAME + " WHERE username = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, username);

			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				bean.setEmail(rs.getString("email"));
				bean.setUsername(rs.getString("username"));
				bean.setPasswordUtente(rs.getString("passwordUtente"));
				bean.setNome(rs.getString("nome"));
				bean.setCognome(rs.getString("cognome"));
				bean.setTelefono(rs.getString("telefono"));
				bean.setData(rs.getDate("dataDiNascita"));
				bean.setAdmin(rs.getBoolean("isadmin"));
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

	public synchronized UserBean doRetrieveByEmail(String email) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		UserBean bean = new UserBean();

		String selectSQL = "SELECT * FROM " +TABLE_NAME + " WHERE email = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, email);

			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				bean.setEmail(rs.getString("email"));
				bean.setUsername(rs.getString("username"));
				bean.setPasswordUtente(rs.getString("passwordUtente"));
				bean.setNome(rs.getString("nome"));
				bean.setCognome(rs.getString("cognome"));
				bean.setTelefono(rs.getString("telefono"));
				bean.setData(rs.getDate("dataDiNascita"));
				bean.setAdmin(rs.getBoolean("isadmin"));
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
	
	public synchronized boolean doDelete(String username) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE username = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, username);

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

	
	public synchronized ArrayList<UserBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<UserBean> users = new ArrayList<UserBean>();

		String selectSQL = "SELECT * FROM " + TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				UserBean bean = new UserBean();

				bean.setEmail(rs.getString("email"));
				bean.setUsername(rs.getString("username"));
				bean.setPasswordUtente(rs.getString("passwordUtente"));
				bean.setNome(rs.getString("nome"));
				bean.setCognome(rs.getString("cognome"));
				bean.setTelefono(rs.getString("telefono"));
				bean.setData(rs.getDate("dataDiNascita"));
				bean.setAdmin(rs.getBoolean("isadmin"));
				
				users.add(bean);
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
		return users;
	}


}
