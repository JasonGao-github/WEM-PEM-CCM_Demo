package com.wemccm.common.entity;

public class NonContestableOtherCostsItem extends BaseEntity {

	private Integer nonContestableTypeId;
	private String unit;
	private Double rate;
	private String description;


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

	public Double getRate() {
		return rate;
	}

	public void setRate(Double rate) {
		this.rate = rate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
