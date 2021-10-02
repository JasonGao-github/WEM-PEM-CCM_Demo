package com.wemccm.common.entity;

public class AvoidedCostMaintenanceCosts extends BaseEntity {

	private Integer projectId;
	private String name;
	private String source;
	private String maint;
	private String vegMgt;
	private Integer unit;
	private Integer quantity;
	private Double costPa;
	private Double ameExist;
	private Integer avoidedCostInputTypeId;

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getMaint() {
		return maint;
	}

	public void setMaint(String maint) {
		this.maint = maint;
	}

	public String getVegMgt() {
		return vegMgt;
	}

	public void setVegMgt(String vegMgt) {
		this.vegMgt = vegMgt;
	}

	public Integer getUnit() {
		return unit;
	}

	public void setUnit(Integer unit) {
		this.unit = unit;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Double getCostPa() {
		return costPa;
	}

	public void setCostPa(Double costPa) {
		this.costPa = costPa;
	}

	public Double getAmeExist() {
		return ameExist;
	}

	public void setAmeExist(Double ameExist) {
		this.ameExist = ameExist;
	}

	public Integer getAvoidedCostInputTypeId() {
		return avoidedCostInputTypeId;
	}

	public void setAvoidedCostInputTypeId(Integer avoidedCostInputTypeId) {
		this.avoidedCostInputTypeId = avoidedCostInputTypeId;
	}


}
