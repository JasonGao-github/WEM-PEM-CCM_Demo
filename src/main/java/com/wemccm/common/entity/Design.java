package com.wemccm.common.entity;

public class Design extends BaseEntity{
	
private Integer projectId;
private String wBSElement;
private String worksDescription;
private String retirements;


public Integer getProjectId() {
	return projectId;
}
public void setProjectId(Integer projectId) {
	this.projectId = projectId;
}

public String getwBSElement() {
	return wBSElement;
}
public void setwBSElement(String wBSElement) {
	this.wBSElement = wBSElement;
}
public String getWorksDescription() {
	return worksDescription;
}
public void setWorksDescription(String worksDescription) {
	this.worksDescription = worksDescription;
}
public String getRetirements() {
	return retirements;
}
public void setRetirements(String retirements) {
	this.retirements = retirements;
}

}
