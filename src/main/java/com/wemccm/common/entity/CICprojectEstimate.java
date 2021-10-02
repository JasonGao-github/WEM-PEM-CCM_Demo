package com.wemccm.common.entity;

public class CICprojectEstimate extends BaseEntity {

	private Integer cicProjectTaskId;

	private Integer cicProjectDetailsId;

	private Double labour;

	private Double materials;

	private Double plants;

	private Double contracts;

	private Double total;

	public Integer getCicProjectTaskId() {
		return cicProjectTaskId;
	}

	public void setCicProjectTaskId(Integer cicProjectTaskId) {
		this.cicProjectTaskId = cicProjectTaskId;
	}

	public Integer getCicProjectDetailsId() {
		return cicProjectDetailsId;
	}

	public void setCicProjectDetailsId(Integer cicProjectDetailsId) {
		this.cicProjectDetailsId = cicProjectDetailsId;
	}

	public Double getLabour() {
		return labour;
	}

	public void setLabour(Double labour) {
		this.labour = labour;
	}

	public Double getMaterials() {
		return materials;
	}

	public void setMaterials(Double materials) {
		this.materials = materials;
	}

	public Double getPlants() {
		return plants;
	}

	public void setPlants(Double plants) {
		this.plants = plants;
	}

	public Double getContracts() {
		return contracts;
	}

	public void setContracts(Double contracts) {
		this.contracts = contracts;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

}
