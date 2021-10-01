package com.wemccm.common.entity;

public class Design extends BaseEntity{
private String WBSElement;
private String worksDescription;
private String retirements;


public String getWBSElement() {
	return WBSElement;
}
public void setWBSElement(String wBSElement) {
	WBSElement = wBSElement;
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
