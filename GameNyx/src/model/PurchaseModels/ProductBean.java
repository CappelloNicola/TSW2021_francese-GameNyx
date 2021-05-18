package model.PurchaseModels;
import java.sql.Date;


public class ProductBean 
{
	int id;
	String titolo;
	String descrizione;
	String casaProduttrice;
	String piattaforma;
	String genere;
	Date dataPubblicazione;
	double prezzo;
	double iva;
	String lingua;
	String sottotitoli;
	int numeroValutazioni;
	double mediaValutazioni; //compreso tra 0 e 5 stelle
	int numeroVendite;
	
	public double getPrezzoTotale()
	{
		double prezzoIva=prezzo + ((prezzo*iva)/100);
		double val=Math.floor(prezzoIva * 100) / 100;
		return val;
	}
	
	public int getId()
	{
		return id;
	}
	
	public String getTitolo() 
	{
		return titolo;
	}
	
	public String getDescrizione()
	{
		return descrizione;
	}
	
	public String getCasaProduttrice() 
	{
		return casaProduttrice;
	}
	
	public String getPiattaforma()
	{
		return piattaforma;
	}
	
	public String getGenere()
	{
		return genere;
	}
	
	public Date getDataPubblicazione()
	{
		return dataPubblicazione;
	}
	
	public double getPrezzo() 
	{
		return prezzo;
	}
	
	public double getIva()
	{
		return iva;
	}
	
	public String getLingua()
	{
		return lingua;
	}
	
	public String getSottotitoli()
	{
		return sottotitoli;
	}
	
	public int getNumeroValutazioni()
	{
		return numeroValutazioni;
	}
	
	public double getMediaValutazioni()
	{
		return mediaValutazioni;
	}
	
	public int getNumeroVendite() 
	{
		return numeroVendite;
	}
	
	public void setId(int newId)
	{
		id=newId;
	}
	
	public void setTitolo(String newTitolo) 
	{
		titolo=newTitolo;
	}
	
	public void setDescrizione(String newDescrizione)
	{
		descrizione=newDescrizione;
	}
	
	public void setCasaProduttrice(String newCasaProduttrice) 
	{
		casaProduttrice=newCasaProduttrice;
	}
	
	public void setPiattaforma(String newPiattaforma)
	{
		piattaforma=newPiattaforma;
	}
	
	public void setGenere(String newGenere)
	{
		genere=newGenere;
	}
	
	public void setDataPubblicazione(Date newDataPubblicazione)
	{
		dataPubblicazione=newDataPubblicazione;
	}
	
	public void setPrezzo(double newPrezzo) 
	{
		prezzo=newPrezzo;
	}
	
	public void setIva(double newIva)
	{
		iva=newIva;
	}
	
	public void setLingua(String newLingua)
	{
		lingua=newLingua;
	}
	
	public void setSottotitoli(String newSottotitoli)
	{
		sottotitoli=newSottotitoli;
	}
	
	public void setNumeroValutazioni(int newNumeroValutazioni)
	{
		numeroValutazioni=newNumeroValutazioni;
	}
	
	public void setMediaValutazioni(double newMediaValutazioni)
	{
		mediaValutazioni=newMediaValutazioni;
	}
	
	public void setNumeroVendite(int newNumeroVendite) 
	{
		numeroVendite=newNumeroVendite;
	}
	
}
