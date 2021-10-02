package com.wemccm.common.entity;

public class FIMinputIterm extends BaseEntity {

	private Integer fIMinputSubTypeID;

	private String description;

	private String currency;

	private double unitCost;

	public Integer getfIMinputSubTypeID() {
		return fIMinputSubTypeID;
	}

	public void setfIMinputSubTypeID(Integer fIMinputSubTypeID) {
		this.fIMinputSubTypeID = fIMinputSubTypeID;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public double getUnitCost() {
		return unitCost;
	}

	public void setUnitCost(double unitCost) {
		this.unitCost = unitCost;
	}

}
