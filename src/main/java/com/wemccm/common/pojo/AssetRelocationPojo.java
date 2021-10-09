package com.wemccm.common.pojo;

public class AssetRelocationPojo {
//	6/13
	
	//='Customer Contribution' inquiryNumber
	private Integer inquiryNumber;
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
	
	
	
	public Integer getInquiryNumber() {
		return inquiryNumber;
	}
	public void setInquiryNumber(Integer inquiryNumber) {
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
	
	
}
