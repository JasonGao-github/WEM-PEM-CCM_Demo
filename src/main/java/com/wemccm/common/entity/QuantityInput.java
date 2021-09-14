package com.wemccm.common.entity;

public class QuantityInput extends BaseEntity {

	private Integer projectId;

	private Integer quantityInputItemId;

	private Integer quantityInputTypeId;// Actural Recoverable Jemana LCTA

	private Integer quatity;

	private Double cost;

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public Integer getQuantityInputItemId() {
		return quantityInputItemId;
	}

	public void setQuantityInputItemId(Integer quantityInputItemId) {
		this.quantityInputItemId = quantityInputItemId;
	}

	public Integer getQuantityInputTypeId() {
		return quantityInputTypeId;
	}

	public void setQuantityInputTypeId(Integer quantityInputTypeId) {
		this.quantityInputTypeId = quantityInputTypeId;
	}

	public Integer getQuatity() {
		return quatity;
	}

	public void setQuatity(Integer quatity) {
		this.quatity = quatity;
	}

	public Double getCost() {
		return cost;
	}

	public void setCost(Double cost) {
		this.cost = cost;
	}

}
