package com.wemccm.common.entity;

public class CICFinanicalDistributionIterm extends BaseEntity {

	private Integer finanicalDistributionTypeId;

	private String name;

	public Integer getFinanicalDistributionTypeId() {
		return finanicalDistributionTypeId;
	}

	public void setFinanicalDistributionTypeId(Integer finanicalDistributionTypeId) {
		this.finanicalDistributionTypeId = finanicalDistributionTypeId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
