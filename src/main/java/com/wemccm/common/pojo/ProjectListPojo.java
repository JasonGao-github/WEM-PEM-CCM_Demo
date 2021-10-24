package com.wemccm.common.pojo;

import com.wemccm.common.entity.CustomerContribution;

public class ProjectListPojo extends CustomerContribution {

	private Integer projectId;

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

}
