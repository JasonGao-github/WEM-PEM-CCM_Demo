package com.wemccm.common.entity;

public class ProjectNonContestableProjectComponent extends BaseEntity {

	private Integer projectId;
	private Integer nonContestableProjectComponentId;
	private Integer hours;
	private double total;

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public Integer getNonContestableProjectComponentId() {
		return nonContestableProjectComponentId;
	}

	public void setNonContestableProjectComponentId(Integer nonContestableProjectComponentId) {
		this.nonContestableProjectComponentId = nonContestableProjectComponentId;
	}

	public Integer getHours() {
		return hours;
	}

	public void setHours(Integer hours) {
		this.hours = hours;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

}
