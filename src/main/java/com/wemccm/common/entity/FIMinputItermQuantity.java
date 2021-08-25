package com.wemccm.common.entity;

public class FIMinputItermQuantity extends BaseEntity {

	private Integer projectId;
	private Integer fIMinputItermId;
	private Integer fIMinputItermTypeId;
	private Integer quantity;
	private double cost;

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public Integer getfIMinputItermId() {
		return fIMinputItermId;
	}

	public void setfIMinputItermId(Integer fIMinputItermId) {
		this.fIMinputItermId = fIMinputItermId;
	}

	public Integer getfIMinputItermTypeId() {
		return fIMinputItermTypeId;
	}

	public void setfIMinputItermTypeId(Integer fIMinputItermTypeId) {
		this.fIMinputItermTypeId = fIMinputItermTypeId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}

}
