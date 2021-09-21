package com.wemccm.common.entity;

public class NonContestableProjectComponent extends BaseEntity {

	private Integer projecTypeId;
	private double cost;
	private String description;

	public Integer getProjecTypeId() {
		return projecTypeId;
	}

	public void setProjecTypeId(Integer projecTypeId) {
		this.projecTypeId = projecTypeId;
	}

	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
