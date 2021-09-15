package com.wemccm.common.pojo;

import java.util.List;

public class QuantityInputBasicDataListPojo {

	// from QuantityInputIterm
	private Integer projectId;
	private Integer quantityInputItermTypeId;
	private String code;
	private String description;
	private String unit;

	private List<QuantityInputItermDetailPojo> details;

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public Integer getQuantityInputItermTypeId() {
		return quantityInputItermTypeId;
	}

	public void setQuantityInputItermTypeId(Integer quantityInputItermTypeId) {
		this.quantityInputItermTypeId = quantityInputItermTypeId;
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

	public List<QuantityInputItermDetailPojo> getDetails() {
		return details;
	}

	public void setDetails(List<QuantityInputItermDetailPojo> details) {
		this.details = details;
	}

}
