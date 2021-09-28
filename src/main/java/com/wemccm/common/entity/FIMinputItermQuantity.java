package com.wemccm.common.entity;

public class FIMinputItermQuantity extends BaseEntity {

	private Integer projectId;
	private Integer fIMinputItermId;
	private Integer acturalQuantity;
	private Integer jenFoundedQuantity;
	private Integer lctaQuantity;
	private double acturalSubTotal;
	private double jenFoundedTotal;
	private double lctaTotal;

	public Integer getActuralQuantity() {
		return acturalQuantity;
	}

	public void setActuralQuantity(Integer acturalQuantity) {
		this.acturalQuantity = acturalQuantity;
	}

	public Integer getJenFoundedQuantity() {
		return jenFoundedQuantity;
	}

	public void setJenFoundedQuantity(Integer jenFoundedQuantity) {
		this.jenFoundedQuantity = jenFoundedQuantity;
	}

	public Integer getLctaQuantity() {
		return lctaQuantity;
	}

	public void setLctaQuantity(Integer lctaQuantity) {
		this.lctaQuantity = lctaQuantity;
	}

	public double getActuralSubTotal() {
		return acturalSubTotal;
	}

	public void setActuralSubTotal(double acturalSubTotal) {
		this.acturalSubTotal = acturalSubTotal;
	}

	public double getJenFoundedTotal() {
		return jenFoundedTotal;
	}

	public void setJenFoundedTotal(double jenFoundedTotal) {
		this.jenFoundedTotal = jenFoundedTotal;
	}

	public double getLctaTotal() {
		return lctaTotal;
	}

	public void setLctaTotal(double lctaTotal) {
		this.lctaTotal = lctaTotal;
	}

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public Integer getfIMinputItermId() {
		return fIMinputItermId;
	}

	public void setfIMinputItermId(Integer fIMinputItermId) {
		this.fIMinputItermId = fIMinputItermId;
	}

}
