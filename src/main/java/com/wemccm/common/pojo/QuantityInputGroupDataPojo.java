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

	public Integer getQuantityInputBasicDataId() {
		return quantityInputBasicDataId;
	}

	public void setQuantityInputBasicDataId(Integer quantityInputBasicDataId) {
		if (null == quantityInputBasicDataId) {
			quantityInputBasicDataId = 0;
		}

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

	public void setLabour(Double labour) {
		if (null == labour) {
			labour = 0d;
		}

		this.labour = labour;
	}

	public double getMaterial() {
		return material;
	}

	public void setMaterial(Double material) {
		if (null == material) {
			material = 0d;
		}

		this.material = material;
	}

	public double getPlant() {
		return plant;
	}

	public void setPlant(Double plant) {
		if (null == plant) {
			plant = 0d;
		}

		this.plant = plant;
	}

	public double getSubcontract() {
		return subcontract;
	}

	public void setSubcontract(Double subcontract) {
		if (null == subcontract) {
			subcontract = 0d;
		}

		this.subcontract = subcontract;
	}

	public double getUnitRate() {
		return unitRate;
	}

	public void setUnitRate(Double unitRate) {
		if (null == unitRate) {
			unitRate = 0d;
		}

		this.unitRate = unitRate;
	}

	public double getManhours() {
		return manhours;
	}

	public void setManhours(Double manhours) {
		if (null == manhours) {
			manhours = 0d;
		}

		this.manhours = manhours;
	}

	public Integer getActualsQty() {
		return actualsQty;
	}

	public void setActualsQty(Integer actualsQty) {
		if (null == actualsQty) {
			actualsQty = 0;
		}

		this.actualsQty = actualsQty;
	}

	public Integer getRecouverableQty() {
		return recouverableQty;
	}

	public void setRecouverableQty(Integer recouverableQty) {
		if (null == recouverableQty) {
			recouverableQty = 0;
		}

		this.recouverableQty = recouverableQty;
	}

	public Integer getJemenaQty() {
		return jemenaQty;
	}

	public void setJemenaQty(Integer jemenaQty) {
		if (null == jemenaQty) {
			jemenaQty = 0;
		}

		this.jemenaQty = jemenaQty;
	}

	public Integer getLcatQty() {
		return lcatQty;
	}

	public void setLcatQty(Integer lcatQty) {
		if (null == lcatQty) {
			lcatQty = 0;
		}

		this.lcatQty = lcatQty;
	}

	public Double getActualsSubTotal() {
		return actualsSubTotal;
	}

	public void setActualsSubTotal(Double actualsSubTotal) {
		if (null == actualsSubTotal) {
			actualsSubTotal = 0d;
		}

		this.actualsSubTotal = actualsSubTotal;
	}

	public Double getRecouverableSubTotal() {
		return recouverableSubTotal;
	}

	public void setRecouverableSubTotal(Double recouverableSubTotal) {
		if (null == recouverableSubTotal) {
			recouverableSubTotal = 0d;
		}

		this.recouverableSubTotal = recouverableSubTotal;
	}

	public Double getJemenaSubTotal() {
		return jemenaSubTotal;
	}

	public void setJemenaSubTotal(Double jemenaSubTotal) {
		if (null == jemenaSubTotal) {
			lcatSubTotal = 0d;
		}
		this.jemenaSubTotal = jemenaSubTotal;
	}

	public Double getLcatSubTotal() {
		return lcatSubTotal;
	}

	public void setLcatSubTotal(Double lcatSubTotal) {
		if (null == lcatSubTotal) {
			lcatSubTotal = 0d;
		}
		this.lcatSubTotal = lcatSubTotal;
	}

}
