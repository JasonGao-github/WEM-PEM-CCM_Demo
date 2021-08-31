package com.wemccm.common.entity;

public class CICFinanicalDistribution extends BaseEntity {

	private Integer cicProjectDetailsId;

	private Integer finanicalDistributionItermID;

	private Double price;

	public Integer getCicProjectDetailsId() {
		return cicProjectDetailsId;
	}

	public void setCicProjectDetailsId(Integer cicProjectDetailsId) {
		this.cicProjectDetailsId = cicProjectDetailsId;
	}

	public Integer getFinanicalDistributionItermID() {
		return finanicalDistributionItermID;
	}

	public void setFinanicalDistributionItermID(Integer finanicalDistributionItermID) {
		this.finanicalDistributionItermID = finanicalDistributionItermID;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

}
