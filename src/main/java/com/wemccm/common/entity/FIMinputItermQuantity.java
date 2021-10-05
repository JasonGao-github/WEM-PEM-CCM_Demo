package com.wemccm.common.entity;

public class FIMinputItermQuantity extends BaseEntity {

	private Integer projectId;
	private Integer fIMinputItermId;

	private String currency;

	private double unitCost;

	private Integer acturalQuantity;
	private Integer jenFoundedQuantity;
	private Integer lctaQuantity;
	private double acturalSubTotal;
	private double jenFoundedTotal;
	private double lctaTotal;

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

	public Integer getActuralQuantity() {
		return acturalQuantity;
	}

	public void setActuralQuantity(Integer acturalQuantity) {
		this.acturalQuantity = acturalQuantity;
	}

	public Integer getJenFoundedQuantity() {
		return jenFoundedQuantity;
	}

	public void setJenFoundedQuantity(Integer jenFoundedQuantity) {
		this.jenFoundedQuantity = jenFoundedQuantity;
	}

	public Integer getLctaQuantity() {
		return lctaQuantity;
	}

	public void setLctaQuantity(Integer lctaQuantity) {
		this.lctaQuantity = lctaQuantity;
	}

	public double getActuralSubTotal() {
		return acturalSubTotal;
	}

	public void setActuralSubTotal(double acturalSubTotal) {
		this.acturalSubTotal = acturalSubTotal;
	}

	public double getJenFoundedTotal() {
		return jenFoundedTotal;
	}

	public void setJenFoundedTotal(double jenFoundedTotal) {
		this.jenFoundedTotal = jenFoundedTotal;
	}

	public double getLctaTotal() {
		return lctaTotal;
	}

	public void setLctaTotal(double lctaTotal) {
		this.lctaTotal = lctaTotal;
	}

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

}
