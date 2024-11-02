package load_product.entity;

import java.util.Set;

public class CardProduct extends Product{
	private int quantity;
	private float totalQuantity;

	public CardProduct(int quantity, float totalQuantity) {
		super();
		this.quantity = quantity;
		this.totalQuantity = totalQuantity;
	}

	public CardProduct(int quantity) {
		super();
		this.quantity = quantity;
	}

	public CardProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public CardProduct(Integer proId, String name_product, float price, String ava, String description,
			Category category, Producer producer, Categorize categorize, Set<Images> images) {
		super(proId, name_product, price, ava, description, category, producer, categorize, images);
		// TODO Auto-generated constructor stub
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(float totalQuantity) {
		this.totalQuantity = totalQuantity;
	}
	public float total() {
		this.totalQuantity = this.quantity*super.getPrice();
		
		return this.totalQuantity;
	}
	
	
}
