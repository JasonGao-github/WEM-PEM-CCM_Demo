package com.wemccm.common.pojo;

import com.wemccm.common.entity.ProjectNonContestableProjectComponent;

public class NccProjectComponentPojo extends ProjectNonContestableProjectComponent {
	//

	private double cost;
	private String description;

	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
