package com.wemccm.common.pojo;

public class AllAvoidedCostassetPojo {
	private Integer projectId;
	private String type;
	private String name;
	private String source;
	private Double unitCost;
	private String unit;
	private Integer quantity;
	private Double totalCost;
	private Integer assetAge;
	private Double stdLife;
	private Double remLife;
	private Double presentValueRC;
	private Integer avoidedCostassetReplacementItermId;
	
//	private String name;
//	private Integer stdLife;
//	private String unit;
//	private Double unitCost;
	private Double maintenanceCost;
	private Double vegetationManagementCost;
	public Integer getProjectId() {
		return projectId;
	}
	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public Double getUnitCost() {
		return unitCost;
	}
	public void setUnitCost(Double unitCost) {
		this.unitCost = unitCost;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Double getTotalCost() {
		return totalCost;
	}
	public void setTotalCost(Double totalCost) {
		this.totalCost = totalCost;
	}
	public Integer getAssetAge() {
		return assetAge;
	}
	public void setAssetAge(Integer assetAge) {
		this.assetAge = assetAge;
	}
	public Double getStdLife() {
		return stdLife;
	}
	public void setStdLife(Double stdLife) {
		this.stdLife = stdLife;
	}
	public Double getRemLife() {
		return remLife;
	}
	public void setRemLife(Double remLife) {
		this.remLife = remLife;
	}
	public Double getPresentValueRC() {
		return presentValueRC;
	}
	public void setPresentValueRC(Double presentValueRC) {
		this.presentValueRC = presentValueRC;
	}
	public Integer getAvoidedCostassetReplacementItermId() {
		return avoidedCostassetReplacementItermId;
	}
	public void setAvoidedCostassetReplacementItermId(Integer avoidedCostassetReplacementItermId) {
		this.avoidedCostassetReplacementItermId = avoidedCostassetReplacementItermId;
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
