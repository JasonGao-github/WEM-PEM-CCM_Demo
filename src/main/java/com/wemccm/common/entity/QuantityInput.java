package com.wemccm.common.entity;

public class QuantityInput extends BaseEntity {

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

}
