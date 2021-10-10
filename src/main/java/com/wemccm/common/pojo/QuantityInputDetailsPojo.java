package com.wemccm.common.pojo;

import java.util.List;

public class QuantityInputDetailsPojo {

	private Integer quantityInputItermGroupId;

	private List<QuantityInputGroupDataPojo> groupData;

	public Integer getQuantityInputItermGroupId() {
		return quantityInputItermGroupId;
	}

	public void setQuantityInputItermGroupId(Integer quantityInputItermGroupId) {
		this.quantityInputItermGroupId = quantityInputItermGroupId;
	}

	public List<QuantityInputGroupDataPojo> getGroupData() {
		return groupData;
	}

	public void setGroupData(List<QuantityInputGroupDataPojo> groupData) {
		this.groupData = groupData;
	}

}
