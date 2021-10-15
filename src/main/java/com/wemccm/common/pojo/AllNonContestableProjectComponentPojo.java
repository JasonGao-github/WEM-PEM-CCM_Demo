package com.wemccm.common.pojo;

public class AllNonContestableProjectComponentPojo {
	private Integer id;
	private Integer projectId;
	private Integer nonContestableProjectComponentId;
	private Integer hours;
	private double total;
	private double cost;
	
	private Integer projectTypeId;
	private String description;
	
	
	private String name;
	private String projectManagement;
	private String design;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
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
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	public Integer getProjectTypeId() {
		return projectTypeId;
	}
	public void setProjectTypeId(Integer projectTypeId) {
		this.projectTypeId = projectTypeId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProjectManagement() {
		return projectManagement;
	}
	public void setProjectManagement(String projectManagement) {
		this.projectManagement = projectManagement;
	}
	public String getDesign() {
		return design;
	}
	public void setDesign(String design) {
		this.design = design;
	}
	
}
