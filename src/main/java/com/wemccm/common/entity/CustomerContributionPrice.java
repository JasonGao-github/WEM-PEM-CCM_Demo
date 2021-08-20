package com.wemccm.common.entity;

public class CustomerContributionPrice extends BaseEntity {

	private int customerContributionId;
	private int customerContributionPriceTypeId;
	private double originalPrice;
	private double revisedPrice;

	public int getCustomerContributionId() {
		return customerContributionId;
	}

	public void setCustomerContributionId(int customerContributionId) {
		this.customerContributionId = customerContributionId;
	}

	public int getCustomerContributionPriceTypeId() {
		return customerContributionPriceTypeId;
	}

	public void setCustomerContributionPriceTypeId(int customerContributionPriceTypeId) {
		this.customerContributionPriceTypeId = customerContributionPriceTypeId;
	}

	public double getOriginalPrice() {
		return originalPrice;
	}

	public void setOriginalPrice(double originalPrice) {
		this.originalPrice = originalPrice;
	}

	public double getRevisedPrice() {
		return revisedPrice;
	}

	public void setRevisedPrice(double revisedPrice) {
		this.revisedPrice = revisedPrice;
	}

}
