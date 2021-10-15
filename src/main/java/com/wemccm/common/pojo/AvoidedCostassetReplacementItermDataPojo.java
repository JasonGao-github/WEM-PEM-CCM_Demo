package com.wemccm.common.pojo;

import java.util.List;

import com.wemccm.common.entity.AvoidedCostassetReplacementIterm;

public class AvoidedCostassetReplacementItermDataPojo  extends ProjectBasicPojo {
	private List<AllAvoidedCostassetPojo> projectData;

	public List<AllAvoidedCostassetPojo> getProjectData() {
		return projectData;
	}

	public void setProjectData(List<AllAvoidedCostassetPojo> projectData) {
		this.projectData = projectData;
	}
	
	
}
