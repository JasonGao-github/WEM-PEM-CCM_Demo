package com.wemccm.common.entity;

import java.util.Date;

public class Project extends BaseEntity {

//	private Integer owner;
	private String statues;
	private String version;
	private Date createDate;

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

//	public Integer getOwner() {
//		return owner;
//	}
//
//	public void setOwner(Integer owner) {
//		this.owner = owner;
//	}

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
