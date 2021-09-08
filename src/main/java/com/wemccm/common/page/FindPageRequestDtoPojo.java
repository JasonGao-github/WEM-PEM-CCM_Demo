package com.wemccm.common.page;

public class FindPageRequestDtoPojo extends PageRequest {
	
	private String projectTitle;
	private String jemenaWBS;
	private String inquiryNumber;
	private String jemenaSapPmOrder;
	private String zinfraWBS;
	private Integer projectTypeId;
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
	public Integer getProjectTypeId() {
		return projectTypeId;
	}
	public void setProjectTypeId(Integer projectTypeId) {
		this.projectTypeId = projectTypeId;
	}
	public String getSupplyAddress() {
		return supplyAddress;
	}
	public void setSupplyAddress(String supplyAddress) {
		this.supplyAddress = supplyAddress;
	}
	
}
