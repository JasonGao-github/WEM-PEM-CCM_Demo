package com.wemccm.common.pojo;

public class QuantityInputItermDetailPojo {

	// 来自 QuantityInputItermSubTypePrice
	private Integer quantityInputItemId;
	private Integer quantityInputSubTypeId;
	// 通过QuantityInputItermSubTypePrice中的外键查询SubType中的名字
	private String quantityInputSubTypeName;
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

	public String getQuantityInputSubTypeName() {
		return quantityInputSubTypeName;
	}

	public void setQuantityInputSubTypeName(String quantityInputSubTypeName) {
		this.quantityInputSubTypeName = quantityInputSubTypeName;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

}
