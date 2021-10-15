package com.wemccm.common.pojo;

import java.util.List;

import com.wemccm.common.entity.AvoidedCostAssetReplacementCosts;

public class AvoidedCostAssetReplacementCostsDataPojo extends ProjectBasicPojo {
	private List<AvoidedCostAssetReplacementCosts> projectData;

	public List<AvoidedCostAssetReplacementCosts> getProjectData() {
		return projectData;
	}

	public void setProjectData(List<AvoidedCostAssetReplacementCosts> projectData) {
		this.projectData = projectData;
	}
	
	
}