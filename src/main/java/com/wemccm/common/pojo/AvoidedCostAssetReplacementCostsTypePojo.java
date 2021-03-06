package com.wemccm.common.pojo;

public class AvoidedCostAssetReplacementCostsTypePojo {
	private Integer id;
	private Integer projectId;
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

	private String replacementItermName; // avoidedcostassetreplacementiterm

	public Integer getAvoidedCostassetReplacementItermId() {
		return avoidedCostassetReplacementItermId;
	}

	public void setAvoidedCostassetReplacementItermId(Integer avoidedCostassetReplacementItermId) {
		this.avoidedCostassetReplacementItermId = avoidedCostassetReplacementItermId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

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

	public String getReplacementItermName() {
		return replacementItermName;
	}

	public void setReplacementItermName(String replacementItermName) {
		this.replacementItermName = replacementItermName;
	}

}
