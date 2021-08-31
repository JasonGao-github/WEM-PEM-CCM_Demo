package com.wemccm.common.pojo;

import java.util.Date;

public class NoticePojo extends BaseRequestPojo{
	private Integer id;
	private Integer sender;
	private Integer recipient;
	private String content;
	private String type;
	private Date createTime;
	private String status;
	
	
	public Integer getSender() {
		return sender;
	}
	public void setSender(Integer sender) {
		this.sender = sender;
	}
	public Integer getRecipient() {
		return recipient;
	}
	public void setRecipient(Integer recipient) {
		this.recipient = recipient;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	
}
