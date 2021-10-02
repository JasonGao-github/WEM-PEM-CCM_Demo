package com.wemccm.common.entity;

public class NonContestableProjectComponent extends BaseEntity {

	private Integer projectTypeId;
	private double cost;
	private String description;

	public Integer getProjecTypeId() {
		return projectTypeId;
	}

	public void setProjecTypeId(Integer projecTypeId) {
		this.projectTypeId = projecTypeId;
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
