package com.wemccm.common.entity;

public class AvoidedCostassetReplacementIterm extends BaseEntity {

	private String assertName;
	private Integer assertLife;
	private String units;
	private Double newAssertCost;
	private Double maintenanceCost;
	private Double vegetationManagementCost;
	

	public String getAssertName() {
		return assertName;
	}

	public void setAssertName(String assertName) {
		this.assertName = assertName;
	}

	public Integer getAssertLife() {
		return assertLife;
	}

	public void setAssertLife(Integer assertLife) {
		this.assertLife = assertLife;
	}

	public String getUnits() {
		return units;
	}

	public void setUnits(String units) {
		this.units = units;
	}

	public Double getNewAssertCost() {
		return newAssertCost;
	}

	public void setNewAssertCost(Double newAssertCost) {
		this.newAssertCost = newAssertCost;
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
