package com.wemccm.common.pojo;

public class QuantityInputGroupDataPojo {

	private String code;
	private String description;
	private Integer quantityInputBasicDataId;

	private String unit;
	private double labour;
	private double material;
	private double plant;
	private double subcontract;
	private double unitRate;
	private double manhours;

	private Integer actualsQty;
	private Integer recouverableQty;
	private Integer jemenaQty;
	private Integer lcatQty;
	private Double actualsSubTotal;
	private Double recouverableSubTotal;
	private Double jemenaSubTotal;
	private Double lcatSubTotal;

	public Integer getQuantityInputBasicDataId() {
		return quantityInputBasicDataId;
	}

	public void setQuantityInputBasicDataId(Integer quantityInputBasicDataId) {
		this.quantityInputBasicDataId = quantityInputBasicDataId;
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

	public Integer getActualsQty() {
		return actualsQty;
	}

	public void setActualsQty(Integer actualsQty) {
		this.actualsQty = actualsQty;
	}

	public Integer getRecouverableQty() {
		return recouverableQty;
	}

	public void setRecouverableQty(Integer recouverableQty) {
		this.recouverableQty = recouverableQty;
	}

	public Integer getJemenaQty() {
		return jemenaQty;
	}

	public void setJemenaQty(Integer jemenaQty) {
		this.jemenaQty = jemenaQty;
	}

	public Integer getLcatQty() {
		return lcatQty;
	}

	public void setLcatQty(Integer lcatQty) {
		this.lcatQty = lcatQty;
	}

	public Double getActualsSubTotal() {
		return actualsSubTotal;
	}

	public void setActualsSubTotal(Double actualsSubTotal) {
		this.actualsSubTotal = actualsSubTotal;
	}

	public Double getRecouverableSubTotal() {
		return recouverableSubTotal;
	}

	public void setRecouverableSubTotal(Double recouverableSubTotal) {
		this.recouverableSubTotal = recouverableSubTotal;
	}

	public Double getJemenaSubTotal() {
		return jemenaSubTotal;
	}

	public void setJemenaSubTotal(Double jemenaSubTotal) {
		this.jemenaSubTotal = jemenaSubTotal;
	}

	public Double getLcatSubTotal() {
		return lcatSubTotal;
	}

	public void setLcatSubTotal(Double lcatSubTotal) {
		this.lcatSubTotal = lcatSubTotal;
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

}
