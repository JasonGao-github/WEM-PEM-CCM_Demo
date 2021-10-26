package com.wemccm.common.pojo;

import com.wemccm.common.entity.CICprojectEstimate;

public class CICProjectEstimateDataPojo {

	private String taskName;

	private CICprojectEstimate estimate;

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public CICprojectEstimate getEstimate() {
		return estimate;
	}

	public void setEstimate(CICprojectEstimate estimate) {
		this.estimate = estimate;
	}

}
