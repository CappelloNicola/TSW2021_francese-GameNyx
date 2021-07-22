package model.PurchaseModels;

import java.util.ArrayList;

public class Cart 
{
	private ArrayList<ProductBeanCart> productsCart;
	
	public Cart()
	{
		productsCart = new ArrayList<ProductBeanCart>();
	}
	
	private static ProductBeanCart ProductCartConverter(ProductBean e)
	{
		ProductBeanCart product=new ProductBeanCart();
		product.setId(e.getId());
		product.setTitolo(e.getTitolo());
		product.setDescrizione(e.getDescrizione());
		product.setCasaProduttrice(e.getCasaProduttrice());
		product.setPiattaforma(e.getPiattaforma());  
		product.setGenere(e.getGenere());
		product.setDataPubblicazione(e.getDataPubblicazione());
		product.setPrezzo(e.getPrezzo());
		product.setIva(e.getIva());
		product.setLingua(e.getLingua());
		product.setSottotitoli(e.getSottotitoli());
		product.setNumeroValutazioni(e.getNumeroValutazioni());
		product.setMediaValutazioni(e.getMediaValutazioni());
		product.setNumeroVendite(e.getNumeroVendite());
		product.setCartQuantity(0);
		product.setQuantitaNegozio(e.getQuantitaNegozio());		
		return product;
	}
	
	public ProductBeanCart getProduct(int index)
	{
		if(index>=0 && index<getSize())
		{
			return productsCart.get(index);
		}
		return null;
	}
	
	public ArrayList<ProductBeanCart> getProducts()
	{
		return productsCart;
	}
	
	public int getSize()
	{
		return productsCart.size();
	}
	
	public void addToCart(ProductBean e) 
	{
		ProductBeanCart toAdd=ProductCartConverter(e);
		
			
		//Cerca prodotto gi� presente nel carrello; Se presente aggiorna la quantit� a +1
			for(int i=0; i<productsCart.size(); i++)
			{
				if(productsCart.get(i).getId()==toAdd.getId())
				{
					ProductBeanCart temp=productsCart.get(i);
					
					temp.setCartQuantity(temp.getCartQuantity()+1);
					return;
				
				}
			}
			
		//Prodotto non presente nel carrello --> aggiungi prodotto al carrello
			toAdd.setCartQuantity(1);
			productsCart.add(toAdd);
	}

	public int getCartTotalQuantity()
	{
		int quantity = 0;

		for(ProductBeanCart e : productsCart)
		{
			quantity += e.getCartQuantity();
		}

		return quantity;
	}
		
	
	
	public void removeFromCart(int id)
	{
		for(int i=0; i<productsCart.size(); i++)
		{
			if(productsCart.get(i).getId()==id)
			{
				productsCart.remove(i);
				return;
			}
		}
	}
	
	public void resetCart()
	{
		productsCart=new ArrayList<ProductBeanCart>();
	}
	
	public void modifyQuantity(int id, int newQuantity)
	{	
		if(newQuantity<=0)
		{
			removeFromCart(id);
		}
		else
		{
			for(int i=0; i<productsCart.size(); i++)
			{
				if(productsCart.get(i).getId()==id)
				{
					ProductBeanCart temp=productsCart.get(i);
					temp.setCartQuantity(newQuantity);
					return;
				}
			}
		}
	}

}
