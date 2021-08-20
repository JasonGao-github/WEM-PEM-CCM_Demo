package com.wemccm.common.entity;

import java.util.Date;

public class CustomerContributionAuthoris extends BaseEntity {

	private int customerContributionId;
	private String details;
	private Date dateOfRevision;
	private String isAuthorised;

	public int getCustomerContributionId() {
		return customerContributionId;
	}

	public void setCustomerContributionId(int customerContributionId) {
		this.customerContributionId = customerContributionId;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public Date getDateOfRevision() {
		return dateOfRevision;
	}

	public void setDateOfRevision(Date dateOfRevision) {
		this.dateOfRevision = dateOfRevision;
	}

	public String getIsAuthorised() {
		return isAuthorised;
	}

	public void setIsAuthorised(String isAuthorised) {
		this.isAuthorised = isAuthorised;
	}

}
