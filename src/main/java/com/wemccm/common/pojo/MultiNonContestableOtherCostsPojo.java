package com.wemccm.common.pojo;

import java.util.List;

public class MultiNonContestableOtherCostsPojo {


//		NonContestableOtherCosts
	private Integer projectId;
	private Integer nonContestableOtherCostsItemId;  //key
	private Integer quantity;
	private double total;



	private List<NonContestableOtherCostsDetailPojo> details;



	public Integer getProjectId() {
		return projectId;
	}



	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}



	public Integer getNonContestableOtherCostsItemId() {
		return nonContestableOtherCostsItemId;
	}



	public void setNonContestableOtherCostsItemId(Integer nonContestableOtherCostsItemId) {
		this.nonContestableOtherCostsItemId = nonContestableOtherCostsItemId;
	}



	public Integer getQuantity() {
		return quantity;
	}



	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}



	public double getNonContestableOtherCostsTotal() {
		return total;
	}



	public void setNonContestableOtherCostsTotal(double total) {
		this.total = total;
	}



	public List<NonContestableOtherCostsDetailPojo> getDetails() {
		return details;
	}



	public void setDetails(List<NonContestableOtherCostsDetailPojo> details) {
		this.details = details;
	}
	
	
	
}
