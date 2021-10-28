package com.wemccm.common.entity;

public class AssetRelocation extends BaseEntity {
//	6/13
	
	//='Customer Contribution' inquiryNumber
	private String inquiryNumber;
	//='Customer Contribution'		supplyAddress
	private String worksAddress;
	//='Customer Contribution'		customerScopeOfWork
	private String scopeofWorks;	
	//=Financials!E47
	private String contestableContributionChargesforWorksCompletedbyJemena;
	//=IF('JEN Overheads|Build Up'!B23=TRUE,Financials!J46,"N/A")
	private String nonContestableContributionChargesforWorksCompletedbyJemena;
	//=Financials!D55
	private String jemenaResponsibleOfficer;
	
	
	private Integer projectId;
	
	
	private String typeofDistributionWork;
	
	private String offerValidityPeriod;
	
	private String plannedConstructionPeriod;
	
	private String commencementofWorksObligations;
	
	private String interestRateforOverduePayment;
	
	private String customerResponsibleOfficer;

	private String leaseorEasementifrequired;

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public String getInquiryNumber() {
		return inquiryNumber;
	}

	public void setInquiryNumber(String inquiryNumber) {
		this.inquiryNumber = inquiryNumber;
	}

	public String getWorksAddress() {
		return worksAddress;
	}

	public void setWorksAddress(String worksAddress) {
		this.worksAddress = worksAddress;
	}

	public String getScopeofWorks() {
		return scopeofWorks;
	}

	public void setScopeofWorks(String scopeofWorks) {
		this.scopeofWorks = scopeofWorks;
	}

	public String getContestableContributionChargesforWorksCompletedbyJemena() {
		return contestableContributionChargesforWorksCompletedbyJemena;
	}

	public void setContestableContributionChargesforWorksCompletedbyJemena(
			String contestableContributionChargesforWorksCompletedbyJemena) {
		this.contestableContributionChargesforWorksCompletedbyJemena = contestableContributionChargesforWorksCompletedbyJemena;
	}

	public String getNonContestableContributionChargesforWorksCompletedbyJemena() {
		return nonContestableContributionChargesforWorksCompletedbyJemena;
	}

	public void setNonContestableContributionChargesforWorksCompletedbyJemena(
			String nonContestableContributionChargesforWorksCompletedbyJemena) {
		this.nonContestableContributionChargesforWorksCompletedbyJemena = nonContestableContributionChargesforWorksCompletedbyJemena;
	}

	public String getJemenaResponsibleOfficer() {
		return jemenaResponsibleOfficer;
	}

	public void setJemenaResponsibleOfficer(String jemenaResponsibleOfficer) {
		this.jemenaResponsibleOfficer = jemenaResponsibleOfficer;
	}

	public String getTypeofDistributionWork() {
		return typeofDistributionWork;
	}

	public void setTypeofDistributionWork(String typeofDistributionWork) {
		this.typeofDistributionWork = typeofDistributionWork;
	}

	public String getOfferValidityPeriod() {
		return offerValidityPeriod;
	}

	public void setOfferValidityPeriod(String offerValidityPeriod) {
		this.offerValidityPeriod = offerValidityPeriod;
	}

	public String getPlannedConstructionPeriod() {
		return plannedConstructionPeriod;
	}

	public void setPlannedConstructionPeriod(String plannedConstructionPeriod) {
		this.plannedConstructionPeriod = plannedConstructionPeriod;
	}

	public String getCommencementofWorksObligations() {
		return commencementofWorksObligations;
	}

	public void setCommencementofWorksObligations(String commencementofWorksObligations) {
		this.commencementofWorksObligations = commencementofWorksObligations;
	}

	public String getInterestRateforOverduePayment() {
		return interestRateforOverduePayment;
	}

	public void setInterestRateforOverduePayment(String interestRateforOverduePayment) {
		this.interestRateforOverduePayment = interestRateforOverduePayment;
	}

	public String getCustomerResponsibleOfficer() {
		return customerResponsibleOfficer;
	}

	public void setCustomerResponsibleOfficer(String customerResponsibleOfficer) {
		this.customerResponsibleOfficer = customerResponsibleOfficer;
	}

	public String getLeaseorEasementifrequired() {
		return leaseorEasementifrequired;
	}

	public void setLeaseorEasementifrequired(String leaseorEasementifrequired) {
		this.leaseorEasementifrequired = leaseorEasementifrequired;
	}
	
	
	
}
