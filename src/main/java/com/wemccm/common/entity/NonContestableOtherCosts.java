package com.wemccm.common.entity;

public class NonContestableOtherCosts extends BaseEntity {

	private Integer projectId;
	private Integer nonContestableTypeId;
	private String unit;
	private Integer quantity;
	private Double rate;
	private Double total;
	private String description;

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public Integer getNonContestableTypeId() {
		return nonContestableTypeId;
	}

	public void setNonContestableTypeId(Integer nonContestableTypeId) {
		this.nonContestableTypeId = nonContestableTypeId;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Double getRate() {
		return rate;
	}

	public void setRate(Double rate) {
		this.rate = rate;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
