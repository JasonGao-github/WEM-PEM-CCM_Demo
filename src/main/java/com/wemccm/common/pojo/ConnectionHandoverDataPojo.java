package com.wemccm.common.pojo;

import java.util.List;

import com.wemccm.common.entity.AvoidedCostAssetReplacementCosts;
import com.wemccm.common.entity.ConnectionHandover;

public class ConnectionHandoverDataPojo extends ProjectBasicPojo {
			private List<ConnectionHandover> projectData;

			public List<ConnectionHandover> getProjectData() {
				return projectData;
			}

			public void setProjectData(List<ConnectionHandover> projectData) {
				this.projectData = projectData;
			}
			
			
}
