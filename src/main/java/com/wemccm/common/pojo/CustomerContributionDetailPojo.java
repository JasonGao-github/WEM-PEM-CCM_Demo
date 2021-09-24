package com.wemccm.common.pojo;

import java.util.Date;
import java.util.List;

import com.wemccm.common.entity.CustomerContributionAuthoris;

public class CustomerContributionDetailPojo {

	private Integer projectId;
	private Integer customerContributionId;
	// from project
	private String statues;
	private Date createDate;
	private String version;
	// from cc
	private String jemenaWBS;
	private String inquiryNumber;
	private String jemenaSapPmOrder;
	private String zinfraWBS;
	private String projectTitle;
	private String projectType;
	private String supplyAddress;
	private String customerReasonForWorks;
	private String customerScopeOfWork;
	private String jemenaScopeOfWork;
	private String jemenaScopeExclusions;
	private String assumption;

	List<CustomerContributionPricePojo> priceList;

	List<CustomerContributionAuthoris> authorList;

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public Integer getCustomerContributionId() {
		return customerContributionId;
	}

	public void setCustomerContributionId(Integer customerContributionId) {
		this.customerContributionId = customerContributionId;
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

	public String getProjectTitle() {
		return projectTitle;
	}

	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
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

	public List<CustomerContributionPricePojo> getPriceList() {
		return priceList;
	}

	public void setPriceList(List<CustomerContributionPricePojo> priceList) {
		this.priceList = priceList;
	}

	public List<CustomerContributionAuthoris> getAuthorList() {
		return authorList;
	}

	public void setAuthorList(List<CustomerContributionAuthoris> authorList) {
		this.authorList = authorList;
	}

}
