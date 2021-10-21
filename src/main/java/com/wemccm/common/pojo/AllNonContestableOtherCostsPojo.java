package com.wemccm.common.pojo;

public class AllNonContestableOtherCostsPojo {
	private Integer id;
	private Integer nonContestableOtherCostsItemId;

	private String unit;
	private Double rate;
	private Integer quantity;
	private Double total;
	
	private Integer nonContestableTypeId;
	private String description;
	
	private String name;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getNonContestableOtherCostsItemId() {
		return nonContestableOtherCostsItemId;
	}

	public void setNonContestableOtherCostsItemId(Integer nonContestableOtherCostsItemId) {
		this.nonContestableOtherCostsItemId = nonContestableOtherCostsItemId;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Double getRate() {
		return rate;
	}

	public void setRate(Double rate) {
		this.rate = rate;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public Integer getNonContestableTypeId() {
		return nonContestableTypeId;
	}

	public void setNonContestableTypeId(Integer nonContestableTypeId) {
		this.nonContestableTypeId = nonContestableTypeId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
