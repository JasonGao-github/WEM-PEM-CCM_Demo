package com.wemccm.common.pojo;

public class projectTypePojo extends BaseRequestPojo {
	private String name;
	private String description;
	private String projectManagement;
	private String design;
	private Integer id;
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
}
