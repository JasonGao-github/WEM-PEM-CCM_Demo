package com.wemccm.common.pojo;

import java.util.List;

import com.wemccm.common.entity.Approver;

public class ApproverDataPojo extends ProjectBasicPojo {

	private List<Approver> projectData;

	public List<Approver> getProjectData() {
		return projectData;
	}

	public void setProjectData(List<Approver> projectData) {
		this.projectData = projectData;
	}
//
}
