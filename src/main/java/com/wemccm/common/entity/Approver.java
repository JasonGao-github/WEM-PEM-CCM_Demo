package com.wemccm.common.entity;

import java.util.Date;

public class Approver extends BaseEntity {

	private Integer projectId;
	private Integer approverUserId;
	private String approverPost;
	private String approverName;
	private String approverStatus;
	private Date approvalDate;

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public Integer getApproverUserId() {
		return approverUserId;
	}

	public void setApproverUserId(Integer approverUserId) {
		this.approverUserId = approverUserId;
	}

	public String getApproverPost() {
		return approverPost;
	}

	public void setApproverPost(String approverPost) {
		this.approverPost = approverPost;
	}

	public String getApproverName() {
		return approverName;
	}

	public void setApproverName(String approverName) {
		this.approverName = approverName;
	}

	public String getApproverStatus() {
		return approverStatus;
	}

	public void setApproverStatus(String approverStatus) {
		this.approverStatus = approverStatus;
	}

	public Date getApprovalDate() {
		return approvalDate;
	}

	public void setApprovalDate(Date approvalDate) {
		this.approvalDate = approvalDate;
	}

}
