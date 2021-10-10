package com.wemccm.common.pojo;

import java.util.List;

public class QuantityInputGetdataPojo extends ProjectBasicPojo {

	private List<QuantityInputDetailsPojo> projectData;

	public List<QuantityInputDetailsPojo> getProjectData() {
		return projectData;
	}

	public void setProjectData(List<QuantityInputDetailsPojo> projectData) {
		this.projectData = projectData;
	}

}
