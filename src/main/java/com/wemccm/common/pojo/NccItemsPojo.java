package com.wemccm.common.pojo;

import com.wemccm.common.entity.NonContestableOtherCosts;

public class NccItemsPojo extends NonContestableOtherCosts {

	private String unit;
	private Double rate;
	
	private Double itermTotal;
	private String description;

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
		return itermTotal;
	}

	public void setTotal(Double itermTotal) {
		this.itermTotal = itermTotal;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
