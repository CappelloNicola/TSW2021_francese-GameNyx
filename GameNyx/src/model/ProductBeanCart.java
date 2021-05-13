package model;

public class ProductBeanCart extends ProductBean{
	
	private int cartQuantity;
	
	public void setCartQuantity(int newQuantity)
	{
		cartQuantity=newQuantity;
	}
	
	public int getCartQuantity()
	{
		return cartQuantity;
	}
	
}
