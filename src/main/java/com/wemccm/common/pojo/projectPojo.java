package com.wemccm.common.pojo;

public class projectPojo {
	private String projectTitle;
	private String jemenaWBS;
	private String inquiryNumber;
	private String jemenaSapPmOrder;
	private String zinfraWBS;
	private String projectType;
	private String supplyAddress;

	private String customerReasonForWorks;
	private String customerScopeOfWork;
	private String jemenaScopeOfWork;
	private String jemenaScopeExclusions;
	private String assumption;

	//
	private Integer projectId;

	public String getProjectType() {
		return projectType;
	}

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}

	public String getCustomerReasonForWorks() {
		return customerReasonForWorks;
	}

	public void setCustomerReasonForWorks(String customerReasonForWorks) {
		this.customerReasonForWorks = customerReasonForWorks;
	}

	public String getCustomerScopeOfWork() {
		return customerScopeOfWork;
	}

	public void setCustomerScopeOfWork(String customerScopeOfWork) {
		this.customerScopeOfWork = customerScopeOfWork;
	}

	public String getJemenaScopeOfWork() {
		return jemenaScopeOfWork;
	}

	public void setJemenaScopeOfWork(String jemenaScopeOfWork) {
		this.jemenaScopeOfWork = jemenaScopeOfWork;
	}

	public String getJemenaScopeExclusions() {
		return jemenaScopeExclusions;
	}

	public void setJemenaScopeExclusions(String jemenaScopeExclusions) {
		this.jemenaScopeExclusions = jemenaScopeExclusions;
	}

	public String getAssumption() {
		return assumption;
	}

	public void setAssumption(String assumption) {
		this.assumption = assumption;
	}

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

//	public Integer getProjectTypeId() {
//		return projectTypeId;
//	}
//
//	public void setProjectTypeId(Integer projectTypeId) {
//		this.projectTypeId = projectTypeId;
//	}

	public String getSupplyAddress() {
		return supplyAddress;
	}

	public void setSupplyAddress(String supplyAddress) {
		this.supplyAddress = supplyAddress;
	}

}
