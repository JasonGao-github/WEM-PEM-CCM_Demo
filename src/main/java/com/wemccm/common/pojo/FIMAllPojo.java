package com.wemccm.common.pojo;

import com.wemccm.common.entity.FIMinputItermQuantity;

public class FIMAllPojo extends FIMinputItermQuantity{
	private String description;
	private String subtype;
	private String typename;
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSubtype() {
		return subtype;
	}
	public void setSubtype(String subtype) {
		this.subtype = subtype;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	
	
}
