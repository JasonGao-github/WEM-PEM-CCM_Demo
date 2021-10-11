package com.wemccm.common.entity;

public class QuantityInputBasicData extends BaseEntity {

	private Integer quantityInputItermGroupId;
	private String code;
	private String description;
	private String unit;
	
	
	private double labour;
	private double material;
	private double plant;
	private double subcontract;
	
	
	private double unitRate;
	private double manhours;

	public Integer getQuantityInputItermGroupId() {
		return quantityInputItermGroupId;
	}

	public void setQuantityInputItermGroupId(Integer quantityInputItermGroupId) {
		this.quantityInputItermGroupId = quantityInputItermGroupId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public double getLabour() {
		return labour;
	}

	public void setLabour(double labour) {
		this.labour = labour;
	}

	public double getMaterial() {
		return material;
	}

	public void setMaterial(double material) {
		this.material = material;
	}

	public double getPlant() {
		return plant;
	}

	public void setPlant(double plant) {
		this.plant = plant;
	}

	public double getSubcontract() {
		return subcontract;
	}

	public void setSubcontract(double subcontract) {
		this.subcontract = subcontract;
	}

	public double getUnitRate() {
		return unitRate;
	}

	public void setUnitRate(double unitRate) {
		this.unitRate = unitRate;
	}

	public double getManhours() {
		return manhours;
	}

	public void setManhours(double manhours) {
		this.manhours = manhours;
	}

}
