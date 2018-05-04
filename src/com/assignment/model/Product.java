package com.assignment.model;

public class Product {

	private int productId;
	private int quantity;
	private String itemID;
	private String salesRep;
	
	public Product() {
		
	}
	public Product(int quantity, String itemID) {
		super();

		this.quantity = quantity;
		this.itemID = itemID;

	}
	public Product(int productId, int quantity, String itemID, String salesRep) {
		super();
		this.productId = productId;
		this.quantity = quantity;
		this.itemID = itemID;
		this.salesRep = salesRep;
	}
	@Override
	public String toString() {
		return "Product [productId=" + productId + ", quantity=" + quantity + ", itemID=" + itemID + ", salesRep="
				+ salesRep + "]";
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getItemID() {
		return itemID;
	}
	public void setItemID(String itemID) {
		this.itemID = itemID;
	}
	public String getSalesRep() {
		return salesRep;
	}
	public void setSalesRep(String salesRep) {
		this.salesRep = salesRep;
	}
	
}
