package com.wemccm.common.entity;

public class ProjectAttachment extends BaseEntity {

	private Integer projectId;

	private String url;

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
