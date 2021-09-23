package com.wemccm.common.pojo;

public class NonContestableOtherCostsDetailPojo {
	
	
//	NonContestableOtherCostsItem
//	private Integer projectId;
	private Integer nonContestableTypeId;
	private String unit;
	private Double rate;
	private Double total;
	private String description;
	
//		NonContestableType
	private String name;

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

	public Double getNonContestableOtherCostsItemTotal() {
		return total;
	}

	public void setNonContestableOtherCostsItemTotal(Double total) {
		this.total = total;
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
