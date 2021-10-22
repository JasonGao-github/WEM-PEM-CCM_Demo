package com.wemccm.common.pojo;

import java.util.List;

public class CICProjectEstimatePojo {

	private String wbsElement;

	private List<CICProjectEstimateDataPojo> pojoList;

	public String getWbsElement() {
		return wbsElement;
	}

	public void setWbsElement(String wbsElement) {
		this.wbsElement = wbsElement;
	}

	public List<CICProjectEstimateDataPojo> getPojoList() {
		return pojoList;
	}

	public void setPojoList(List<CICProjectEstimateDataPojo> pojoList) {
		this.pojoList = pojoList;
	}

}
