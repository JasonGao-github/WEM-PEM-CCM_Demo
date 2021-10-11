package com.wemccm.common.page;

public class FindPageRequestDtoPojo extends PageRequest {
	
	private String projectTitle;
	private String jemenaWBS;
	private String inquiryNumber;
	private String jemenaSapPmOrder;
	private String zinfraWBS;
	private String projectType;
	private String supplyAddress;
	public String getProjectTitle() {
		return projectTitle;
	}
	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
	}
	public String getJemenaWBS() {
		return jemenaWBS;
	}
	public void setJemenaWBS(String jemenaWBS) {
		this.jemenaWBS = jemenaWBS;
	}
	public String getInquiryNumber() {
		return inquiryNumber;
	}
	public void setInquiryNumber(String inquiryNumber) {
		this.inquiryNumber = inquiryNumber;
	}
	public String getJemenaSapPmOrder() {
		return jemenaSapPmOrder;
	}
	public void setJemenaSapPmOrder(String jemenaSapPmOrder) {
		this.jemenaSapPmOrder = jemenaSapPmOrder;
	}
	public String getZinfraWBS() {
		return zinfraWBS;
	}
	public void setZinfraWBS(String zinfraWBS) {
		this.zinfraWBS = zinfraWBS;
	}
	public String getProjectType() {
		return projectType;
	}
	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}
	public String getSupplyAddress() {
		return supplyAddress;
	}
	public void setSupplyAddress(String supplyAddress) {
		this.supplyAddress = supplyAddress;
	}
	
}
