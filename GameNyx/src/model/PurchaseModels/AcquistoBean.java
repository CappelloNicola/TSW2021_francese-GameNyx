package model.PurchaseModels;

import java.sql.Date;
import java.util.ArrayList;

public class AcquistoBean {
	private int numeroOrdine;
	private double prezzo;
	private String stato;
	private String indirizzo;
	private int numeroCivico;
	private int cap;
	private String citta;
	private String provincia;
	private Date dataOrdine;
	private String utente;
	private ArrayList<ProductBeanCart> videogiochi;
	
	//Setter
	public void setNumeroOrdine(int num)
	{
		numeroOrdine=num;
	}
	
	//questo setter setta il prezzo in base ai videogiochi acquistati
	public void setPrezzoAuto()
	{
		prezzo=0;
		for(int i=0; i<videogiochi.size(); i++)
		{
			ProductBeanCart v=videogiochi.get(i);
			prezzo=prezzo+(v.getPrezzoTotale()*v.getCartQuantity());
		}
	}
	
	public void setNumeroCivico(int newNCivico)
	{
		numeroCivico=newNCivico;
	}
	
	public void setCap(int newCap)
	{
		cap=newCap;
	}
	
	public void setCitta(String newCitta)
	{
		citta=newCitta;
	}
	
	public void setProvicia(String newProvincia)
	{
		provincia=newProvincia;
	}
	
	public void setPrezzo(double prezzo)
	{
		this.prezzo=prezzo;
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
	
	public int getNumeroCivico()
	{
		return numeroCivico;
	}
	
	public int getCap()
	{
		return cap;
	}
	
	public String getCitta()
	{
		return citta;
	}
	
	public String getProvincia()
	{
		return provincia;
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
