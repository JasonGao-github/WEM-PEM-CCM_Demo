package com.wemccm.common.entity;

public class CICprojectDetails extends BaseEntity {

	private Integer projectId;

	private String wbsElements;

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public String getWbsElements() {
		return wbsElements;
	}

	public void setWbsElements(String wbsElements) {
		this.wbsElements = wbsElements;
	}

}
