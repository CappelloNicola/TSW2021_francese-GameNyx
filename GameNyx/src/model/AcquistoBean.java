package model;

import java.sql.Date;
import java.util.ArrayList;

public class AcquistoBean {
	private int numeroOrdine;
	private double prezzo;
	private String stato;
	private String indirizzo;
	private Date dataOrdine;
	private String utente;
	private ArrayList<ProductBeanCart> videogiochi;
	
	//Setter
	public void setNumeroOrdine(int num)
	{
		numeroOrdine=num;
	}
	
	public void setPrezzo(double num)
	{
		prezzo=num;
	}
	
	public void setStato(String stato)
	{
		this.stato=stato;
	}
	
	public void setIndirizzo(String ind)
	{
		indirizzo=ind;
	}
	
	public void setDataOrdine(Date data)
	{
		dataOrdine=data;
	}
	
	public void setUtente(String user)
	{
		utente=user;
	}
	
	public void setVideogiochi(ArrayList<ProductBeanCart> lista)
	{
		videogiochi=lista;
	}
	//-------Getter
	public int getNumeroOrdine()
	{
		return numeroOrdine;
	}
	
	public double getPrezzo()
	{
		return prezzo;
	}
	
	public String getStato()
	{
		return stato;
	}
	
	public String getIndirizzo()
	{
		return indirizzo;
	}
	
	public Date getDataOrdine()
	{
		return dataOrdine;
	}
	
	public String getUtente()
	{
		return utente;
	}
	
	public ArrayList<ProductBeanCart> getVideogiochi()
	{
		return videogiochi;
	}
}
