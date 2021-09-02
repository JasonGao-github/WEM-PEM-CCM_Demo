package com.wemccm.common.pojo;

public class CurrentOccupyPojo extends BaseRequestPojo{
	private Integer userId;

	private Integer projectId;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}
	
}
