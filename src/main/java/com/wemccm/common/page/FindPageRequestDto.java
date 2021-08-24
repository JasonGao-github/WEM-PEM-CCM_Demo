package com.wemccm.common.page;

public class FindPageRequestDto extends PageRequest {

//	private String username;
	private String JemenaWBS;
	private String ProjectTitle;
	private String ProjectType;
	private String JemenaSAPPMOrder;
	private String SupplyAddress;
	private String ZimfraWBS;
	private String InquiryNumber;
	
	public String getJemenaWBS() {
		return JemenaWBS;
	}

	public void setJemenaWBS(String jemenaWBS) {
		JemenaWBS = jemenaWBS;
	}

	public String getProjectTitle() {
		return ProjectTitle;
	}

	public void setProjectTitle(String projectTitle) {
		ProjectTitle = projectTitle;
	}

	public String getProjectType() {
		return ProjectType;
	}

	public void setProjectType(String projectType) {
		ProjectType = projectType;
	}

	public String getJemenaSAPPMOrder() {
		return JemenaSAPPMOrder;
	}

	public void setJemenaSAPPMOrder(String jemenaSAPPMOrder) {
		JemenaSAPPMOrder = jemenaSAPPMOrder;
	}

	public String getSupplyAddress() {
		return SupplyAddress;
	}

	public void setSupplyAddress(String supplyAddress) {
		SupplyAddress = supplyAddress;
	}

	public String getZimfraWBS() {
		return ZimfraWBS;
	}

	public void setZimfraWBS(String zimfraWBS) {
		ZimfraWBS = zimfraWBS;
	}

	public String getInquiryNumber() {
		return InquiryNumber;
	}

	public void setInquiryNumber(String inquiryNumber) {
		InquiryNumber = inquiryNumber;
	}

}
