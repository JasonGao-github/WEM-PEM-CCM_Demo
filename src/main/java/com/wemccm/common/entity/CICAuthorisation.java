package com.wemccm.common.entity;

import java.util.Date;

public class CICAuthorisation extends BaseEntity {

	private Integer cicProjectDetailsID;
	private Integer useId;
	private String title;
	private Date authorDate;

	public Integer getCicProjectDetailsID() {
		return cicProjectDetailsID;
	}

	public void setCicProjectDetailsID(Integer cicProjectDetailsID) {
		this.cicProjectDetailsID = cicProjectDetailsID;
	}

	public Integer getUseId() {
		return useId;
	}

	public void setUseId(Integer useId) {
		this.useId = useId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getAuthorDate() {
		return authorDate;
	}

	public void setAuthorDate(Date authorDate) {
		this.authorDate = authorDate;
	}

}
