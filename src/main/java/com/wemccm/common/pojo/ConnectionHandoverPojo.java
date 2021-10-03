package com.wemccm.common.pojo;

import java.util.Date;

public class ConnectionHandoverPojo {

	//customercontribution
	private String projectRef;//inquiryNumber
	private String projectAddress;//supplyAddress
	
	//negotiatedconnection
	private String coustomerBusinesName;//companyTradingName
	private String customerContactName;//customerResponsibleOfficer
	private Date date;//date
	
	
	
	public String getProjectRef() {
		return projectRef;
	}
	public void setProjectRef(String projectRef) {
		this.projectRef = projectRef;
	}
	public String getProjectAddress() {
		return projectAddress;
	}
	public void setProjectAddress(String projectAddress) {
		this.projectAddress = projectAddress;
	}
	public String getCoustomerBusinesName() {
		return coustomerBusinesName;
	}
	public void setCoustomerBusinesName(String coustomerBusinesName) {
		this.coustomerBusinesName = coustomerBusinesName;
	}
	public String getCustomerContactName() {
		return customerContactName;
	}
	public void setCustomerContactName(String customerContactName) {
		this.customerContactName = customerContactName;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	

	
	
	
}
