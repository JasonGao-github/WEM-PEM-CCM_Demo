package com.wemccm.common.entity;

public class NonContestableOtherCosts extends BaseEntity {

	private Integer projectId;
	private Integer nonContestableOtherCostsItemId;
	private String unit;
	private Double rate;
	private Integer quantity;
	private double total;

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

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public Integer getNonContestableOtherCostsItemId() {
		return nonContestableOtherCostsItemId;
	}

	public void setNonContestableOtherCostsItemId(Integer nonContestableOtherCostsItemId) {
		this.nonContestableOtherCostsItemId = nonContestableOtherCostsItemId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

}
