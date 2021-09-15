package com.wemccm.common.pojo;

public class QuantityInputItermDetailPojo {

	// //QuantityInputItermSubTypePrice
	private Integer quantityInputItemId;
	private Integer quantityInputSubTypeId;
	private double price;
	
	//QuantityInputSubType
	//id
	private Integer quantityInputTypeId;
	private String name;
	
	
	public Integer getQuantityInputItemId() {
		return quantityInputItemId;
	}
	public void setQuantityInputItemId(Integer quantityInputItemId) {
		this.quantityInputItemId = quantityInputItemId;
	}
	public Integer getQuantityInputSubTypeId() {
		return quantityInputSubTypeId;
	}
	public void setQuantityInputSubTypeId(Integer quantityInputSubTypeId) {
		this.quantityInputSubTypeId = quantityInputSubTypeId;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Integer getQuantityInputTypeId() {
		return quantityInputTypeId;
	}
	public void setQuantityInputTypeId(Integer quantityInputTypeId) {
		this.quantityInputTypeId = quantityInputTypeId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	

	

}
