package com.wemccm.common.pojo;

import java.util.List;

public class QuantityInputDetailPojo {
	//quantityinput
	private Integer projectId;
	private Integer quantityInputBasicDataId;
	private Integer actuals;
	private Integer recouverable;
	private Integer jemena;
	private Integer lcat;
	private Double actualsSubTotal;
	private Double recouverableSubTotal;
	private Double jemenaSubTotal;
	private Double lcatSubTotal;
	
	//quantityinputbasicdata
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
	
	//quantityinputitermgroup
	private String name;
	private String QuantityInputItermGroupCode;  //code
	
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getQuantityInputItermGroupCode() {
		return QuantityInputItermGroupCode;
	}
	public void setQuantityInputItermGroupCode(String quantityInputItermGroupCode) {
		QuantityInputItermGroupCode = quantityInputItermGroupCode;
	}
	
	

	
	
	
	
}
