package com.wemccm.common.entity;

public class AvoidedCostassetReplacementIterm extends BaseEntity {

	private String name;
	private Integer stdLife;
	private String unit;
	private Double unitCost;
	private Double maintenanceCost;
	private Double vegetationManagementCost;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getStdLife() {
		return stdLife;
	}

	public void setStdLife(Integer stdLife) {
		this.stdLife = stdLife;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Double getUnitCost() {
		return unitCost;
	}

	public void setUnitCost(Double unitCost) {
		this.unitCost = unitCost;
	}

	public Double getMaintenanceCost() {
		return maintenanceCost;
	}

	public void setMaintenanceCost(Double maintenanceCost) {
		this.maintenanceCost = maintenanceCost;
	}

	public Double getVegetationManagementCost() {
		return vegetationManagementCost;
	}

	public void setVegetationManagementCost(Double vegetationManagementCost) {
		this.vegetationManagementCost = vegetationManagementCost;
	}

}
