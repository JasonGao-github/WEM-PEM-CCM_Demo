package com.wemccm.common.pojo;

import java.util.Date;

public class projectPojo {
	//project
	private Integer id;
	private String statues;
	private Date createDate;
	private String version;

	
	//CC
//	private Integer projectId;
	private Integer CCid;
	private String projectTitle;
	private String jemenaWBS;
	private String inquiryNumber;
	private String jemenaSapPmOrder;
	private String zinfraWBS;
	private Integer projectTypeId;
	private String supplyAddress;
	
	
	private String customerReasonForWorks;
	private String customerScopeOfWork;
	private String jemenaScopeOfWork;
	private String jemenaScopeExclusions;
	private String assumption;
	
	private Integer customerContributionPriceTypeId;
	
	

	public Integer getCustomerContributionPriceTypeId() {
		return customerContributionPriceTypeId;
	}
	public void setCustomerContributionPriceTypeId(Integer customerContributionPriceTypeId) {
		this.customerContributionPriceTypeId = customerContributionPriceTypeId;
	}
	public Integer getCCid() {
		return CCid;
	}
	public void setCCid(Integer cCid) {
		CCid = cCid;
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
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getStatues() {
		return statues;
	}
	public void setStatues(String statues) {
		this.statues = statues;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
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
