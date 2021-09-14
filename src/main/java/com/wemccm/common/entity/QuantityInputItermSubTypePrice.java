package com.wemccm.common.entity;

public class QuantityInputItermSubTypePrice extends BaseEntity {

	private Integer quantityInputItemId;
	private Integer quantityInputSubTypeId;
	private double price;

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

}
