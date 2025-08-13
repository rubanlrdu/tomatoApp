package com.tomato.models;

public class CartItemModel {
	
	private int id;
	private int restuarantId;
	private String name;
	private int price;
	private int quantity;
	
	public CartItemModel()
	{
		
	}
	public CartItemModel(int id, String name, int price, int quantity) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
	}
	
	
	
	public CartItemModel(int id, int restuarantId, String name, int price, int quantity) {
		super();
		this.id = id;
		this.restuarantId = restuarantId;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
	}
	public int getRestuarantId() {
		return restuarantId;
	}
	public void setRestuarantId(int restuarantId) {
		this.restuarantId = restuarantId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "CartItemModel [id=" + id + ", name=" + name + ", price=" + price + ", quantity=" + quantity + "]";
	}
	
	

}
