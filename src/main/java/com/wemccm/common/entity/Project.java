package com.wemccm.common.entity;

import java.util.Date;

public class Project extends BaseEntity {
	private Integer owner;
	private String statues;
	private Date createDate;
	
	private String JemenaWBS;
	private String ProjectTitle;
	private String ProjectType;
	private String JemenaSAPPMOrder;
//	private String SupplyAddress;
	//need to comform  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	private String ZimfraWBS;
	private int InquiryNumber;
	
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

	public String getZimfraWBS() {
		return ZimfraWBS;
	}

	public void setZimfraWBS(String zimfraWBS) {
		ZimfraWBS = zimfraWBS;
	}

	public int getInquiryNumber() {
		return InquiryNumber;
	}

	public void setInquiryNumber(int inquiryNumber) {
		InquiryNumber = inquiryNumber;
	}

	public Integer getOwner() {
		return owner;
	}

	public void setOwner(Integer owner) {
		this.owner = owner;
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

}
