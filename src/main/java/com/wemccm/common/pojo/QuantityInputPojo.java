package com.wemccm.common.pojo;

public class QuantityInputPojo {
	private Integer id;
	private Integer projectId;

	private Integer quantityInputItemId;

	private Integer quantityInputTypeId;// Actural Recoverable Jemana LCTA

	private Integer quatity;

	private Double cost;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

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
