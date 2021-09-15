package com.wemccm.common.pojo;

public class ThreeQuantityInputItermTable {
//QuantityInputItermSubTypePrice
	private Integer id;
	private Integer quantityInputItemId;
	private Integer quantityInputSubTypeId;
	private double price;
	
	//QuantityInputIterm
	//id
	private Integer projectId;
	private Integer quantityInputItermTypeId;   //key
	private String code;
	private String description;
	private String unit;
	
	//QuantityInputSubType
	//id
	private Integer quantityInputTypeId;
	private String name;
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
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
	public Integer getProjectId() {
		return projectId;
	}
	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}
	public Integer getQuantityInputItermTypeId() {
		return quantityInputItermTypeId;
	}
	public void setQuantityInputItermTypeId(Integer quantityInputItermTypeId) {
		this.quantityInputItermTypeId = quantityInputItermTypeId;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
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
