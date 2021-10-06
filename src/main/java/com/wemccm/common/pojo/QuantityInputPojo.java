package com.wemccm.common.pojo;

public class QuantityInputPojo {
	private Integer projectId;
	private Integer quantityInputBasicDataId;

	private String unit;
	private double labour;
	private double material;
	private double plant;
	private double subcontract;
	private double unitRate;
	private double manhours;

	private Integer actuals;
	private Integer recouverable;
	private Integer jemena;
	private Integer lcat;
	private Double actualsSubTotal;
	private Double recouverableSubTotal;
	private Double jemenaSubTotal;
	private Double lcatSubTotal;

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

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public Integer getQuantityInputBasicDataId() {
		return quantityInputBasicDataId;
	}

	public void setQuantityInputBasicDataId(Integer quantityInputBasicDataId) {
		this.quantityInputBasicDataId = quantityInputBasicDataId;
	}

	public Integer getActuals() {
		return actuals;
	}

	public void setActuals(Integer actuals) {
		this.actuals = actuals;
	}

	public Integer getRecouverable() {
		return recouverable;
	}

	public void setRecouverable(Integer recouverable) {
		this.recouverable = recouverable;
	}

	public Integer getJemena() {
		return jemena;
	}

	public void setJemena(Integer jemena) {
		this.jemena = jemena;
	}

	public Integer getLcat() {
		return lcat;
	}

	public void setLcat(Integer lcat) {
		this.lcat = lcat;
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

}
